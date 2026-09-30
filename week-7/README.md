# Nädal 7: Python Pandas — RFM kliendisegmenteerimine

## Eesmärk
- Laadida ja uurida andmeid pandas DataFrame'ina, kasutades `read_csv()`, `head()`, `describe()` ja `info()`.
- Filtreerida, grupeerida ja töödelda andmeid pandas'iga (`boolean indexing`, `groupby`, `merge`) ning mõista nende seost SQL-i `WHERE`, `GROUP BY` ja `JOIN` lausetega.
- Luua interaktiivseid visualiseeringuid Plotly Expressiga (`px.bar`, `px.scatter`, `px.line`).

## Minu roll
**Roll C – Analysis — RFM kliendisegmenteerimine**

Arvutasin iga kliendi kohta **Recency, Frequency ja Monetary** väärtused.  
Määrasin **RFM-skoorid (1–5 kvintiilide alusel)** ning lõin kliendisegmendid: **VIP Champions, Loyal, Potential, At Risk ja Lost**.

## Peamised leiud

- **VIP Champions:** 455 klienti, kes moodustavad **43,6% klientide kogukäibest**.
- **Loyal:** 684 klienti.
- **Potential:** 740 klienti.
- **At Risk:** 512 klienti, kelle puhul on võimalus neid uuesti aktiivseks saada.
- **Lost:** 124 klienti, kelle ostukäitumine viitab kliendisuhte katkemisele.
- RFM-analüüs näitas, et **väike osa kõige väärtuslikumaid kliente annab suure osa kogukäibest**, mistõttu tasub nende hoidmisele eraldi tähelepanu pöörata.

## Äriline tähelepanek

**VIP Champions** kliendid moodustavad **43,6% klientide kogukäibest**, mis näitab nende suurt tähtsust ettevõtte käibele.

**At Risk** segmenti kuuluvate 512 kliendi puhul on võimalik kasutada sihitud **win-back kampaaniaid**, et suurendada nende taasostmise tõenäosust. **Potential** segmendi klientidele võiks pakkuda tegevusi, mis aitavad neil liikuda lojaalsemate ja väärtuslikumate klientide hulka.

## AI kasutamine

Kasutasin AI-d õppimise toetamiseks ja probleemide lahendamisel abi saamiseks. AI aitas mul paremini mõista pandas'e, RFM-analüüsi ja Plotly kasutamist ning selgitas koodi samm-sammult. Samuti kasutasin AI-d teksti ja analüüsi tulemuste sõnastamisel.

Kogu kood ja analüüs on minu enda tehtud ning kontrollisin tulemusi iseseisvalt.

## Failid
