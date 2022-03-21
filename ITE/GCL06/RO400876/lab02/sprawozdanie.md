# Rafał Olech - Sprawozdanie z laboratorium 2

## Cel ćwiczeń laboratoryjnych:

Celem ćwiczeń było przygotowanie środowiska Dockerowego oraz zapoznanie się z jego podstawową obsługą i działaniem. Utworzenie git hook'a rozwiązującego najczęstsze problemy z commitami. 

## Wykonanie ćwiczenia:

1. Przygotowanie git hook sprawdzającego, czy tytuł commita jest poprawnie nazwany, a więc składa się z moich inicjałów oraz numeru indeksu oraz sprawdzającego, czy w treści commita pada numer laboratorium, który jest właściwy dla zadania.


 * Utworzenie kopii w folderze hooks pliku o nazwie commit-msg.sample. Utworzona została kopia o tej samej nazwie, lecz bez rozszerzenia .sample.


 * Uczynienie pliku commit-msg jako wykonywalny za pomocą komendy `chmod +x commit-msg`.    

![img](lab2_1.png)


 * Zawartość pliku commit-msg:


```bash

```

 * Wpisanie niepoprawnej nazwy commita w celu sprawdzenia działania utworzonego hook'a:

 ![img](lab2_6.png)


 * Wpisanie poprawnej nazwy commita w celu sprawdzenia działania utworzonego hook'a:

 ![img](lab2_7.png)




2. Przygotowanie środowiska dockerowego.


 * Zapewnienie dostępu do maszyny wirtualnej poprzez zdalny terminal. Połączenie się z maszyną wirtualną z poziomu cmd na windowsie korzystając z SSH:


 * Połączenie następuje po wpisaniu w cmd komendy `ssh rafa@192.168.2.62`:

 ![img](lab2_ssh.PNG)


 * Docker został zainstalowany już wcześciej co jest widoczne po wpisnaiu komendy `systemctl status docker`:

 ![img](lab2_docker.PNG)


 * Za pomocą komendy `docker -v` można sprawdzić wersję zainstalowanego dockera:

 ![img](lab2_deocker_v.PNG)



3. Działanie środowiska dockerowego:

 * Wykazanie, że środowisko dockerowe jest uruchomione i działa (z definicji) za pomocą komendy `systemctl status docker`. Status serwisu docker wskazuje na aktywny, co oznacza, że docker jest aktualnie uruchomiony i działa poprawnie:

 ![img](lab2_docker.PNG)



4. Wykazanie działania dockera w sposób praktyczny (z własności).

 * Pobranie obrazu ubuntu komendą `sudo docker pull ubuntu`:

 ![img](lab2_obraz_ubuntu.PNG)


 * Sprawdzenie zainstalowanych obrazów za pomocą komendy `sudo docker images`:

 ![img](lab2_obrazy.PNG)


 * Za pomocą polecenia `sudo docker run --name ubuntu_Rafal -it ubuntu` zostaje utworzony i uruchomiony kontener o nazwie ubuntu_Rafal, a natępnie za pomocą komendy `uname -a` zostaje wyświetlona jego wersja:

 ![img](ubuntu_uruchomienie.PNG)


 * Uruchomienie kontenera o nazwie ubuntu_Rafal za pomocą polecenia `sudo docker start ubuntu_docker`:

 ![img](docker_start.PNG)


 * Wyświetlenie listy aktualnych kontenerów komendą `sudo docker ps`:

 ![img](aktualne_kontenery.PNG)



 5. Założenie konta na Docker Hub:

 ![img](dockerHub.PNG)

 bssdsdsdsdsxssxsxsxsxxssxsxsxsxdcdcsxssdssxsxsxxsxsxszszsssdxsxxsxsxsx



























