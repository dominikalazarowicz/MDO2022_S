# SPRAWOZDANIE LABORATORIUM 3

### KOLEJNE KROKI


1. Wybór oprogramowania na zajęcia - sklonowanie repozytorium.

Wybrane oprogramowanie ma otwartą licencję, posiada narzędzie Makefile (npm), są w nim dostępne testy.

![docker](./screen/1.png)

Przeprowadzenie builda programu (doistalowanie odpowiednich zależności)

![docker](./screen/1b.png)

Uruchomienie testów dołączonych do repozytorium.

![docker](./screen/1c.png)

![docker](./screen/1d.png)


2. Przeprowadzenie buildu w kontenerze:

Uruchomienie kontenera.

![docker](./screen/2.png)

Sprawdzenie, czy kontener posiada potrzebne oprogramowanie.

![docker](./screen/2b.png)

Sklonowanie repozytorium.

![docker](./screen/2c.png)

Zbudowanie aplikacji.

![docker](./screen/2d.png)

Uruchomienie tesów.

![docker](./screen/2e.png)

![docker](./screen/2f.png)


3. Stworzenie dwóch plików Dockerfile

Stworzenie plików dockerfile.

![docker](./screen/3.png)

Pierwszy dockerfile przeprowadza wszystkie kroki, aż do builda aplikacji.

![docker](./screen/3a.png)

![docker](./screen/4a.png)

Drugi dockerfile bazuje na pierwszym i uruchamia testy.

![docker](./screen/5a.png)

![docker](./screen/5b.png)

![docker](./screen/5c.png)

Sprawdzenie, czy kontener wdraża się i pracuje poprawnie.

![docker](./screen/6.png)

![docker](./screen/6a.png)

