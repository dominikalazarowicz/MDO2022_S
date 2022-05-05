# Zajęcia 09
### 2022-05-04 -- 2022-05-06
---
# Przygotowanie wdrożeń nienadzorowanych dla platform z pełnym OS
## Format sprawozdania
- Wykonaj opisane niżej kroki i dokumentuj ich wykonanie
- Na dokumentację składają się następujące elementy:
  - plik tekstowy ze sprawozdaniem, zawierający opisy z każdego z punktów zadania
  - zrzuty ekranu przedstawiające wykonane kroki (oddzielny zrzut ekranu dla każdego kroku)
  - listing historii poleceń (cmd/bash/PowerShell)
- Sprawozdanie z zadania powinno umożliwiać **odtworzenie wykonanych kroków** z wykorzystaniem opisu, poleceń i zrzutów. Oznacza to, że sprawozdanie powinno zawierać opis czynności w odpowiedzi na (także zawarte) kroki z zadania. Przeczytanie dokumentu powinno umożliwiać zapoznanie się z procesem i jego celem bez konieczności otwierania treści zadania.
- Omawiane polecenia dostępne jako clear text w treści, stosowane pliki wejściowe dołączone do sprawozdania jako oddzielne

- Sprawozdanie proszę umieścić w następującej ścieżce: ```<kierunek>/<grupa>/<inicjały><numerIndeksu>/Lab09/Sprawozdanie.md```, w formacie Markdown

## Zadania do wykonania
### Przygotowanie systemu pod uruchomienie
* Przeprowadź instalację systemu Fedora w VM, skonfiguruj użytkowników (użyj haseł, które można bezkarnie umieścić na GitHubie!), sieć, wybierz podstawowy zbiór oprogramowania, optymalnie bez GUI
* Przeprowadź drugą instalację systemu Fedora w VM - celem drugiego systemu będzie wyłącznie serwowanie repozytorium przez HTTP
* Umieść artefakty z projektu na serwerze HTTP
* Na zainstalowanym systemie wykonaj zbiór poleceń umożliwiających pobranie artefaktu, zapisz polecenia

#### Zakres rozszerzony
* Skonfiguruj pipeline tak, by upload na serwer HTTP następował automatycznie
* Jeżeli artefaktem jest plik RPM, serwer HTTP powinien serwować repozytorium (createrepo)

### Instalacja nienadzorowana
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
  
### Infrastructure as a code
* Umieść plik odpowiedzi w repozytorium
* Połącz plik odpowiedzi z ISO instalacyjnym

#### Zakres rozszerzony
* Umieść ISO na serwerze HTTP
* Dodaj krok pipeline'a, wdrażający OS i ISO na wybranym hoście wirtualizacji

