<h1>Sprawozdanie z zajęć laboratoryjnych 3 Metodyki DevOps</h1>
<strong>Mateusz Janik</strong>

<strong>grupa laboratoryjna 03</strong>

Zadania, które wykonałem:

1.Przez problemy z innymi repozytoriami, które na początku znalazłem, postanowiłem wziąć do tego ćwiczenia repozytorium prezentowane na zajęciach : IRSSI

2.Na początku połączyłem się przez ssh

Następnie sprawdziłem docker images:

![Image](1s.JPG "docker images")

3.Zaopatrzyłem kontener w wymagania wstępne:

Na początku komenda apt-get -y update

![Image](2s.JPG "")

Instalowanie gita:

![Image](przed_3s.JPG "")

Instalowanie gcc:

![Image](3s.JPG "")

Instalowanie make:

![Image](4s.JPG "")

Instalowanie automake:

![Image](5s.JPG "")

Instalowanie mesona:

![Image](6s.JPG "")

3. Sklonowanie repozytorium :

![Image](7s.JPG "")

Okazało się, że trzeba zainstalowałem jeszcze paru potrzebnych rzeczy:

![Image](8s_errory.JPG "")

Dlatego zainstalowałem jeszcze libglib2.0-dev:

![Image](9s.JPG "")

Następnie g++:

![Image](10s.JPG "")

libssl-deva: 

![Image](11s.JPG "")

libtinfo-deva:

![Image](12s.JPG "")

4. Uruchomiłem builda:

![Image](13s.JPG "")
![Image](14s.JPG "")

5. A następnie uruchomiłem testy:

![Image](15s.JPG "")

6. Stworzyłem katalog roboczy o nazwie "Lab03" oraz plik dockerfile "Docker-BLDR": 

![Image](16s.JPG "")

Po paru próbach i problemach mój dockerfile wygląda w następujący sposób:

![Image](21s.JPG "")

7.Stworzyłem obraz na podstawie dockerfile'a :Docker-BLDR":

![Image](19s.JPG "")

![Image](20s.JPG "")

8. Sprawdziłem działanie :

![Image](22s.JPG "")
![Image](23s.JPG "")

9. Włączyłem Irssi

![Image](24s.JPG "")

10. Stworzyłem drugi dockerfile'a do uruchamiania testów

![Image](25s.JPG "")

11. Uruchomiłem builda i otrzymałem wynik testów:

![Image](26.JPG "")
![Image](27s.JPG "")

12. Sprawdziłem zapis w docker images:

![Image](28s.JPG "")
