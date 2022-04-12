 sprawdzono aktualna konfiguracje laczenia 
 
 ![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/JJ400051/ITE/GCL03/JJ400051/Lab02/URL.png) 
 
 i zmieniono ja na ssh 
 
 ![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/JJ400051/ITE/GCL03/JJ400051/Lab02/from_URL_to_ssh.png)
 
  Zmieniono konfiguracje folderow i branchy na bardziej przejrzysta
  
  ![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/JJ400051/ITE/GCL03/JJ400051/Lab02/dir_struct.png)
  
    wykonano push na stworzonym tagu
    
  ![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/JJ400051/ITE/GCL03/JJ400051/Lab02/tags_pushed.png)

hook:

#!/bin/bash
if [[ $(cat $1) != JJ400051* ]]; then
    echo "niepoprawne"
    exit 1
fi
if ! grep -i "lab02" "$1" ; then
	echo "nieprawidlowe"
	exit 1
fi


Zmieniono tresc hooka i jego nazwe 

![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/JJ400051/ITE/GCL03/JJ400051/Lab02/hook_edit_and_rename.png)

i przetestowano dzialanie 

![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/JJ400051/ITE/GCL03/JJ400051/Lab02/hook_testing.png)

W ustawieniach seci maszyny wirtualnej dla typu NAT, dodano opcję przekierowywania portów:

Protokół: TCP; IP hosta: 127.0.0.1; Port hosta 2222; IP gościa: 10.0.2.15; Port gościa: 22.

Zainstalowano OpenSSH 
 
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/JJ400051/ITE/GCL03/JJ400051/Lab02/openssh_install.png)

uruchomiono usluge poleceniem sudo service ssh start i sprawdzono status 

![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/JJ400051/ITE/GCL03/JJ400051/Lab02/active_Server.png)

Polaczono sie z serwerem ssh przez Putty wpisujac dane z punktu 3. 

![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/JJ400051/ITE/GCL03/JJ400051/Lab02/ssh_login.png).

Zainstalowano dockera 

![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/JJ400051/ITE/GCL03/JJ400051/Lab02/docker_install.png)

Uruchomiono poleceniem 'sudo systemctl start docker' i sprawdzono status 

![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/JJ400051/ITE/GCL03/JJ400051/Lab02/active_docker.png).

Pobrano obraz systemu linux, wykonano polecenie Hello world i sprawdzono zawartosc kontenera 

![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/JJ400051/ITE/GCL03/JJ400051/Lab02/docker_images.png)

Sprawdzono zainstalowana wersje dockera 

![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/JJ400051/ITE/GCL03/JJ400051/Lab02/docker_version.png).
 
Zalozono konto na dockerhub 

![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/JJ400051/ITE/GCL03/JJ400051/Lab02/dockerhub.png)

Wszystkie screenshoty powstale na systemie Windows przeslano na maszyne wirtualna za pomoca programu Filezilla 

![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/JJ400051/ITE/GCL03/JJ400051/Lab02/filezilla.png).


