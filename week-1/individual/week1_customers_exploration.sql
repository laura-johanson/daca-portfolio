-- Nädal: 1          Meeskond: UrbanStyle Marketing data          Roll: B Kliendiandmete uurija 

-- 1. Klientide koguarv
-- Leidsin, et UrbanStyle'il on kokku 3150 klienti.
SELECT COUNT(*) AS klientide_arv FROM customers;

-- 2. Customers tabeli struktuur ja olemasolevad andmed
-- Tabelis on 9 veergu: customer_id, first_name, last_name, email,
-- phone, city, registration_date, loyalty_tier ja birth_year.
SELECT * FROM customers LIMIT 10;

-- 3. Linnade jaotus. Distinct näitab ilma duplikaatideta. 
-- Kontrollisin, millised linnad on customers tabelis esindatud.
SELECT DISTINCT city FROM customers;

-- 4. Tallinna klientide uurimine
-- Kuvan Tallinna kliendid ja järjestan nad perekonnanime järgi.
SELECT * FROM customers
WHERE city = 'Tallinn'
ORDER BY last_name ASC
LIMIT 15;

-- 5. Klientide registreerimise periood
-- Esimene klient registreerus 02.01.2020 ja viimane 27.02.2025.
SELECT MIN(registration_date) AS vanim,
       MAX(registration_date) AS uusim
FROM customers;

-- 6. Puuduvad eesnimed
-- Kontrollisin, kas mõnel kliendil puudub eesnimi. Kõik oli olemas.
SELECT COUNT(*) - COUNT(first_name) AS puuduvad_eesnimed
FROM customers;

-- 7. Puuduvad e-mailid
-- Leidsin, et 380 kliendil puudub e-mail.
SELECT COUNT(*) - COUNT(email) AS puuduvad_emailid
FROM customers;

-- 8. Kõikide veergude NULL-väärtused
-- Puuduvad väärtused esinevad email (380) ja loyalty_tier(1260) veergudes.
SELECT
    COUNT(*) - COUNT(customer_id) AS customer_id,
    COUNT(*) - COUNT(first_name) AS first_name,
    COUNT(*) - COUNT(last_name) AS last_name,
    COUNT(*) - COUNT(email) AS email,
    COUNT(*) - COUNT(phone) AS phone,
    COUNT(*) - COUNT(city) AS city,
    COUNT(*) - COUNT(registration_date) AS registration_date,
    COUNT(*) - COUNT(loyalty_tier) AS loyalty_tier,
    COUNT(*) - COUNT(birth_year) AS birth_year
FROM customers; 

------ Lisaülesanded -------

-- 9. E-mailide unikaalsus
-- Kokku on 3150 e-maili ja 2640 unikaalset e-maili. See tähendab, et e-mailide hulgas esineb kordusi. Koos 380 puuduva e-mailiga võib see olla turunduse seisukohalt oluline probleem.  
SELECT COUNT(*) AS kokku_emaile,
       COUNT(DISTINCT email) AS unikaalseid_emaile
FROM customers;

-- 10. Klientide arv linnade kaupa
SELECT city, COUNT(*) AS klientide_arv
FROM customers
GROUP BY city
ORDER BY klientide_arv DESC;

-- 11. Viimase 6 kuu jooksul registreerunud kliendid
-- Kliendid on järjestatud registreerimise kuupäeva järgi, uuemad kliendid eespool.
SELECT * FROM customers
WHERE registration_date >= '2024-07-01'
ORDER BY registration_date DESC;
