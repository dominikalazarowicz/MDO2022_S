## Sprawozdanie Lab03
##### Autor: Dawid Gabryś

1. Na początku należało znaleźć repozytorium z kodem dowolnego oprogramowania, które:
- dysponuje otwartą licencją;
- zawiera Makefile;
- zawiera testy.

W tym przypadku wykorzystałem repozytorium [pod tym linkiem](https://github.com/alt-romes/programmer-calculator).

![Screenshot 1](Screenshot_1.png)

Następnie zainstalowałem odpowiednie brakujące biblioteki dla powyższego programu:

![Screenshot 2](Screenshot_2.png)

I sklonowałem repozytorium:

![Screenshot 3](Screenshot_3.png)

Potem przeprowadziłem build programu poleceniem ```make```:

![Screenshot 4](Screenshot_4.png)

![Screenshot 5](Screenshot_5.png)

Oraz uruchomiłem testy za pomocą skryptu ```run-tests.sh``` (dodatkowo uruchomiłem sam program):

![Screenshot 6](Screenshot_6.png)

![Screenshot 7](Screenshot_7.png)

2. Moim następnym zadaniem było przeprowadzenie buildu w kontenerze. A zatem:

Sprawdziłem dostępne obrazy u mnie:

![Screenshot 8](Screenshot_8.png)

Uruchomiłem kontener:

![Screenshot 9](Screenshot_9.png)

W celu użycia ```git clone``` musiałem zainstalować gita:

![Screenshot 10](Screenshot_10.png)

![Screenshot 11](Screenshot_11.png)

![Screenshot 12](Screenshot_12.png)

Sklonowałem repozytorium:

![Screenshot 13](Screenshot_13.png)

Oraz przeprowadziłem próbę uruchomienia buildu i testów. W tym celu musiałem:
- zainstalować ```make```:

![Screenshot 14](Screenshot_14.png)

- ```gcc```:

![Screenshot 15](Screenshot_15.png)

- oraz potrzebne biblioteki:

![Screenshot 16](Screenshot_16.png)

Po wszystkim uruchomiłem build programu poleceniem ```make```:

![Screenshot 17](Screenshot_17.png)

Oraz uruchomiłem testy:

![Screenshot 18](Screenshot_18.png)

3. Następnym zadaniem było utworzenie dwóch plików ```Dockerfile``` automatyzujących kroki wykonane wcześniej. A zatem:

Utworzyłem plik o nazwie ```DockerFile1``` oraz umieściłem w nim odpowiednie polecenia:

![Screenshot 19](Screenshot_19.png)

Zawartość pliku ```DockerFile1```:

![Screenshot 26](Screenshot_26.png)

Następnie utworzyłem obraz z pliku ```DockerFile1```:

![Screenshot 20](Screenshot_20.png)

![Screenshot 21](Screenshot_21.png)

![Screenshot 22](Screenshot_22.png)

![Screenshot 23](Screenshot_23.png)

Potem utworzyłem drugi plik ```Dockerfile``` o nazwie ```DockeFile2```. Zawartość pliku ```DockerFile2```:

![Screenshot 27](Screenshot_27.png)

Ponownie utworzyłem obraz z pliku ```DockerFile2```:

![Screenshot 24](Screenshot_24.png)

![Screenshot 25](Screenshot_25.png)
