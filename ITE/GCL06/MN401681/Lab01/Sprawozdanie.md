### Michał Nycz
### INFORMATYKA-TECHNICZNA
### Gr_lab 06

-----
# Sprawozdanie
## Metodyki DevOps lab.nr1

#### 1. Zainstaluj Git i obsługę kluczy SSH:
![git](https://user-images.githubusercontent.com/75485199/158077637-22f684c8-1104-494c-93d9-19a207281087.jpg)
----

#### 2. Sklonuj repozytorium https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S za pomocą HTTPS:
![image](https://user-images.githubusercontent.com/75485199/158077700-31f960a4-39ed-49ce-a0dc-b40c10398295.png)
----

#### 3. Jako uczestnik repozytorium, sklonuj je za pomocą utworzonego klucza SSH:
* Utwórz dwa klucze SSH, inne niż TSA, w tym co najmniej jeden zabezpieczony hasłem
![image](https://user-images.githubusercontent.com/75485199/158077714-c264ebf5-e78a-4970-8248-7f27a1252582.png)
----

#### Klucz ecdsa jest dodatkowo zabezpieczony hasłem.
![image](https://user-images.githubusercontent.com/75485199/158077730-ba153045-4b81-48b8-b509-b468b07b7b66.png)
----

#### * Skonfiguruj klucz SSH jako metodę dostępu do GitHuba, a następnie sklonuj repozytorium z wykorzystaniem protokołu SSH:
![image](https://user-images.githubusercontent.com/75485199/158077776-0052ecf1-c691-4a86-ae70-a5e815a618cc.png)
----

#### UWAGA! przed sklonowaniem repozytorium należy dodać wygenerowane klucze publiczne do swojego konta GitHub (My Profile → Settings → SSH and GPG keys):
![image](https://user-images.githubusercontent.com/75485199/158077791-a21c7fe5-45ed-4c67-807c-7849c38e4aad.png)
----

#### 4. Przełącz się na gałąź main , a potem na gałąź swojej grupy (aby pilnować gałęzi, na której jesteśmy należy używać polecenia: git branch):
![image](https://user-images.githubusercontent.com/75485199/158077818-c8868bc5-b255-4d30-a379-e976d72d05d7.png)
----

#### 5. Przechodząc do odpowiedniego katalogu ćwiczeniowego grupy, utwórz gałąź o nazwie “inicjały & nr indeksu” (u mnie MN401681). Wykorzystuje polecenie:
git checkout -b MN401681:
![image](https://user-images.githubusercontent.com/75485199/158077828-ffac8012-89b5-47f7-bb59-91c2f106fb64.png)
----

#### 6. Rozpocznij pracę na nowej gałęzi:
#### * W katalogu właściwym dla grupy utwórz nowy katalog, także o nazwie “inicjały & nr indeksu” (u mnie MN401681),
#### * W nim także utwórz katalog: lab01,
#### * W nowym katalogu dodaj plik ze sprawozdaniem,
![image](https://user-images.githubusercontent.com/75485199/158077846-52ea7269-2fab-43b1-a29a-3f9dfa680ec0.png)
----

#### Gita trzeba “poinformować” kto my jesteśmy, dlatego w tym celu dodaj swojego maila oraz nazwę do konfiguracji:
![image](https://user-images.githubusercontent.com/75485199/158077867-3d957661-f2a0-4541-9fdf-d2a0b17d4edb.png)
----

#### * Wysyłamy zmiany do zdalnego źródła oraz próbujemy pchnąć naszą gałąź do gałęzi grupowej:
![image](https://user-images.githubusercontent.com/75485199/158077907-85835850-ae40-4755-8464-b4d2835a01fa.png)
----
![image](https://user-images.githubusercontent.com/75485199/158078109-fe740cca-b579-4682-bd3f-a91fbaeb85b7.png)


