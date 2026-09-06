# Nädal 4: SQL Aggregation

## Eesmärk

- Grupeerida andmeid äriloogika järgi, kasutades `GROUP BY` klauslit.
- Filtreerida grupeeritud tulemusi, kasutades `HAVING` klauslit, ning mõista selle erinevust `WHERE` klausliga.
- Struktureerida keerukamaid päringuid, kasutades CTE-sid ja aknafunktsioone (`Window Functions`).

## Minu roll

**Roll B – Kliendigruppide analüüs (Customer Segmentation)**

Minu ülesanne oli analüüsida klientide ostukäitumist ja kogukäivet.

### Analüüsisin

- klientide kogukäivet ja keskmist kulutust
- klientide jaotamist kulutuse põhjal segmentidesse **VIP, Aktiivsed ja Tavalised**
- suurima kogukäibega ehk **TOP-kliente**
- klientide paiknemist erinevates linnades ja nende panust kogukäibesse
- kliendigruppide tulemusi, et tuua välja olulisemad leiud ja koostada **kliendiprofiili kokkuvõte Annale**

## Peamised leiud

- Kliendid jagunesid kogukäibe põhjal kolmeks segmendiks:

  - **VIP** – kogukäive üle 2500 €
  - **Aktiivsed** – kogukäive üle 500 €
  - **Tavalised** – kogukäive alla 500 €

- **VIP-kliente oli 93**, nende keskmine kogukäive oli **6114 €**.

- **Aktiivseid kliente oli 1629**, nende keskmine kogukäive oli **1129 €**.

- **Tavalisi kliente oli 829**, nende keskmine kogukäive oli **257 €**.

- Kõige rohkem VIP-kliente oli **Tallinnas (29)**, järgnesid **Tartu (21)** ja **Pärnu (17)**.

## Äriline tähelepanek

Kuigi VIP-kliente on arvuliselt vähe, on nende keskmine kogukäive **üle viie korra suurem** kui Aktiivsetel klientidel. Seetõttu tasub ettevõttel pöörata erilist tähelepanu VIP-klientide hoidmisele ja nende lojaalsuse säilitamisele.
