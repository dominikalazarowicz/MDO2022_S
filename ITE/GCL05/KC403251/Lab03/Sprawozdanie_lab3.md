# SPRAWOZDANIE LABORATORIUM 3

### KOLEJNE KROKI


1. Wybór oprogramowania na zajęcia - sklonowanie repozytorium.

Wybrane oprogramowanie ma otwartą licencję, posiada narzędzie Makefile (npm), są w nim dostępne testy.

![docker](./1.png)

Przeprowadzenie builda programu (doistalowanie odpowiednich zależności)

![docker](./1b.png)

Uruchomienie testów dołączonych do repozytorium.

![docker](./1c.png)

![docker](./1d.png)


2. Przeprowadzenie buildu w kontenerze:

Uruchomienie kontenera.

![docker](./2.png)

Sprawdzenie, czy kontener posiada potrzebne oprogramowanie.

![docker](./2b.png)

Sklonowanie repozytorium.

![docker](./2c.png)

Zbudowanie aplikacji.

![docker](./2d.png)

Uruchomienie tesów.

![docker](./2e.png)

![docker](./2f.png)


3. Stworzenie dwóch plików Dockerfile

Stworzenie plików dockerfile.

![docker](./3.png)

Pierwszy dockerfile przeprowadza wszystkie kroki, aż do builda aplikacji.

![docker](./3a.png)

![docker](./4a.png)

Drugi dockerfile bazuje na pierwszym i uruchamia testy.

![docker](./5a.png)

![docker](./5b.png)

![docker](./5c.png)

Sprawdzenie, czy kontener wdraża się i pracuje poprawnie.

![docker](./6.png)

![docker](./6a.png)

