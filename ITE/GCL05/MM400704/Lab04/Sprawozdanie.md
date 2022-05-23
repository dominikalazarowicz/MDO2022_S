# Sprawozdanie 4

# Michał Mendrek, grupa nr 5 400704

* Przygotowanie dwóch voluminów, wejściowego i wyjściowego oraz sprawdzenie poprawności ich połączenia

![e.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MM400704/ITE/GCL05/MM400704/Lab04/1.PNG)

![e.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MM400704/ITE/GCL05/MM400704/Lab04/2.PNG)

* Uruchomienie kotenera z podłączonymi do niego voluminami

![e.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MM400704/ITE/GCL05/MM400704/Lab04/3.PNG)

* Sklonowanie repozytorium https://github.com/node-red/node-red i instalacja wymaganych zależności i zbudowanie programu

![e.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MM400704/ITE/GCL05/MM400704/Lab04/4.PNG)
![e.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MM400704/ITE/GCL05/MM400704/Lab04/5.PNG)

* Próba uruchomienia kontenera serwera iPerf, wykorzystujemy do tego obraz taoyou z wbudownym iPerf3

![e.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MM400704/ITE/GCL05/MM400704/Lab04/6.PNG)

* Weryfikacja portów

![e.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MM400704/ITE/GCL05/MM400704/Lab04/7.PNG)

* Połączenie z poziomu drugiego kontenera w naszym przypadku drugiego okna Ubuntu

![e.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MM400704/ITE/GCL05/MM400704/Lab04/8.PNG)

* Pobranie obrazu DIND i jego uruchomienie za pomoca komendy `sudo docker run --name jenkins-docker --rm --detach --privileged --network jenkins --network-alias docker --env DOCKER_TLS_CERTDIR=/certs --volume jenkins-docker-certs:/certs/client 
--volume jenkins-data:/var/jenkins_home --publish 2376:2376 docker:dind --storage-driver overlay2`

* Utworzenie pliku dockerfilowego w celu późniejszej budowy programu zjego wykorzystaniem 

![e.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MM400704/ITE/GCL05/MM400704/Lab04/9.PNG)

* Zbudowanie programu

![e.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MM400704/ITE/GCL05/MM400704/Lab04/10.PNG)

*Uruchomienie utowrzonego wyżej obrazu 

![e.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MM400704/ITE/GCL05/MM400704/Lab04/11.PNG)

*Otwarcie i próba odblokowania Jenkinsa poprzez zdobycie do niego hasła

![e.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MM400704/ITE/GCL05/MM400704/Lab04/12.PNG)

*Komenda pomagająca odnależć nasze hasło

![e.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MM400704/ITE/GCL05/MM400704/Lab04/13.PNG)

* Insalowanie polecanych wtycznek 

![e.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MM400704/ITE/GCL05/MM400704/Lab04/14.PNG)

* Widok Jenkinsa po poprawwnym utworzeniu konta

![e.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MM400704/ITE/GCL05/MM400704/Lab04/15.PNG)

*Potwerdzenie działającego kontenera

![e.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MM400704/ITE/GCL05/MM400704/Lab04/16.PNG)
