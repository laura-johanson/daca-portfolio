# Nädal 2: 	SQL Cleaning

## Eesmärk

Puhastada ja kontrollida UrbanStyle'i `products` tabeli andmekvaliteeti.

Nädala jooksul õppisin:
- tuvastama ja eemaldama duplikaate, kasutades `GROUP BY`, `HAVING` ja `ROW_NUMBER()`;
- leidma ja käsitlema `NULL` väärtusi, kasutades `IS NULL`, `COALESCE()` ja `NULLIF()`;
- puhastama ja ühtlustama andmevälju, kasutades `CAST`, `TRIM()`, `UPPER()/LOWER()` ja kuupäevafunktsioone.

## Minu roll

**Roll C – Tooteandmete puhastaja (Product Data Cleaner)**

Minu ülesanne oli uurida `products` tabelit, leida andmekvaliteedi probleemid ning dokumenteerida puhastamise tulemused.

## Peamised leiud

- `products` tabelis on **362 toodet** ja **9 veergu**.
- Leidsin **12 võimalikku duplikaatset tootenime**, mis esinesid erineva `product_id`-ga.
- Kontrollisin tabeli `NULL` väärtusi ja võimalikke ebajärjekindlusi.
- Kontrollisin hinnavälja võimalike ebaloogiliste väärtuste suhtes.
- Puhastamise jaoks kasutasin `products_test` testkoopiat, et säilitada algandmed muutmata.

## Äriline tähelepanek

Duplikaatsed või ebajärjekindlad tooteandmed võivad mõjutada toodete arvu, müügiaruandlust ja analüüside täpsust.

## Failid
