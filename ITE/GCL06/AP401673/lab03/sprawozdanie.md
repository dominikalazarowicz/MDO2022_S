## Sprawozdanie lab01


## 1.

Do wykonania build oraz testów wybrano projekt [yara](https://github.com/VirusTotal/yara) który jest narzędziem które pomaga w identyfikowaniu i klasyfikowaniu złośliwego oprogramowania.
Najpierw sklonowano repozytorium a następnie je zbudowano zgodnie z udostępnioną dokumentacją.

Budowanie:

![](1.%20bootstrap.sh.png)

![](2.%20configure.png)

![](3.%20make.png)

Uruchomienie testów za pomocą make check:

![](4.%20testy.png)

## 2.
Projekt yara jest napisany w C więc uruchomiono w dockerze kontener z ubuntu i wykonano następujące czynności.
Doinstalowano potrzebne zależności.

![](5.%20docker%20ubuntu%20zaleznosci.png)

Sklonowano repo

![](6.%20git%20clone%20w%20dockerze.png)

Wykonano builda na ss tylko ostatnie uruchomienie make

![](7.%20make%20w%20dockerze.png)

Uruchomienie testów w dockerze

![](8.%20make%20check%20w%20dockerze.png)


## 3.
Utworzono dockerfile który instaluje zależności oraz przeprowadza builda
Zawartość dockerfila

![](9.%20Dockerfile%20build.png)

Zbudowanie tego dockerfila 

![](10.%20budowanie%20dockerfile%20build.png)

Uruchomiono obraz oraz spróbowano zbudować projekt jednak wyskakuje komunikat o tym, że jest już zbudowany co świadczy o poprawnym działaniu dockerfila

![](11.%20brak%20mozliwosci%20wykonania%20make%20w%20.png)

Utworzono dockerfile.test który korzysta z poprzedniego i uruchamia testy 

Zawartość dockerfila

![](12.%20Dockerfile%20test.png)

Zbudowanie tego dockerfila 

![](13.%20budowanie%20dockerfile%20test.png)

Uruchomienie kontenera powstałego z builda dockerfila który uruchamia testy

![](14.%20run%20dockerfile.test.png)