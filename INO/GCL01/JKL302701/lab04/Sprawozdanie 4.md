# Sprawozdanie 4
### 03.04.2022
---
## Zachowywanie stanu

Rozpoczynam od stworzenia dwóch woluminów wejściowego oraz wyjściowego 

![img1](./1.PNG)

Wyświetlam szczegóły o woluminach znajdując potrzebna informacją do dalszej części sprawozdania
`docker volume inspect`
![img2](./2.PNG)

Uruchamiam kontener. Jednocześnie montuję oba volume. Do uruchomienia uzywam polecenia `docker run`. 
Używam flagi `-it` by użyć interaktywnego terminalu.

Po wpisaniu `ls` widzimy utworzone katalogi `vin` i `vout`

![img3](./3.PNG)

Przechodzę na roota 

![img4](./4.PNG)

Klonuję repozytorium na wolumin wejściowy `volin`

![img5](./5.PNG)

Pobieram potrzebne zależności

![img6](./61.PNG)

Buduję projekt

![img37](./7.PNG)

Skopiowałem powstały folder `build` do katalogu `vout`

![img7](./62.PNG)

Po wyłączeniu kontenera pliki z woluminu wyjściowego się zachowały

![img101](./63.PNG)

## Eksponowanie portu

Pobieram odpowiedni obraz dockerowy `docker pull networkstatic/iperf3` 

![img12](./8.PNG)

Uruchamiam 
![img11](./9.PNG)

Sprawdzam nasłuchujące porty 

![img13](./13.PNG)

Sprawdzam IP serwera 

![img14](./11.PNG)

Łączę się z serwerem z drugiego kontenera 

![img15](./12.PNG)

Instaluje ipref3 na hoscie

![img16](./13.PNG)

Łącze się z hosta

![img17](./14.PNG)

Logi z serwera

![img18](./15.PNG)

![img182](./16.PNG)

![img148](./17.PNG)

![img1438](./18.PNG)

Jak widać najmniejszą przepustowość uzyskano z zewnętrznego komputera.

## Instancja Jenkins

Tworzę nową sieć dockerową

![img20](./19.PNG)  

Następnie przeprowadzam instalacje postępując zgodnie z dokumentacją

![img21](./20.PNG)

Tworzę Dockerfile

![img21](./21.PNG)

![img22](./22.PNG)

![img23](./23.PNG)

Jak widać instancja jest uruchomiona

![img25](./24.PNG)

Poleceniem `docker exec` uruchamiam na aktywnym kontenerze interaktywny terminal z bashem. Poleceniem `cat` odczytuje hasło.

![img26](./25.PNG)


Instaluje zalecane wtyczki

![img28](./26.PNG)

Ekran logowania

![img29](./27.PNG)