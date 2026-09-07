-- Nädal: 4          Meeskond: UrbanStyle Marketing data          Roll: B ROLL	Kliendigruppide analüüs (Customer Segmentation)

-- 1. Kliendigruppide analüüs CTE-ga.
-- Kasutan CTE-d, et arvutada iga kliendi kogukäive ning seejärel jagada kliendid 
-- kogukäibe põhjal kolme segmenti: VIP (> 2500 €), Aktiivne (> 500 €) ja Tavaline (≤ 500 €).
WITH kliendi_kokkuvote AS (
    SELECT
        c.customer_id,
        c.first_name || ' ' || c.last_name AS nimi,
        c.city,
        COUNT(o.sale_id) AS tellimuste_arv,
        SUM(o.total_price) AS kogukäive
    FROM customers c
    JOIN sales o
        ON c.customer_id = o.customer_id
    GROUP BY
        c.customer_id,
        c.first_name,
        c.last_name,
        c.city
)
SELECT
    nimi,
    city,
    tellimuste_arv,
    kogukäive,
    CASE
        WHEN kogukäive > 2500 THEN 'VIP'
        WHEN kogukäive > 500 THEN 'Aktiivne'
        ELSE 'Tavaline'
    END AS segment
FROM kliendi_kokkuvote
ORDER BY kogukäive DESC;

-- 2. TOP 10 klienti.
-- Leian iga kliendi tellimuste arvu ja kogukäibe ning järjestan kliendid kogukäibe alusel.
-- Arvesse võtan ainult kliendid, kellel on vähemalt 2 tellimust, ning valin 10 suurima kogukäibega klienti.
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(s.sale_id) AS tellimuste_arv,
    SUM(s.total_price) AS kogukäive
FROM sales s
JOIN customers c
    ON s.customer_id = c.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING COUNT(s.sale_id) >= 2
ORDER BY kogukäive DESC
LIMIT 10;

-- 3. Segmentide koondstatistika
-- Päring 1 – segmentide koondstatistika.
-- Kasutan CTE-sid, et arvutada iga kliendi kogukäive ja määrata talle kogukäibe põhjal segment.
-- Seejärel leian iga segmendi klientide arvu ja keskmise käibe.
WITH kliendi_kokkuvote AS (
    SELECT
        c.customer_id,
        c.first_name || ' ' || c.last_name AS nimi,
        c.city,
        SUM(s.total_price) AS kogukäive
    FROM customers c
    JOIN sales s
        ON c.customer_id = s.customer_id
    GROUP BY
        c.customer_id,
        c.first_name,
        c.last_name,
        c.city
),

kliendi_segment AS (
    SELECT
        customer_id,
        nimi,
        city,
        kogukäive,
        CASE
            WHEN kogukäive > 2500 THEN 'VIP'
            WHEN kogukäive > 500 THEN 'Aktiivne'
            ELSE 'Tavaline'
        END AS segment
    FROM kliendi_kokkuvote
)

SELECT
    segment,
    COUNT(*) AS klientide_arv,
    AVG(kogukäive) AS keskmine_käive
FROM kliendi_segment
GROUP BY segment
ORDER BY keskmine_käive DESC;

-- Tulemused:
-- VIP: 93 klienti, keskmine käive 6114 €
-- Aktiivne: 1629 klienti, keskmine käive 1129 €
-- Tavaline: 829 klienti, keskmine käive 257 €

-- Päring 2 – VIP-klientide arv linnade kaupa.
-- Filtreerin välja VIP-kliendid ja loendan nende arvu iga linna kohta.
-- Tulemused järjestan VIP-klientide arvu järgi kahanevalt.
WITH kliendi_kokkuvote AS (
    SELECT
        c.customer_id,
        c.first_name || ' ' || c.last_name AS nimi,
        c.city,
        SUM(s.total_price) AS kogukäive
    FROM customers c
    JOIN sales s
        ON c.customer_id = s.customer_id
    GROUP BY
        c.customer_id,
        c.first_name,
        c.last_name,
        c.city
),

kliendi_segment AS (
    SELECT
        customer_id,
        nimi,
        city,
        kogukäive,
        CASE
            WHEN kogukäive > 2500 THEN 'VIP'
            WHEN kogukäive > 500 THEN 'Aktiivne'
            ELSE 'Tavaline'
        END AS segment
    FROM kliendi_kokkuvote
)

SELECT
    city,
    COUNT(*) AS vip_klientide_arv
FROM kliendi_segment
WHERE segment = 'VIP'
GROUP BY city
ORDER BY vip_klientide_arv DESC;

-- Peamised tulemused:
-- Tallinn: 29 VIP-klienti
-- Tartu: 21 VIP-klienti
-- Pärnu: 17 VIP-klienti

-- 4. Kliendi järjestamine linnas window function abil.
-- Kasutan RANK() window function'it, et järjestada kliendid iga linna sees
-- kogukäibe järgi. PARTITION BY city alustab järjestuse igas linnas uuesti.
WITH kliendi_kokkuvote AS (
    SELECT
        c.customer_id,
        c.first_name || ' ' || c.last_name AS nimi,
        c.city,
        COUNT(o.sale_id) AS tellimuste_arv,
        SUM(o.total_price) AS kogukäive
    FROM customers c
    JOIN sales o
        ON c.customer_id = o.customer_id
    GROUP BY
        c.customer_id,
        c.first_name,
        c.last_name,
        c.city
)

SELECT
    nimi,
    city,
    tellimuste_arv,
    kogukäive,

    RANK() OVER (
        PARTITION BY city
        ORDER BY kogukäive DESC
    ) AS koht_linnas,

    CASE
        WHEN kogukäive > 2500 THEN 'VIP'
        WHEN kogukäive > 500 THEN 'Aktiivne'
        ELSE 'Tavaline'
    END AS segment

FROM kliendi_kokkuvote
ORDER BY kogukäive DESC;
