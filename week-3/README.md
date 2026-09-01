# Nädal 3: SQL JOINs

## Eesmärk

Õppida kasutama SQL JOIN-e erinevate tabelite ühendamiseks ning analüüsida klientide ja müügi vahelisi seoseid.

## Minu roll  

**Roll A - Müügi ja klientide ühendamine**

Ühendasin `sales` ja `customers` tabelid `INNER JOIN` abil ning analüüsisin klientide ostukäitumist.

### Analüüsisin

- klientide ostutehinguid
- TOP 10 kliente kogumüügi järgi
- müügitulemusi linnade kaupa
- müügitulemusi lojaalsustaseme järgi
- keskmisest suurema kogumüügiga kliente

## Peamised leiud

- 2551 klienti on teinud vähemalt ühe ostu.
- 762 klienti ehk umbes **30%** ostnud klientidest on üle keskmise kulutajad.
- **1024 ostnud kliendil puudub `loyalty_tier`**, kuigi nende kogumüük on kokku **1 071 805 €**.

## Äriline tähelepanek

Lojaalsustaseme puudumine suure ostumahuga klientidel võib vähendada UrbanStyle'i võimalusi neid kliente lojaalsusprogrammi ja sihitud turundustegevustega kaasata.

## Failid

- [Minu SQL-päringud](./individual/week3_roll_a_joins.sql)
- [Tulemuste screenshotid](./screenshots)
- [Meeskonna JOIN-analüüs](https://github.com/laura-johanson/daca-portfolio/blob/main/week-3/team/week3_team_join_analysis.md)
