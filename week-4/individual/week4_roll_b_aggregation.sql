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
