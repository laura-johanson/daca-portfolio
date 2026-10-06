# Nädal 8: Python Pandas — Python APIs

## Eesmärk

- Pääseda ligi UrbanStyle'i andmetele Supabase Python client'i kaudu, kasutades API-päringuid (`select`, `filter`, `order`).
- Kirjutada parameetritega funktsioone, mis automatiseerivad korduvaid analüüsiülesandeid, näiteks iganädalase raporti koostamist ja klientide segmenteerimist.
- Ehitada lihtsustatud andmepipeline, mis ühendab andmete toomise, töötlemise ja visualiseerimise üheks automatiseeritud vooluks.

## Minu roll

**Roll A – API Query + Automation – andmete pärimine ja automatiseerimisskript**

Minu ülesanne oli luua Pythonis funktsioonid, mis pärivad UrbanStyle'i müügi-, kliendi- ja tooteandmed Supabase API kaudu. Selle tulemusena valmis `data_fetcher.py` fail, mis sisaldab funktsioone `fetch_sales`, `fetch_customers` ja `fetch_products`. Funktsioonid tagastavad andmed Pandas DataFrame'ina, et neid saaks edasises analüüsis töödelda.

Grupitöö viimases etapis oli minu ülesanne ühendada Rollide A, B ja C moodulid üheks pipeline'iks ning lisada logimine ja ajastamisloogika.

Töö tervikliku tulemuse saavutamiseks läbisin ka Roll B ja Roll C ülesanded. See aitas mul mõista kogu analüüsiprotsessi algusest lõpuni ning kontrollida, et erinevate etappide tulemused oleksid õiged ja omavahel kooskõlas.

## Peamised leiud

- Supabase API kaudu õnnestus pärida perioodi **01.01.2023–01.03.2025** müügi-, kliendi- ja tooteandmed.
- Päringu tulemusena saadi **10 086 müügirida, 3 150 kliendikirjet ja 362 tootekirjet**.
- Müügiandmete päring kasutab **kuupäevafiltreid ja pagination'it**, et töödelda suuremat andmemahtu.
- Kõik kolm funktsiooni tagastavad andmed **Pandas DataFrame'ina** ja sisaldavad **veakäsitlust**.
- Pipeline ühendab **andmete pärimise, puhastamise, töötlemise ja visualiseerimise** üheks automatiseeritud protsessiks.
- Kogu analüüsivoo saab käivitada **ühe käsuga** ning logimine võimaldab jälgida pipeline'i töö käiku.

## Äriline tähelepanek

Automatiseeritud pipeline vähendab käsitsi tehtavat andmetöötlust ja muudab korduva analüüsi kiiremaks ning vähem veaohtlikuks. Edaspidi võiks automatiseerida näiteks regulaarse müügi- ja kliendisegmentide raporti koostamise ning tulemuste saatmise vastutavale töötajale. Pipeline'i töökindluse suurendamiseks võiks lisada ka automaatse veateavituse, mis annab teada, kui Supabase'iga ühenduse loomine ebaõnnestub või andmete pärimine katkeb.

## AI kasutamine

Kasutasin AI-d õppimise ja arendustöö toetamiseks. AI aitas mul mõista Supabase API päringute, Pandas DataFrame'ide ja pipeline'i ülesehitust, leida ja parandada vigu ning täpsustada sõnastust. Koodi lahendused ja testimise tegin ise ning kontrollisin kõik tulemused oma keskkonnas.

## Failid

