# Sprawozdanie 3
### Bartosz Lidwin
1. Przgotowanie repozytorium do testowania konteneryzacji 
[](https://github.com/BartoszLidw/cosdodevopsa "wykorzystane przezemnie repozytorium)

![](./scr/SCR01.png)

2. Przetestowanie budowania  `mvn compiler:compile`
![](./scr/SCR02.png)

3. Przetestowania budowania testów  `mvn test`
![](./scr/SCR03.png)

4. Przygotowanie kontenera i uruchomienie buildu z testemi
![](./scr/Kontener.png)

		przed uruchomieniuem należało dodać 
		#apt add git 
		#git clone https://github.com/BartoszLidw/cosdodevopsa
		#apt add maven
		#apt add openjdk11 
		następnie komendami mvn compiler:compile i mvn test odpaliłem
		buildy które po instalacjach własności powiodły się

![](./scr/SCR04.png)
![](./scr/SCR05.png)
5. Stworzenie docerfile 
```
FROM alpine:latest
RUN apk add git
RUN git clone https://github.com/BartoszLidw/cosdodevopsa
WORKDIR cosdodevopsa
RUN apk add maven
RUN apk add openjdk11
RUN mvn compiler:compile 

```
```
FROM cos_main:latest
RUN mvn test
```
![](./scr/SCR06.png)
![](./scr/SCR07.png)

6. Sprawdzenie działania 
![](./scr/SCR08.png)
jak widać mamy trzy obrazy 
![](./scr/SCR09.png)












