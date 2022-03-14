
# Zajęcia 01
### 2022-03-07 
---
Pierwszym krokiem było przygotowanie środowiska do pracy na zajęciach. Zainstalowałem maszynę wirtualną z systemem Ubuntu na którym za pomocą polecenia `apt-get` zainstalowałem możliwość połączeń poprzez SSH.  Połączyłem maszyne z moim systemem i rozpocząłem prace.

**1.** Skopiowanie repozytorium z github'a na serwer przy pomocy polecenia: 

`$ git clone https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S.git`


![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab01/img/git%20clone.PNG?raw=true)

**2.**  Generowanie klucza SSH:

`$ ssh-keygen -t ed25519 - C artur.wojtasik007@gmail.com -f`

![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab01/img/keygen.PNG?raw=true)

**3.** Utworzenie klucza SSH zabezpieczonego hasłem oraz korzystając z `ecdsa`:

`$ ssh-keygen -t ecdsa -C artur.wojtasik007@gmail.com -f`

![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab01/img/keygen_pass.PNG?raw=true)

**4.** Dodanie kluczy do konta na github korzystając z polecenia `cat`:

![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab01/img/klucze_pub.PNG?raw=true)

Po skonfigurowaniu kluczy i połączniu ich z kontem na github należało również dodać je do `ssh_agent` poleceniem `$ ssh-add key`:

![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab01/img/ssh_agent.PNG?raw=true)

**5.** Kolejnym punktem było skopiowanie repozytorium za pomocą SSH:

`$ git clone git@github.com:InzynieriaOprogramowaniaAGH/MDO2022_S.git`

![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab01/img/clone_ssh.PNG?raw=true)

**6.** Przejście z gałęzi `master` na `main` oraz wejście do grupy ćwiczeniowej `GCL02`:

`$ git checkout main`

`$ git checkout INO-GCL02`

utworzenie brancha z moimi inicjałami:

`git checkout -b AW400107`

![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab01/img/1.PNG?raw=true)

Utworzenie odpowiednich folderów oraz pliku Sprawozdanie.md. Następnie użycie komendy: 

`$ git add .`

aby dodać wszystkie rzeczy. Sprawdzenie poprawności:

![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab01/img/2.PNG?raw=true)

**7.** Utworzenie commita:

`$ git commit -m 'Grupa 02'`

![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab01/img/commit.PNG?raw=true)

**8.** Wysłanie zmian, wykonanie push'a:

`$ git push --set-upstream origin AW400107`

![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab01/img/gitpush.PNG?raw=true)
