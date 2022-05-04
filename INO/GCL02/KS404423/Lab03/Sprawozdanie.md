# Zajęcia 03
### 21.03.2022
---

## Kompilacja, budowanie i uruchomienie testów aplikacji Node.js w środowisku WSL2

Na początku próbowałem z silnikiem Godot ale z uwagi na szacunek do zdrowia psychicznego projekt porzuciłem i zmieniłem na [prosty Tetris napisany w Node.js](https://github.com/ernespn/nodejs-calculator).

Program ten oparty jest o wolną licencję MIT License oraz ma napisane testy.

Rozpoczęto poprzez sklonowanie repo lokalnie na WSL2:

```bash
$ git clone https://github.com/robertrypula/simple-tetris.git
```

![image-20220404192900074](Sprawozdanie.assets/image-20220404192900074.png)

Następnie pobrano zależności wymagane do kompilacji:

```bash
$ sudo apt-get update
$ sudo apt-get install nodejs npm
```
![image-20220404193212957](Sprawozdanie.assets/image-20220404193212957.png)

![image-20220404193044246](Sprawozdanie.assets/image-20220404193044246.png)

![image-20220404193106123](Sprawozdanie.assets/image-20220404193106123.png)

Dalej zainstalowano program wraz z zależnościami:

```bash
$ npm install
```


![image-20220404193248012](Sprawozdanie.assets/image-20220404193248012.png)

Następnie uruchomiono aplikację:

```bash
$ npm run dev-node
```

![image-20220404193352860](Sprawozdanie.assets/image-20220404193352860.png)

*(Gra odpaliła się w terminalu na liście zbudowanych elementów)*

Dalej uruchomiono testy:

```bash
$ npm test
```

![image-20220404193459240](Sprawozdanie.assets/image-20220404193459240.png)



---

## Kompilacja, budowanie i uruchomienie projektu w środowisku skonteryzowanym

Następnie wyżej opisane czynności powtórzono tym razem wewnątrz kontenera bazowego. Do tego celu wykorzystano obraz Node.js:

```bash
$ docker pull node
$ docker image list
```

![image-20220404193801939](Sprawozdanie.assets/image-20220404193801939.png)

Kontener `node:latest` wdrożono i podpięto do niego terminal:

```bash
$ docker run --interactive --tty node sh
```

![image-20220404193827377](Sprawozdanie.assets/image-20220404193827377.png)

Następnie zmieniono ścieżkę na katalog domowy `/home`:

```bash
$ cd home
```

![image-20220404194144679](Sprawozdanie.assets/image-20220404194144679.png)

I pobrano kod źródłowy oprogramowania:

```bash
$ git clone https://github.com/robertrypula/simple-tetris.git
$ cd simple-tetris
```

![image-20220404194207458](Sprawozdanie.assets/image-20220404194207458.png)

Dalej zainstalowano program wraz z zależnościami:

```bash
$ npm install
```

 ![image-20220404194538674](Sprawozdanie.assets/image-20220404194538674.png)

Uruchomiono testowo aplikację w terminalu:

```bash
$ npm run dev-node
```

Wyskoczył następujący błąd:

![image-20220404194815208](Sprawozdanie.assets/image-20220404194815208.png)

Szybkie googlowanie wskazało [odpowiedź na StackOverflow](https://stackoverflow.com/questions/69692842/error-message-error0308010cdigital-envelope-routinesunsupported):

<img src="Sprawozdanie.assets/image-20220404194858034.png" alt="image-20220404194858034" style="zoom:67%;" />

Zaproponowany sposób podziałał:

```bash
$ export NODE_OPTIONS=--openssl-legacy-provider
```

![image-20220404194952537](Sprawozdanie.assets/image-20220404194952537.png)

I po uruchomieniu ponownie wyskoczył poprawny obraz gry:

![image-20220404195024912](Sprawozdanie.assets/image-20220404195024912.png)

Dodatkowo jeszcze sprawdzono testy:

```bash
$ npm test
```

![image-20220404195055540](Sprawozdanie.assets/image-20220404195055540.png)



---

## Automatyzacja procesu z użyciem plików Dockerfile

Utworzono: `docker/build/Dockerfile` o następującej treści, którego zadaniem jest:

* Pobranie jako bazy obrazu Node.js
* Sklonowanie repozytorium simple-tetris
* Zbudowanie gry i pobranie zależności 

```dockerfile
FROM node:latest
WORKDIR /home 
RUN git clone https://github.com/robertrypula/simple-tetris.git
WORKDIR /home/simple-tetris
RUN npm install
```

Następnie z pliku tego rozpoczęto proces tworzenia obrazu Dockera:

```bash
$ docker build -f ./docker/build/Dockerfile -t simple-tetris .
```

![image-20220404195831889](Sprawozdanie.assets/image-20220404195831889.png)

![image-20220404195845023](Sprawozdanie.assets/image-20220404195845023.png)

Następnie wylistowano utworzony obraz:

```bash
$ docker image ls -a
```

![image-20220404195906365](Sprawozdanie.assets/image-20220404195906365.png)

Dalej utworzono plik `docker/test/Dockerfile` odpowiedzialny za utworzenie obrazu z `simple-tetris:latest` oraz uruchomienie testów:

```dockerfile
FROM simple-tetris:latest
WORKDIR /home/simple-tetris
RUN npm test
```

```bash
$ docker build -f ./docker/test/Dockerfile -t simple-tetris-test .
```

![image-20220404200117493](Sprawozdanie.assets/image-20220404200117493.png)

Powstałe obrazy wylistowano ponownie:

``` bash
$ docker image list
```

![image-20220404200303808](Sprawozdanie.assets/image-20220404200303808.png)

Dla ostatecznego testu upewniono się, że w Tetrisa ze zbudowanego obrazu można pograć, dlatego wdrożono kontener:

```bash
$ docker run -it simple-tetris bash
```

![image-20220404200723728](Sprawozdanie.assets/image-20220404200723728.png)

Wylistowano również powstały w ten sposób kontener:

```bash
$ docker container list
```

![image-20220404201018579](Sprawozdanie.assets/image-20220404201018579.png)



Różnicą pomiędzy obrazem a kontenerem jest to, że:

* **obraz** (image) - to wzorzec używany do wdrażania kontenerów,
* **kontener** (container) - to instancja utworzona z owego wzorca
