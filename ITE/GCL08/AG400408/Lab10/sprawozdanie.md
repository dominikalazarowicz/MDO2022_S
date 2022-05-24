| Imię i nazwisko | Grupa dziekańska | Termin zajęć | Grupa zajęciowa |
| ----------- | ----------- | ----------- | ----------- |
| Adam Głąb | 03 | 23.03.2022r | 08 |

# Sprawozdanie z ćwiczenia laboratoryjnego nr 10


## Zadanie 1

W ramach ćwiczenia wybrano repozytorium [https://github.com/irssi/irssi](https://github.com/irssi/irssi).

Zainstalowano dwie maszyny wirtualne Fedora połaczone ze sobą siecią NAT.

Na jednej z maszyn zainstalowano ansible poprzez `dnf --assumeyes install ansible`.

![zrzut](./screen/z1.png)

Uruchomiono powłokę `sudo -i`.

Stworzono (zmodyfikowano) plik inwentaryzacji `/etc/ansible/hosts` poprzez dodanie adresu drugiej maszyny.

![zrzut](./screen/z2.png)

Podjęto próbę spingowania maszyny poleceniem `ansible all -i ./hosts -m ping`.

![zrzut](./screen/z3.png)

Po sprawdzeniu pliku `/etc/shadow` w drugiej maszynie, do pliku `hosts` dopisano nowe parametry.

![zrzut](./screen/z4_1.png)

Pobrano paczkę `sshpass` w celu uniknięcia błędów przy próbie połaczenia (`dnf --assumeyes install sshpass`). Podjęto kolejną próbę spingowania.

![zrzut](./screen/z5.png)

Proces zakończył się pomyślnie.

## Zadanie 2

Utworzono plik playbooka (`install_irssi.yaml`) klonującego `irssi` i pobierającego zależności.

![zrzut](./screen/z6.png)

Uruchomiono playbooka komendą `ansible-playbook install_irssi.yaml`.

![zrzut](./screen/z7.png)

Proces zakończył się pomyślnie.