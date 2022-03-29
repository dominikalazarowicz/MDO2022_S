


# Sprawozdanie 3
### 29.03.2022
---
Jako projekt wybrałem nodejs.org, ma otwartą licencję oraz zawiera testy. Link do repozytorium: https://github.com/nodejs/nodejs.org.git .

Przy użyciu `git clone` klonuje repozytorium.

![screen1](./1.PNG)

`sudo apt install npm` - instalacja menedżera pakietów

![screen2](./2.PNG)

Za pomocą poniższych komend zbudowałem program oraz uruchomiłem testy.

```bash
$ npm run build
```
```bash
$ npm run test
```

![screen4](./4.PNG)
![screen5](./5.PNG)


Protokołem SSH łączę się ze swoją wirtualną maszyną a następnie pobieram obraz node

```bash
$ sudo docker pull node
```
![screen6](./6.PNG)



Uruchamiam kontener i podłączam się do niego
```bash
$ sudo docker run --interactive --tty node sh
```


Będąc w kontenerze, powtarzam czynności, klonuje repo, buduje program i włączam testy

![screen7](./7.PNG)
![screen8](./8.PNG)

![screen9](./9.PNG)

![screen10](./10.PNG)



Następnym zadaniem było stworzenie dwóch plików Dockerfile, automatyzujących powyższe kroki.

Pierwszy z nich miał zbudować program.

![screen11](./11.PNG)







`FROM` wybór konkretnego obrazu, 
`RUN` uruchamia komendę klonowania odpowiedniego repozytorium, `WORKDIR` ustawia bezwzględną ścieżkę roboczą,
 `RUN` uruchamia komendę zainstalowania npm oraz rozpoczyna bulid.

Buduję docker o nazwie tag1 przy użyciu stworzonego pliku:

```bash
$ sudo docker build . -f dockerfile1.dockerfile -t tag1
```

![screen12](./12.PNG)

![screen13](./13.PNG)


Drugi z plików Dockerfile miał bazować na pierwszym oraz wykonywać testy.

![screen14](./14.png)


Buduję drugi docker o nazwie img2 :

![screen15](./15.PNG)


![screen16](./16.PNG)


Ostatnim krokiem było wykazanie, że dany kontener hostuję stronę na porcie 8080. 

```bash
$ sudo docker run --interactive --tty node sh

```

![screen17](./17.PNG)

Powyższą komendą wchodzę do kontenera.

```bash
$ npm start
```

![screen18](./18.PNG)



![screen19](./19.PNG)

