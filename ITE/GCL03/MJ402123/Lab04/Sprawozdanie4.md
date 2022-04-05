<h1>Sprawozdanie z zajęć laboratoryjnych 4 Metodyki DevOps</h1>
<strong>Mateusz Janik</strong>

<strong>grupa laboratoryjna 03</strong>

Zadania, które wykonałem:

<strong>Zachowywanie stanu</strong>

- Przygotuj woluminy wejściowy i wyjściowy, o dowolnych nazwach, i podłącz je do
kontenera bazowego, z którego rozpoczynano poprzednio pracę:


Na początku stworzyłem dwa woluminy za pomocą polecenia docker volume create. Pierwszy wejściowy o nazwie volumin_wej i drugi wyjściowy o nazwie volumin_wyj

Następnie wyświetliłem szczegóły stworzonych woluminów.

![Image](s1.JPG " ")

- Uruchom kontener, zainstaluj niezbędne wymagania wstępne (jeżeli istnieją), ale
bez gita
  
Uruchomiłem kontener jednocześnie montując oba woluminy:

![Image](2s.JPG " ")

A następnie zaistalowałem niezbędne wymagania wstępne (takie jak np. gcc)

- Sklonuj repozytorium na wolumin wejściowy

![Image](s3.JPG " ")

![Image](s4.JPG " ")

![Image](s5.JPG " ")

- Zapisz powstałe/zbudowane pliki na woluminie wyjściowym

Otworzyłem nowe cmd i zalogowałem się jako root na mojej maszynie wirtualnej.
Następnie zabisałem zbudowane pliki na woluminie wyjściowym. 

![Image](s6.JPG " ")

<strong>Eksponowanie portu</strong>

- Uruchom wewnątrz kontenera serwer iperf (iperf3)

Zaisntalowałem wszędzie iperf3

![Image](s7.JPG " ")

Ustawiłem serwera

![Image](s8.JPG " ")

- Połącz się z nim z drugiego kontenera, zbadaj ruch

Następnie sprawdziłem nazwę drugiego kontenera

![Image](s9.JPG " ")

A następnie jego IPAdress

![Image](s10.JPG " ")

Połączenie z drugiego kontenera i zapis ruchu między nimi:

![Image](s11.JPG " ")

- Połącz się spoza kontenera (z hosta i spoza hosta)

![Image](s12.JPG " ")

![Image](s13.JPG " ")

- Przedstaw przepustowość komunikacji lub problem z jej zmierzeniem (wyciągnij log
z kontenera)
  
![Image](s14.JPG " ")

<strong>Instancja Jenkins</strong>

- Przeprowadź instalację skonteneryzowanej instancji Jenkinsa z pomocnikiem DIND

Na początku stworzyłem nową sieć dokerową za pomocą polecenie sudo docker network create

Następnie zgodnie z instrukcją znajdującą się w dokumentacji jenkinsa pobierałem i uruchomiłem obraz DIND kontenera.

![Image](s15.JPG " ")

Później stworzyłem plik Dockerfile:

![Image](s16.JPG " ")

Następnie uruchomiłem build:

![Image](s17.JPG " ")

![Image](s18.JPG " ")

Później uruchomiłem powstały obraz:

![Image](s19.JPG " ")

- Zainicjalizuj instację, wykaż działające kontenery, pokaż ekran logowania

Wszedłem na adres localhost:8080 :

![Image](s20.JPG " ")

Następnie według instrukcji znalazłem hasło:

![Image](s22.JPG " ")

Później zainstalowałem zalecane wtyczki:

![Image](s23.JPG " ")

Ekran po utworzeniu konta i zalogowaniu:

![Image](s24.JPG " ")

I na sam koniec potwierdzenie, że kontenery działają:

![Image](s25.JPG " ")










