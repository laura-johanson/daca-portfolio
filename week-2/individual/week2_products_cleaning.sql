-- Nädal: 2          Meeskond: UrbanStyle Marketing data          Roll: C Tooteandmete puhastaja

-- 1. Testkoopia loomine
CREATE TABLE products_test AS SELECT * FROM products;

-- Kontrollisin, kui palju ridu on testkoopias. Tulemus: 362
SELECT COUNT(*) AS ridade_arv FROM products_test;

-- 2. Duplikaatide kontroll
-- Leidsin tootenimed, mis esinevad rohkem kui üks kord. Tulemus: 12 võimalikku duplikaatset tootenime.
SELECT product_name, COUNT(*) AS koopiate_arv
FROM products_test
GROUP BY product_name
HAVING COUNT(*) > 1
ORDER BY koopiate_arv DESC;

-- 3. NULL väärtused kriitilistes väljades
-- Leidsin, et kriitilistes väljades puuduvad NULL väärtused.
SELECT
    COUNT(*) FILTER (WHERE product_name IS NULL OR product_name = '') AS null_nimi,
    COUNT(*) FILTER (WHERE category IS NULL OR category = '') AS null_kategooria,
    COUNT(*) FILTER (WHERE retail_price IS NULL) AS null_jaehind,
    COUNT(*) FILTER (WHERE cost_price IS NULL) AS null_omahind
FROM products_test;

-- 4. Hindade loogilise korrektsuse kontroll
-- Kontrollisin, kas on negatiivseid hindu. Negatiivseid hindu ei leitud.
SELECT COUNT(*) AS negatiivne_hind
FROM products_test
WHERE retail_price < 0;

-- Kontrollisin, kas on äärmuslikke hindu (> 1000€)? Väga suuri (> 1000€) hindu ei leitud.
SELECT product_name, retail_price
FROM products_test
WHERE retail_price > 1000
ORDER BY retail_price DESC;

-- 5. Kategooriate kontroll
-- Tabelis on 5 kategooriat, ebajärjekindlust ei leitud.
SELECT category, COUNT(*) AS arv
FROM products_test
GROUP BY category
ORDER BY category;

-- 6. Puhastamisraport

-- Leitud andmekvaliteedi probleem:
-- 12 võimalikku duplikaatset tootenime.
-- NULL-väärtusi kriitilistes väljades ei leitud.
-- Negatiivseid hindu ei leitud.
-- Äärmuslikke hindu ei leitud.
-- Kategooriate kirjaviisis probleeme ei leitud.

-- 7. Testkoopia puhastamine
-- Kategooriate standardiseerimine juhul, kui andmetes esineb liigseid tühikuid või erinev kirjaviis.
UPDATE products_test
SET category = INITCAP(TRIM(category))
WHERE category != INITCAP(TRIM(category));

-- 8. Kontrollime puhastamise tulemust.
SELECT category, COUNT(*) AS arv
FROM products_test
GROUP BY category ORDER BY category;
