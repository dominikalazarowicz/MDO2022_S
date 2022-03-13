# Sprawozdanie 1 - Tomasz Ziobrowski

### 1. Zainstalowanie klienta git.
- wykorzystując komendę `sudo apt install git` zainstloawno wersję cli klienta git
- należało wygenerować klucz SSH wykorzystując polecenie `ssh-keygen -t ed25519 -c "thomas.ziobrowski@gmail.com"` w wyniku czego otrzymano klucz publiczny oraz prywatny

![Generowanie klucza SSH](./SS/ssh-gen.png)
- uzyskany klucz publiczny został przypisany do github w ustawieniach konta
- nastepnie należało ustawić dane użytkownika git, pod którymi jest podpisywany podczas operacji 
```console
git config --global user.email "thomas.ziobrowski@gmail.com"
git config --global user.name "ziobrowskyy"

```

### 2. Uruchomienie terminala/konsoli i wykonanie operacji klonowania repozytrorium
- komendą `git clone https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S.git` wykonano klonowanie repozytorium do aktualnego katalogu

![Klonowanie repozytorium](./SS/git-clone.png)

### 3. Otwarcie i zapoznanie się z dokumentem pierwszego ćwiczenia laboratoryjnego
- zmieniono aktualnego brancha na grupowego wykorzystując komendę `git chceckout INO-GCL02`
- w lokalizacji `INO/GCL02/` utworzono katalog `TZ404271` w którym powstał plik `sprawozdanie.md` w komendą `touch`. Utworzono również katalog `SS` w którym będą przechowywane wszystkie utwrzonone zrzuty ekranu
- dodano do sprawozdania opis poprzednich kroków

![Tworzenie sprawozdania](./SS/local-files.png)

![](./SS/.png)