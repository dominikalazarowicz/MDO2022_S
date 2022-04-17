# Sprawozdanie 3
### 21.03.2022
---
Wybranym przeze mnie projektem na Github jest nodejs.org . Spełnia on wymagania określone w instrukcji do sprawozdania, tzn. ma otwartą licencję oraz zawiera testy w repozytorium.
Pierwszym krokiem w trakcie realizacji laboratoriów było sklonowanie repozytorium wybranego projektu poprzez `git clone` . Link do repozytorium: https://github.com/nodejs/nodejs.org.git

![screen1](./screen1.png)

Następnie zainstalowałam wymagane zależności, po czym przeprowadziłam build programu oraz uruchomiłam testy jednostkowe z repozyroium. Wywołałam kolejno poniższe komendy:
```bash
$ npm install
```
```bash
$ npm run build
```
```bash
$ npm run test
```

![screen2](./screen2.png)

![screen3](./screen3.png)

![screen4](./screen4.png)

![screen5](./screen5.png)

Za pomocą poniższej komendy pobrałam obraz node:
```bash
$ sudo docker pull node
```
![screen6](./screen6.png)

![screen7](./screen7.png)

Później uruchomiłam kontener i podłączyłam sie do niego TTY celem rozpoczęcia interaktywnej pracy poprzez:

```bash
$ sudo docker run --interactive --tty node sh
```
Będąc w kontenerze, przystąpiłam do wykonania wcześniejszych kroków. Najpierw sklonowałam repozytorium. 

![screen8](./screen8.png)

Następnie pobrałam potrzebne pakiety, uruchomiłam build oraz testy, w ten sam sposób jak na początku nie będąc w kontenerze.

![screen9](./screen9.png)

![screen10](./screen10.png)

![screen11](./screen11.png)

![screen12](./screen12.png)

W następnym kroku przeszłam do wykonania kolejnego podpunktu, jakim było stworzenie dwóch plików Dockerfile, automatyzujących powyższe kroki. Pierwszy z nich miał przeprowadzać wszystkie kroki do builda. 

![screen13](./screen13.png)

![screen14](./screen14.png)

Zawartość pierwszego pliku Dockerfile `dockerfile1.dockerfile` wygląda następująco:

![screen15](./screen15.png)

Dzięki `FROM` następuje wybór konkretnego obrazu, `RUN` odpowiada za klonowanie odpowiedniego repozytorium, `WORKDIR` ustawia bezwględną ścieżkę roboczą, natomiast ostatnie `RUN` powoduje uruchomienie `npm install` i  przeprowadzenie builda.

Następnie sprawdziłam poprawność działania tego pliku, używając w tym celu:
```bash
$ sudo docker build . -f dockerfile1.dockerfile -t tag1
```
![screen16](./screen16.png)

![screen17](./screen17.png)

![screen18](./screen18.png)

Plik Dockerfile działa poprawnie. Nazwa obrazu `tag1` została przeze mnie zmieniona na `img1-build` (dlatego taka też widoczna jest na ostatnim screenie).

Drugi z plików miał bazować na pierwszym oraz wykonywać testy.

![screen20](./screen20.png)

Zawartość drugiego pliku Dockerfile `dockerfile2.dockerfile` wygląda następująco:

![screen19](./screen19.png)

Różni się od pierwszego pliku głównie tym, że wybierany jest aktualny obraz (utworzony wcześniej), a na końcu uruchamiane są testy jednostkowe.

W tym przypadku również sprawdziłam poprawność działania w identyczny sposób.

![screen21](./screen21.png)

![screen22](./screen22.png)

Plik Dockerfile działa poprawnie.

![screen23](./screen23.png)

![screen24](./screen24.png)

Ostatnim krokiem było wykazanie, że dany kontener hostuje stronę na porcie 8080. Dostałam się do działającego kontenera i użyłam komendy:

```bash
$ npm start
```
![screen25](./screen25.png)

![screen27](./screen27.png)

Następnie przejrzałam historię poprzez:
```bash
$ sudo docker ps -a
```
![screen28](./screen28.png)

Można zauważyć, że wszystko przebiegło w sposób poprawny i kontenery są aktywne.

Potwierdzenie, że node.js działa na porcie 8080:

![screen29](./screen29.png)





