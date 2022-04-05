# Lab 3 - Sprawozdanie
## Adrian Pabiniak

## 1. Zachowywanie stanu

 ### Przygotuj woluminy wejściowy i wyjściowy, o dowolnych nazwach, i podłącz je do kontenera bazowego, z którego rozpoczynano poprzednio pracę
  > docker volume create

  ![](./1.png)

 ### Uruchom kontener
  > docker run -it -v "wejsciowy:/wejsciowy" -v "wyjsciowy:/wyjsciowy" node:13 bash

  ![](./2.png)

 ### Sklonuj repozytorium na wolumin wejściowy
  
  ![](./3.png)

 ### Uruchom build w kontenerze
  > yarn build
 
 ![](./6.png)
 
 ### Zapisz powstałe/zbudowane pliki na woluminie wyjściowym
  > cp -r packages/node/dist ../wyjsciowy
 
  ![](./7.png)

 
## 2. Eksponowanie portu
 
 ### Uruchom wewnątrz kontenera serwer iperf (iperf3)
  Uruchomienie kontenera

  ![](./2.1.png)

  Aktualizacja
  
  ![](./2.2.png)

  Instalacja iperf i net-tools
  
  ![](./2.3.png)

  Uruchomienie serwera
  ![](./2.4.png)


 ### Połącz się z nim z drugiego kontenera, zbadaj ruch

  ![](./2.5.png)

 ### Połącz się spoza kontenera z hosta 

  ![](./2.9.png)

  ![](./2.6.png)

 ### Połącz się spoza kontenera z spoza hosta

  ![](./2.7.png)

  ![](./2.8.png)

 ### Przedstaw przepustowość komunikacji 
  Najszybsza komunikacja odbywała się między hostem a kontenerem, 
  natomiast wolniejsza pomiędzy kontenerami

## 3. Instancja Jenkins

 ### Przeprowadź instalację skonteneryzowanej instancji Jenkinsa z pomocnikiem DIND

  Utworzenie sieci dla Jenkinsa oraz uruchomienie kontenera

  ![](./3.1.png)

  Zbudowanie obrazu z dockerfile

  ![](./3.2.png)

  Uruchomienie kontenera z utworzonego obrazu

  ![](./3.3.png)


 ### Zainicjalizuj instację, wykaż działające kontenery, pokaż ekran logowania

  Zczytanie hasła z logów

  ![](./3.4.png)

  Odblokowanie Jenkinsa

  ![](./3.5.png)

  Instalacja wtyczek

  ![](./3.6.png)

  Ekran powitalny Jenkinsa

  ![](./3.7.png)

  Wykazanie działających kontenerów

  ![](./3.8.png)

 


