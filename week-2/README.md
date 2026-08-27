# Nädal 2: 	SQL Cleaning

## Eesmärk

Puhastada ja kontrollida UrbanStyle'i `products` tabeli andmekvaliteeti.

Nädala jooksul õppisin:
- tuvastama ja eemaldama duplikaate, kasutades `GROUP BY`, `HAVING` ja `ROW_NUMBER()`;
- leidma ja käsitlema `NULL` väärtusi, kasutades `IS NULL`, `COALESCE()` ja `NULLIF()`;
- puhastama ja ühtlustama andmevälju, kasutades `CAST`, `TRIM()`, `UPPER()/LOWER()` ja kuupäevafunktsioone.

## Minu roll

**Roll C – Tooteandmete puhastaja (Product Data Cleaner)**

Minu ülesanne oli uurida `products` tabelit, leida andmekvaliteedi probleemid ning dokumenteerida tulemused.

## Peamised leiud

- `products` tabelis on **362 toodet** ja **9 veergu**.
- Leidsin **12 võimalikku duplikaatset tootenime**, mis esinesid erineva `product_id`-ga.
- Kontrollisin tabeli `NULL` väärtusi ja võimalikke ebajärjekindlusi.
- Kontrollisin hinnavälja võimalike ebaloogiliste väärtuste suhtes.
- Puhastamise jaoks kasutasin `products_test` testkoopiat, et säilitada algandmed muutmata.

## Äriline tähelepanek

Duplikaatsed või ebajärjekindlad tooteandmed võivad mõjutada toodete arvu, müügiaruandlust ja analüüside täpsust.

## Failid

- [Minu SQL-päringud](https://github.com/laura-johanson/daca-portfolio/blob/main/week-2/individual/week2_products_cleaning.sql)
- [Meeskonna puhastamisraport](https://github.com/laura-johanson/daca-portfolio/blob/main/week-2/team/week2_team_cleaning_report.md)
