| Imię i nazwisko | Grupa dziekańska | Termin zajęć | Grupa zajęciowa |
| ----------- | ----------- | ----------- | ----------- |
| Adam Głąb | 03 | 16.03.2022r | 08 |

# Sprawozdanie z ćwiczenia laboratoryjnego nr 2


## Zadanie 1

Poprzez edycję pliku `commit-msg.sample` dostępnego w folderze `hooks/` utworzono dwa odmienne hooki:

1) sprawdza czy tytuł commita to **AG400408**

```bash
#!/bin/bash

MSG="$(cat $1)"
STR="AG400408"

if [[ "$MSG" != $STR ]]; then
 echo "Commit name must be 'AG400408'"
 exit 1
 else
  exit 0
fi 
```
![obraz1](./z1_1.PNG)

2) sprawdza, czy w tytule commita pojawia się numer laboratorium

```bash
#!/bin/bash

MSG="$(cat $1)"

if [[ "$MSG" != *"Lab02"* ]]; then
 echo "Commit name must include 'Lab02'"
 exit 1
 else
  exit 0
fi
```
![obraz2](./z1_2.PNG)

## Zadanie 2

Hooki zostały umieszczone w poprzednim punkcie.

## Zadanie 3

- Używając klienta PuTTY połączono się z wirtualną maszyną z systemem Ubuntu. Praca na sieci akademickiej wymagała utworzenia dodatkowo sieci NAT z przekierowaniem portów.

![obraz4](./z3.PNG)

- Poprzez klienta PuTTY na maszynie zainstalowano Dockera. Wykorzystano komendy:

> `sudo apt install docker.io`
> <br>
> `sudo apt install docker`

## Zadanie 4

Wykazano działanie środowiska:

1) sprawdzono systemowe działanie środowiska

![obraz5](./z4_1.PNG)

![obraz6](./z4_2.PNG)

2) sprawdzono praktyczne działanie środowiska

- Pobrano najnowszy obraz Ubuntu: `sudo docker pull ubuntu`
- Sprawdzono, czy obraz został poprawnie pobrany: `sudo docker images`
- Uruchomiono kontener z terminalem, w nim wypisano parametry ściągniętego systemu Ubuntu: `sudo docker run --name mdo2_ub -it ubuntu`

![obraz7](./z4_3.PNG)

## Zadanie 5

Utworzono konto na Docker Hub.

![obraz8](./z5.PNG)
