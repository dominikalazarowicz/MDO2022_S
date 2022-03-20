# Sprawozdanie lab 2

* Przygotowanie hooka sprawdzającego czy w tytule commita znajduje się numer indeksu wraz z inicjałami oraz numer laboratorium

```sh

#!/bin/sh
if [ "$(grep -E -w -o 'WJ400220' "$1" | wc -l)" != "1" ]
then
	echo Commit musi zawierac identyfikator studenta
	return 1
fi
if [ "$(grep -E -w -o 'Lab02' "$1" | wc -l)" != "1" ]
then
        echo Commit musi zawierac nazwe laboratorium
	return 1
fi
return 0

```

Przykład działania - brak identyfikatora

![](image-20220319210610573.png)

Przykład działania - poprawny identyfikator, brak numeru laboratorium

![](image-20220319210625196.png)

Przykład działania - poprawne wykonanie commita

![image-20220319210650151](image-20220319210650151.png)

* Łączenie do maszyny wirtualnej za pomocą ssh

![image-20220319210920429](image-20220319210920429.png)

* Docker został zainstalowany (wersja 20.10.7)

![image-20220319211131481](image-20220319211131481.png)

* Uruchomienie obrazu ubuntu w kontenerze

![](image-20220319212132400.png)

* Utworzenie konta na Docker Hub

![image-20220319213059646](image-20220319213059646.png)