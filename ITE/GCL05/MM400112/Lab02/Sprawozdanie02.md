# Lab02
## Mikołaj Migacz

1. Przygotowuje git hooks, który rozwiąże najczęstsze problemy z commitami
   1. hook sprawdzający, czy tytuł commita nazywa się `<inicjały><numet indeksu` 
      1. Przechodzę do ukrytego katalogu `hooks` ![img1](./sc/1.1.PNG)
      2. Otwieram plik `commit-msg.sample` i edytuje go ![img1](./sc/1.2.PNG)
      3. Zmieniam nazwę na `commit-msg` ![img1](./sc/1.3.PNG)
      4. Działanie dla niepoprawnych danych ![img1](./sc/1.4.PNG)
      5. Działanie dla poprawnych danych ![img1](./sc/1.5.PNG)
   2. hook sprawdzający, czy w treści commita pada numer labu, właściwy dla zadania
      1. Tak jak poprzednio w ukrytym katalogu `.git` otwieram folder `hooks` i w nim edytuje plik `pre-commit.sample` ![img1](./sc/1.6.PNG)
      2. Zmieniam nazwę pliku na `pre-commit` ![img1](./sc/1.7.PNG)
      3. Działanie dla niepoprawnych danych ![img1](./sc/1.8.PNG)
      4. Działanie dla poprawnych danych (commit zawierający plik o nazwie `Sprawozdanie02`) ![img1](./sc/1.9.PNG)
2. Rozpocząłem przygotowanie środowiska Dockerowego
   1. Zapewniłem dostęp do maszyny wirtualnej przez konsolę "cmd" ![img1](./sc/3.1i2.PNG)
   2. Zainstalowałem Docker Desktop dla systemu Windows oraz WSL ![img1](./sc/3.4.PNG)
   3. Wersja docker'a sprawdzona na WSL ![img1](./sc/3.3.PNG)
3. Działanie środowiska
   1. Pobrałem obraz ubuntu i uruchomiłem kontener z tym obrazem a na nim konsolę ![img1](./sc/4.2.2.PNG)
   2. Wyświetliłem jego numer wersji ![img1](./sc/4.2.3.PNG)
4. Założyłem konto na DockerHub ![img1](./sc/5.PNG)

*Plik "historia_polecen.txt" - Historia poleceń terminala WSL