# Lab04
## Mikołaj Migacz
### Zachowywanie stanu
1. Przygotowałem woluminy : wejściowy 
`docker volume create input`
i wyjściowy 
`docker volume create --name output`
![img](./sc/1.1.PNG)
![img](./sc/1.2.PNG)
2. Podłączam je do kontenera bazowego i uruchamiam go
`docker run -it --name build --mount 'source=input,destination=/input' --mount 'source=output,destination=/output' openjdk:16-alpine sh`
![img](./sc/1.3.PNG)
3. Tworzę tymczasowy kontener i podłączam do niego wolumin wejściowy
`docker run -it --name build --mount 'source=input,destination=/input' alpine sh`
![img](./sc/1.4.PNG)
4. Instaluje gita i klonuje repozytorium
`apk add git`
`git clone <repozytorium>`
![img](./sc/1.5.PNG)
5. Na kontenerze 'build' sprawdzam wolumin wejściowy
![img](./sc/1.6.PNG)
6. Uruchomiłem budowanie projektu
![img](./sc/1.7.PNG)
7. Skopiowałem plik `.jar` do folderu `/output/`
![img](./sc/1.8.PNG)
8. Sprawdziłem dostępność pliku z hosta
![img](./sc/1.9.PNG)
### Eksponowanie portu
1. Stworzyłem dwa kontenery `ip3-server` oraz `ip3-client` i zainstalowałem na nich program `iperf3`
![img](./sc/2.1.PNG)
2. Na kontenerze `ip3-server` ustawiłem nasłuchiwanie na porcie 9000
![img](./sc/2.2.PNG)
3. `ip3-client` połączyłem z `ip3-server` na podstawie IP.
![img](./sc/2.3.PNG)
4. Połączyłem `ip3-server` z hostem
![img](./sc/2.4.PNG)
5. Możemy odczytać przepustowość:
   1. Kontener -> Kontener - około 3.75GB/s,
   2. Host -> Kontener - około 6GB/s
### Instancja Jenkins
1. Tworzę sieć dla Jenkins'a.
![img](./sc/3.1.PNG)
2. Tworze kontener docker:dind używając komend z dokumentacji Jenkins'a.
![img](./sc/3.2.PNG)
3. Stworzyłem `Dockerfile` kopiując zawartość z dokumentacji Jenkins'a.
![img](./sc/3.3.PNG)
4. Zbudowałem obraz z stworzonego pliku `Dockerfile`, kopiując komendę z dokumentacji Jenkins'a.
![img](./sc/3.4.PNG)
5. Uruchomiłem własny obraz Jenkins'a jako kontener używając komendy z dokumentacji Jenkins'a.
![img](./sc/3.5.PNG)
6. Poprawność działania kontenerów.
![img](./sc/3.6.PNG)
7. Otwieram interface graficzny działający w przeglądarce pod adresem `localhost:8080`. Wpisałem hasło zachowane w logach kontenera aby go odblokować. Zainstalowałem domyślną listę pluginów. Następnie stworzyłem administratora.
![img](./sc/3.7.PNG)
8. Wszystko zakończyło się sukcesem.
![img](./sc/3.8.PNG)




