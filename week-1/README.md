# Nädal 1: SQL Basics

## Eesmärk

Tutvuda UrbanStyle'i andmebaasiga ning saada ülevaade olemasolevatest andmetest.

Nädala jooksul rakendasin SQL-käske `SELECT`, `WHERE`, `ORDER BY`, `DISTINCT` ja `COUNT`.

## Minu roll

**Roll B – Kliendiandmete uurija (Customer Data Explorer)**

Minu ülesanne oli uurida `customers` tabelit ning kontrollida kliendiandmete sisu ja kvaliteeti.

## Peamised leiud

- `customers` tabelis on **3150 klienti** ja **9 veergu**.
- Kliendid on registreerunud ajavahemikul **02.01.2020–27.02.2025**.
- **380 kliendil puudub e-mail**, mis moodustab umbes **12% klientidest**.
- Tabelis esineb korduvaid e-maili väärtusi.
- Puuduvad väärtused esinevad `email` ja `loyalty_tier` veergudes.

## Äriline tähelepanek

Puuduvad ja korduvad e-maili aadressid võivad olla UrbanStyle'i jaoks oluline probleem ning mõjutada e-mailiturunduse võimalusi.

## Failid

- [Minu SQL-päringud](./individual/week1_customers_exploration.sql)
- [Meeskonna Data Landscape](./team/week1_data_landscape.md)
