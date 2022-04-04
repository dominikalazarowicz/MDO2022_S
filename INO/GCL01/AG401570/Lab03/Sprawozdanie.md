### Anna Godek
# Sprawozdanie 
# Laboratorium 3
Pierwszym krokiem było znalezienie repozytorium z kodem dowolnego oprogramowania, które dysponuje otwartą licencją oraz zawiera Makefile i testy. Wybrano kalkulator.
Sklonowano wybrane repozytorium, doinstalowano wymagane zależności, zbudowano program a następnie uruchomiono testy.
Kopiowanie:
```bash
$ git clone https://github.com/alt-romes/programmer-calculator
```
![gitClone1](gitClone1.png)
 
Doinstalowanie ncurses:
```bash
$ sudo apt-get install libncurses5-dev libncursesw5-dev
```
![InstallNcurses](InstallNcurses.png) 
Kompilacja kod i przeniesienie pliku wykonywalnego do katalogu osiągalnego przez $PATH:
```bash
$ make
$ sudo mv -i pcalc /usr/local/bin
```
![make&mv](make&mv.png)
 
Uruchomiono testy, a następnie program:
```bash
$ ./run-tests.sh
```
![tests1](tests1.png)
 
```bash
$ pcalc
```
![pcalc](pcalc.png) 
Uruchomiono dokera i sprawdzono dostępne obrazy:
![images](images.png) 

Uruchomiono kontener i podłączono się do niego TTY celem rozpoczęcia interaktywnej pracy. Zainstalowano również gita.
```bash
$ sudo docker run --interactive --tty ubuntu sh
```
![gitInstall](gitInstall.png)
 
Następnie sklonowano repozytorium:
```bash
# git clone https://github.com/alt-romes/programmer-calculator.git
```
![gitClone2](gitClone2.png)  
Konieczne okazało się również doinstalowanie make i gcc oraz biblioteki ncurses:
```bash
# apt-get install make
# apt-get install gcc 
# apt-get install libncurses5-dev libncursesw5-dev
```
![make&gcc](make&gcc.png)
 
![lib](lib.png)
 
Następnie uruchomiono build programu poleceniem `make` oraz uruchomiono testy za pomocą `bash ./run-tests.sh`
![make2](make2.png)
 
![tests2](tests2.png)
 
W drugim zadaniu należało stworzyć dwa pliki Dockerfile automatyzujące wcześniej wykonywane kroki.
Pierwszy kontener przeprowadza wszystkie kroki aż do builda:
![dockerFile1](dockerFile1.png)
 
FROM – wybranie konkretnego obrazu
RUN – uruchomienie instalacji, klonowania repozytorium i builda
WORKDIR – definiowanie katalogu roboczego kontenera
Utworzono obraz z pliku dockerFile1:
```bash
$ sudo docker build -t img1:latest . -f ./dockerFile1
```
![img1](img1.png)
 
![img1cd](img1cd.png)
 
![dockerImg1](dockerImg1.png) 
Utworzono drugi plik Dockerfile, w którym wybierany jest aktualny obraz utworzony wcześniej, następnie uruchamiane są testy.
![dockerFile2](dockerFile2.png)
 
Utworzenie obrazu z pliku dockerFile2:
```bash
$ sudo docker build -t img2:latest . -f ./dockerFile2a
```
![yyy](yyy.png)
 
Na końcu sprawdzono historię
```bash
$ sudo docker ps -a
```
![last](last.png)
 
