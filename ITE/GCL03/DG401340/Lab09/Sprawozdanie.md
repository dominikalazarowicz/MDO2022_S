## 1. Przygotowanie systemu pod uruchomienie
* Przeprowadź instalację systemu Fedora w VM, skonfiguruj użytkowników (użyj haseł, które można bezkarnie umieścić na GitHubie!), sieć, wybierz podstawowy zbiór oprogramowania, optymalnie bez GUI  
Należy pobrać obraz fedory z tego linku (https://getfedora.org/en/server/download/) i zainstalować system na maszynie wirtualnej. Pobieramy wersję Netinstall.
* Przeprowadź drugą instalację systemu Fedora w VM - celem drugiego systemu będzie wyłącznie serwowanie repozytorium przez HTTP
* Umieść artefakty z projektu na serwerze HTTP
* Na zainstalowanym systemie wykonaj zbiór poleceń umożliwiających pobranie artefaktu, zapisz polecenia

#### Zakres rozszerzony
* Skonfiguruj pipeline tak, by upload na serwer HTTP następował automatycznie
* Jeżeli artefaktem jest plik RPM, serwer HTTP powinien serwować repozytorium (createrepo)

## 2. Instalacja nienadzorowana
* Zlokalizuj plik odpowiedzi z instalacji
* Dodaj do niego elementy odpowiedzialne za wszystkie potrzebne dependencje
* Zdefiniuj repozytoria (co najmniej OS i aktualizacje, najlepiej też depednecje, optymalnie także repozytorium z własnym oprogramowaniem)
```
# Repo
url --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=fedora-$releasever&arch=x86_64
repo --name=updates --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f$releasever&arch=x86_64
```
* Dodaj proces pobierania artefaktu (wybierz co najmniej jedno):
  * Jako czynność atomowa
  * Jako demon uruchamiany po starcie sieci @ boot
  * Jako podłączanie serwera w systemu plików w ramach udziału udostępnionego
  
## 3. Infrastructure as a code
* Umieść plik odpowiedzi w repozytorium
* Połącz plik odpowiedzi z ISO instalacyjnym

#### Zakres rozszerzony
* Umieść ISO na serwerze HTTP
* Dodaj krok pipeline'a, wdrażający OS i ISO na wybranym hoście wirtualizacji