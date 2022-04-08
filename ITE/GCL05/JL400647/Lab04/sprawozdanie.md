# Sprawozdanie - Lab 4



### Zachowywanie stanu

-   Przygotuj woluminy wejściowy i wyjściowy, o dowolnych nazwach, i podłącz je do kontenera bazowego, z którego rozpoczynano poprzednio pracę
Tworzenie volumów 
<img src="1.png"  
alt="img1">
Połączenie do kontenera bazowego
<img src="2.png"  
alt="img1">
-   Uruchom kontener, zainstaluj niezbędne wymagania wstępne (jeżeli istnieją), ale  _bez gita_
<img src="22.png"  
alt="img1">
-   Sklonuj repozytorium na wolumin wejściowy
-   Uruchom build w kontenerze
Repozytorium zostało sklonowane w odpowiednim folderze oraz został odpalony build
<img src="3.png"  
alt="img1">
-   Zapisz powstałe/zbudowane pliki na woluminie wyjściowym

### [](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/main/READMEs/04-Assignment.md#eksponowanie-portu)Eksponowanie portu

-   Uruchom wewnątrz kontenera serwer iperf (iperf3)
-   Połącz się z nim z drugiego kontenera, zbadaj ruch
-   Połącz się spoza kontenera (z hosta i spoza hosta)
-   Przedstaw przepustowość komunikacji lub problem z jej zmierzeniem (wyciągnij log z kontenera)

Aby wykonać te kroki należało zainstalować iperf3, uzyskać ip a następnie na jednym kontenerze należało odpalić nasłuch a na drugim nadawanie.
- <img src="t1.png"  
alt="img1">
kontener -> kontener
- <img src="t2.png"  
alt="img1">
ubuntu -> kontener
- <img src="t3.png"  
alt="img1">

### [](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/main/READMEs/04-Assignment.md#instancja-jenkins)Instancja Jenkins

-   Zapoznaj się z dokumentacją  [https://www.jenkins.io/doc/book/installing/docker/](https://www.jenkins.io/doc/book/installing/docker/)
-   Przeprowadź instalację skonteneryzowanej instancji Jenkinsa z pomocnikiem DIND

Jenkins został zainstalowany krok po kroku zgodnie z instrukcjami na stronie jenkinsa
- <img src="j3.png"  
alt="img1">
- <img src="j4.png"  
alt="img1">
<img src="j1.png"  
alt="img1">
-   Zainicjalizuj instację, wykaż działające kontenery, pokaż ekran logowania

<img src="j2.png"  
alt="img1">

Niestety na ten moment nie mogę dostać się do ekranu logowania ponieważ laby rozwiązuje na VPS 
