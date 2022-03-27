
# Zajęcia 02
### 2022-03-14 
---
**1.** Zajęcia rozpocząłem od przeanalizowania dostępnych hook'ów w repozytorium w folderze `.git/hooks`. 

![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab02/img/lista_hook.PNG?raw=true)

Utworzenie hook'ów w katalogu `/hooks`:
![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab02/img/tworzenie_hook.PNG?raw=true)
 - Hook sprawdzający, czy tytuł commit'a nazywa się `<inicjały><numer indeksu>`
 Do tego zadania wykorzystano hook'a o nazwie `commit-msg`. Zgodnie z  dokumentacją hook ten jest uruchamiany przy próbie `git commit`, sprawdza czy wiadomość commita spełnia ustalone warunki. Kod hook'a:
 ![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab02/img/commitmsg.PNG?raw=true)
 
 - Hook sprawdzający czy tworzenie commita następuje w folderze Lab02. Do tego zadanie posłużyłem się hook'iem `pre-commit`. Kod hook'a:
 -![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab02/img/precommit.PNG?raw=true)

Następnie przetestowałem działanie hook'ów. 

 - Na początku chciałem utworzyć commita o błędnej nazwie w folderze Lab01. Wystąpił błąd "Zły folder"
 - Utworzenie folderu Lab02 i wykonanie commita o błędnej nazwie. Wystąpił błąd Aborting commit - message doesn't match pattern!
 - Utworzenie commita w folderze `Lab02` o nazwie `AW400107`. Wykonało się poprawnie.
 Wszystkie etapy są przedstawione poniżej: 
 
 ![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab02/img/test.PNG?raw=true)
 
 **2.**  Następnym etapem laboratoriów była instalacja oraz przygotowanie dockera na serwerze. 
 
 - Wykorzystanie komendy `$cat /etc/os-release` aby sprawdzić informacje o zainstalowanym systemie.
 
 -![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab02/img/ubunt.PNG?raw=true)
 
 
 - Zainstalowanie docker (docker został zainstalowany kilka dni wcześniej i niestety nie dokładnego posiadam zdjęcia):
 
 ![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab02/img/docker.PNG?raw=true)
 
 - Włączenie dockera komendą `$ sudo service docker start`:
 
 ![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab02/img/star.PNG?raw=true)
 
 
 - Sprawdzenie czy docker działa poprawnie: 
 
 ![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab02/img/docker2.PNG?raw=true)
 - Sprawdzenie komendy `$ ps -aux`:
 
 ![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab02/img/psaux.PNG?raw=true)

 

 - Uruchomienie Hello-World komendą `$ sudo docker run hello-world`:
 
 ![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab02/img/helloword.PNG?raw=true)
 
 - `$ sudo docker images`:
 
 ![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab02/img/images.PNG?raw=true)

 - Dodatkowo sprawdzam działanie dockera za pomocą włączonych procesów. Komenda `$ ps -ax | grep "docker`.
 Ukazane zostały procesy któe posiadają frazę "docker": 
 
![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab02/img/docker3.PNG?raw=true)

 - `$ sudo docker run -it ubuntu` komenda ta sprawdzi jaka wersja została zainstalowana: 
 
 ![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab02/img/koniec.PNG?raw=true)

 
**3.** Utworzenie konta na stronie hub.docker.com:

![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab02/img/dockerhub.PNG?raw=true)
