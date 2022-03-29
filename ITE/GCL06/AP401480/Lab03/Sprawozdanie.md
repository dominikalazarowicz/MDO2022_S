# Laboratorium 03

## 1. Wykonanie kroków ręcznie

### uruchomiono kontener i sklonowano repo
![](./01.PNG)

### zainstalowano potrzebne dependency
![](./02.PNG)

### uruchomiono build
![](./03.PNG)

### uruchomiono testy
![](./04.PNG)
![](./05.PNG)

## 2. Tworzenie plików Dockerfile

### build image
na podstawie [Dockerfile](./build/Dockerfile) zbudowano obraz kontenera do build'u
![](./06.PNG)

### test image
na podstawie [Dockerfile](./test/Dockerfile) zbudowano kontener do testów, oparty na poprzednim
![](./07.PNG)

## 3. Sprawdzanie działania kontenera

### build container
uruchamiamy kontener w trybie interaktywnym i sprawdzamy wersję debiana, jak widać jest inna niż wersja w WSL
![](./08.PNG)


### test container
uruchamiamy kontener w trybie interaktywnym i sprawdzamy wersję debiana, jak widać jest inna niż wersja w WSL, dodatkowo uruchamiamy testy
![](./09.PNG)
![](./10.PNG)

