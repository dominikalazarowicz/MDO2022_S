# Sprawozdanie 4
Filip Górnicki gr III DevOps 31.03.2022
## 1. Zachowywanie stanu
### 1. Utworzenie woluminów wejściowych i wyjściowych i podłączenie do kontenera:
![](o1.JPG)
### 2. Uruchomienie kontenera i zainstalowanie wymagań:
![](o2.JPG)
</br>![](o3.jpgJPG)
### 3. Sklonowanie repozytorium na wolumin wejściowy:
![](o4.JPG)
</br>![](o5.JPG)
### 4. Uruchomienie buildu w kontenerze:
![](o6.JPG)
### 5. Zapisanie powstałych plików na woluminie wyjściowym:
![](o7.JPG)
</br>![](o8.JPG)
## 2. Eksponowanie portu:
### 1. Uruchomienie kontenera z serwerem iperf3
![](o9.JPG)
</br>![](o10.JPG)
</br>Przy pomocy komendy sudo docker inspect iperf3-server sprawdzono adres IP kontenera:
</br>![](o11.JPG)
### 2. Połączenie się z kontenerem z innego kontenera:
![](o12.JPG)
</br>![](o13.JPG)
</br>Przepustowość: 37.9 Gb/s
### 3. Połączenie się z kontenerem z hosta wewnętrznego:
![](o15.JPG)
</br>![](o14.JPG)
</br>Przepustowość: 43.2 Gb/s
### 4. Połączenie się z kontenerem z hosta zewnętrznego:
![](o16.JPG)
</br>![](o17.JPG)
</br>Przepustowość: 748 Mb/s
</br>Najwyższą przepustowość osiągnięto podczas łączenia poprzez host wewnętrzny, natomiast najmniejszą poczas łączenia przez host zewnętrzny.
## 3. Instalacja Jenkins
### 1. Zapoznanie z dokumentacją
### 2. Instalacja skonteneryzowanej instalacji Jenkinsa z pomocnikiem DIND:
Utworzono sieć oraz pobrano i uruchomiono obraz DIND:
![](o18.JPG)
</br>Utworzono Dockerfile
</br>![](o19.JPG)
### 3. Zainicjalizuj instancję, wykaż działające kontenery, pokaż ekran logowania
Zbudowano obraz przy pomocy Dockerfile
</br>![](o20.JPG)
</br>![](o21.JPG)
</br>Uruchomiono kontener
</br>![](o22.JPG)
</br>Ekran powitalny Jenkinsa
</br>![](o23.JPG)
</br>Działające kontenery
</br>![](o24.JPG)

