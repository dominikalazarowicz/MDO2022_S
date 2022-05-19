# Zajęcia 01
### 2022-03-07 -- 2022-03-11
---
# Wprowadzenie, Git, Gałęzie, SSH
## Zadania do wykonania
1. Zainstaluj klienta Git i obsługę kluczy SSH

Do zainstalowania klienta Git uzylem komendy: sudo apt-get install git oraz utworzylem config za pomoca komendy git config.
Obsluga kluczy SSH byla juz zainstalowana.

2. Sklonuj repozytorium https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S za pomocą HTTPS

Do sklonowania repozytorium uzylem komendy: 
```
git clone <link do repozytorium> <gdzie zapisac> 
```

3. Upewnij się w kwestii dostępu do repozytorium jako uczestnik i sklonuj je za pomocą utworzonego klucza SSH
   - Utwórz dwa klucze SSH, inne niż RSA, w tym co najmniej jeden zabezpieczony hasłem

Do tworzenia kluczy SSH uzywamy komendy ssh-keygen
Ja uzylem algorytmu ed25519 za pomoca komendy: 
```
ssh-keygen -t ed25519 -C <mail>
```
   - Skonfiguruj klucz SSH jako metodę dostępu do GitHuba

Wejscie na stronie GitHuba w Settings -> SSH and GPG keys i tam dodajemy klucz/e.
Nastepnie utworzylem ssh-agenta oraz przekazalem mu klucz za pomoca komend:
```
	- eval "$(ssh-agent -s)"
	- ssh-add <sciezka>
```
   - Sklonuj repozytorium z wykorzystaniem protokołu SSH

Uzycie: 
```
git clone <link z code, clone ssh>
```
4. Przełącz się na gałąź ```main```, a potem na gałąź swojej grupy (pilnuj gałęzi i katalogu!)

Do sprawdzenia na ktorej galezi sie znajdujemy uzywamy: git branch
Do przelaczania sie pomiedzy galeziami uzywamy komendy: git checkout <nazwa>
```
	- git checkout main
	- git checkout INO-GCL01
```
5. Utwórz gałąź o nazwie "inicjały & nr indeksu" np. ```KD232144```. Miej na uwadze, że odgałęziasz się od brancha grupy!

Do utworzenia nowej galezi uzywamy komendy git checkout, lecz w tym przypadku uzyjemy -b.
```
	- git checkout -b JM404178
```
6. Rozpocznij pracę na nowej gałęzi
   - W katalogu właściwym dla grupy utwórz nowy katalog, także o nazwie "inicjały & nr indeksu" np. ```KD232144```

Tutaj uzylem sklonowanego repozytorium do utworzenia folderu.

![JM404178](https://i.imgur.com/T8D31un.png)

   - W nim także utwórz katalog: Lab01
   
![Lab01](https://i.imgur.com/xqd9ShL.png)

   - W nowym katalogu dodaj plik ze sprawozdaniem
   
![Sprawko](https://i.imgur.com/pn32Cqd.png)

   - Dodaj zrzuty ekranu (jako inline)
   
Done

   - Wyślij zmiany do zdalnego źródła
   - Spróbuj wciągnąć swoją gałąź do gałęzi grupowej
   - Zaktualizuj sprawozdanie i zrzuty o ten krok i wyślij aktualizację do zdalnego źródła (na swojej gałęzi)
   
   Nieudana proba mergowania.

![Merge attempt](https://i.imgur.com/rkofOfb.png)

7. Wystaw Pull Request do gałęzi grupowej
8. Zgłoś zadanie (Teams assignment - jeżeli dostępne)
