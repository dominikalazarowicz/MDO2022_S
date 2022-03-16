| Imię i nazwisko | Grupa dziekańska | Termin zajęć | Grupa zajęciowa |
| ----------- | ----------- | ----------- | ----------- |
| Adam Głąb | 03 | 09.03.2022r | 08 |

# Sprawozdanie z ćwiczenia laboratoryjnego nr 1


## Zadanie 1

Podczas wykonywania ćwiczenia wykorzystano WSL z zainstalowanym Ubuntu 20.04. System posiadał uprzednio zainstalowany Git oraz obsługę SSH.

Wykorzystując komendę `ssh-keygen -y -f ~/.ssh/klucz` wygenerowano klucz prywatny i publiczny. W celu zachowania zgodności nazw, nazwy kluczy zmieniono odpowiednio na **id_rsa**. 

![obraz1](./z1_1.PNG)

Klucz publiczny został skopiowany i umieszczony w odpowiedniej sekcji w ustawieniach profilu GitHub.

![obraz2](./z1_2.PNG)

## Zadanie 2

Utworzono pomocniczy folder **temp/** do którego sklonowano repozytorium poprzez https poleceniem `git clone https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S.git`.

![obraz3](./z2.PNG)

## Zadanie 3

Utworzono folder **clones/** do którego następnie sklonowano repozytorium z wykorzystaniem polecenia `git clone git@github.com:InzynieriaOprogramowaniaAGH/MDO2022_S.git`. Wykorzystanie tego typu klonowania było możliwe dzięki wykorzystaniu klucza publicznego SSH wygenerowanego w pierwszym punkcie.

![obraz4](./z3.PNG)

## Zadanie 4

Przełączono się na gałąź main -> gałąź grupy (w tym przypadku GCL08) kolejno komendami:

> `git checkout main`

![obraz5](./z4_1.PNG)

> `git checkout ITE-GCL08`

![obraz6](./z4_2.PNG)

## Zadanie 5

Utworzono nową gałąź wykorzystując polecenie `git checkout -b AG400408`.

![obraz7](./z5.PNG)

## Zadanie 6

Rozpoczęto pracę na gałęzi:

- przeniesiono się do folderu głównego gałęzi i utworzono w nim folder o takiej samej nazwie jak gałąź (**AG400408**),

![obraz8](./z6_1.PNG)

- w nazwanym folderze utworzono nowy folder Lab01,

![obraz9](./z6_2.PNG)

- w folderze Lab01 umieszczono plik ze sprawozdaniem i zrzuty,

![obraz10](./z6_3.PNG)

- wysłano zmiany do zdalnego źródła,

![obraz 11](./z6_4.PNG)

- podjęto próbę wciągnięcia gałęzi do gałęzi grupowej

![obraz 12](./z7.png)

## Zadanie 7

Wystawiono pull request do gałęzi grupowej (widoczne na ostatnim zrzucie).
