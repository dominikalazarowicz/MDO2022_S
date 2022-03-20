# Rafał Olech - Sprawozdanie z laboratorium 2

## Cel ćwiczeń laboratoryjnych:

Celem ćwiczeń było przygotowanie środowiska Dockerowego oraz zapoznanie się z jego podstawową obsługą i działaniem. Utworzenie git hook'a rozwiązującego najczęstsze problemy z commitami. 

## Wykonanie ćwiczenia:

1. Przygotowanie git hook sprawdzającego, czy tytuł commita jest poprawnie nazwany, a więc składa się z moich inicjałów oraz numeru indeksu oraz sprawdzającego, czy w treści commita pada numer laboratorium, który jest właściwy dla zadania.


 * Utworzenie kopii w folderze hooks pliku o nazwie commit-msg.sample. Utworzona została kopia o tej samej nazwie, lecz bez rozszerzenia .sample.

 * Uczynienie pliku commit-msg jako wykonywalny za pomocą komendy `chmod +x commit-msg`.    

![img](lab2_1.png)


 * Zawartość pliku commit-msg:


```bash
#!/bin/sh
if [ "$(grep -E -w -o 'RO400876' "$1" | wc -l)" != "1" ]
then
    echo Not correct name of commit.
    return 1
fi
if [ $(grep -E -w -o 'Lab[0-15]*' "$1" | wc -l) != "1" ]
then
    echo  Not correct number of lab.
    return 1
fi
return 0
```

 * Wpisanie niepoprawnej nazwy commita w celu sprawdzenia działania utworzonego hook'a:

 ![img](lab2_5.png)








