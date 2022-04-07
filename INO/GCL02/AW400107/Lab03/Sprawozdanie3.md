
# Zajęcia 03
### 2022-03-21 
---
**1.** Wybór oprogramowania 

 - Projekt który wybrałem to `irssi`,
 - Repozytorium jest projektem otwartym i ogólnie dostępnym (https://github.com/irssi/irssi). 
 - W plikach posiada swój `makefile`,
 - Zawiera zdefiniowane i obecne w repozytorium testy.
 
![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab03/irssi.PNG?raw=true)

**2.** Sklonowanie repozytorium oraz doinstalowanie odpowiednich zależności.

 - Klonowanie repozytorium `$ git clone https://github.com/irssi/irssi.git`
 
 ![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab03/klonowanie1.PNG?raw=true)

 - Aby móc wykonać Build potrzebne było doinstalowanie odpowiednich zależności, użyłem do tego odpowiednich komend:
`$ sudo apt-get install libglib2.0-dev`
`$ sudo apt-get install libssl-dev`
`$ sudo apt-get install libutf8proc-dev`
`$ sudo apt-get install libtinfo-dev`
`$ sudo apt-get install libncurses5-dev libncursesw5-dev`
`$ sudo apt-get install libghc-terminfo-dev`

**3.** Wykonanie Build'a oraz rozpoczęcie testów.

 - Po doinstalowaniu wszystkich potrzebnych zależności można było użyć komendy `$ sudo meson Build`
 
![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab03/mesonBuild1.PNG?raw=true)

![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab03/mesonBuild2.PNG?raw=true)

 - Wykonanie przebiegło pomyślnie, można było przejść do katalogu Build komendą `$ cd Build`oraz wykonać testy komendą `$ sudo meson test`
 
![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab03/mesonTest.PNG?raw=true)

Jak widać wszystkie testy przebiegły poprawnie.

**4.** Powtórzenie wszystkich kroków korzystając z kontenera. Jako system w kontenerze wybrałem fedore. 

 - Wpisanie komend odpowiednio po sobie `$ sudo docker pull fedora` oraz `$ sudo docker images` aby zobaczyć czy obraz rzeczywiście jest utworzony.

![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab03/fedora.PNG?raw=true)

 - Instalacja odpowiednich zależności:
`$ dnf -y install dnf`
`$ dnf -y install git`

 - Klonowanie repozytorium
 
![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab03/klonowanie2.PNG?raw=true)

**5.** Build oraz testy w kontenerze.

 - Podstawowa wersja nie posiada żadnych zależności dlatego każdą z osobna trzeba było doinstalować korzystając z komendy `$ yum -y install gcc gcc-c++ make automake wget meson ca-c* libgcrypt* glib2* utf8proc* openssl-devel ncurses* libgcrypt* glib2-devel utf8proc* openssl-devel ncurses*` zainstalowałem wszystkie potrzebne składniki które będąpotrzebne do wykonania Build'a oraz testów.

![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab03/punkt5.PNG?raw=true)

 - Przejście do katalogu `/irssi` i wykonanie `$ meson Build` 

![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab03/mesonBuildKONT.PNG?raw=true)

 - Przejście do katalogu `/Build` i przeprowadzenie testów `$ meson test`

![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab03/mesontestKONT.PNG?raw=true)

**6.** Tworzenie plików dockerfile.

 - Na początku wybierany jest najnowszy obraz kontenera poprzez `FROM`. Kolejno kopiowane jest repozytorium, polecenie gitowe uruchamiane poprzez `RUN`. Dalej instalowane są zależności i uruchamiany build polecenia uruchamiane poprzez `RUN`. Za pomocą komendy `WORKDIR` ustawiana jest ścieżka robocza.
 
 Pierwszy plik służący do budowania programu: 
 
![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab03/firstDOCKER.PNG?raw=true)
 
 Drugi plik służący do włączenia testów:
 
 ![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab03/secondDOCKER.PNG?raw=true)
 - Jak widać testy wypadły poprawnie, teraz można sprawdzić komendą `$ sudo docker images` czy poprawnie utworzyło obrazy.
 
![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab03/koncoweIMAGES.PNG?raw=true)
 
 - Ostateczny sprawdzian, uruchomienie kontenera 
 
![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab03/uruchomienie.PNG?raw=true)
