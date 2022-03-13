### Michał Nycz
### INFORMATYKA-TECHNICZNA
### Gr_lab 06

-----
# Sprawozdanie
## Metodyki DevOps lab.nr1

1. Zainstaluj Git i obsługę kluczy SSH:
2. Sklonuj repozytorium https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S za pomocą HTTPS:
3. Jako uczestnik repozytorium, sklonuj je za pomocą utworzonego klucza SSH:
* Utwórz dwa klucze SSH, inne niż TSA, w tym co najmniej jeden zabezpieczony hasłem
Klucz ecdsa jest dodatkowo zabezpieczony hasłem.
* Skonfiguruj klucz SSH jako metodę dostępu do GitHuba, a następnie sklonuj repozytorium z wykorzystaniem protokołu SSH:
UWAGA! przed sklonowaniem repozytorium należy dodać wygenerowane klucze publiczne do swojego konta GitHub (My Profile → Settings → SSH and GPG keys):
4. Przełącz się na gałąź main , a potem na gałąź swojej grupy (aby pilnować gałęzi, na której jesteśmy należy używać polecenia: git branch):
5. Przechodząc do odpowiedniego katalogu ćwiczeniowego grupy, utwórz gałąź o nazwie “inicjały & nr indeksu” (u mnie MN401681). Wykorzystuje polecenie:
git checkout -b MN401681:
6. Rozpocznij pracę na nowej gałęzi:
* W katalogu właściwym dla grupy utwórz nowy katalog, także o nazwie “inicjały & nr indeksu” (u mnie MN401681),
* W nim także utwórz katalog: lab01,
* W nowym katalogu dodaj plik ze sprawozdaniem,
Gita trzeba “poinformować” kto my jesteśmy, dlatego w tym celu dodaj swojego maila oraz nazwę do konfiguracji:
* Wysyłamy zmiany do zdalnego źródła
