### Daniel Kabat
### Inzynieria Obliczeniowa
### INO GCL-01

# Laboratorium 02

### Zadanie 1.
Niestety pierwszego zadania nie udało mi się wykonać. Może jeszcze do niego powrócę by zrobić chociaż hooka sprawdzającego tytuł commita.

### Zadanie 2.
Zadanie 2 niestety też jest puste z racji, że nie mam hooków to nie mam co tu umieścić.

### Zadanie 3.

W ramach zadania numer trzy należało zapewnić dostęp przez dalny terminal do maszyny wirtualnej a nie przez okienko. Z racji że użym Virtual Boxa a na nim mam postawione Ubuntu to do połączenia się z nim wybrałem program Putty. Dodatkowo utworzyłem sobie sejse w WinSCP co by łatwiej mi było wrzucić screeny na ubuntu potrzebne do sprawozdania. Poniżej znajduje się zrzut ekranu jakie informacje należy podać w Putty.

![putty1](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596/INO/GCL01/DK290596/LAB_02/putty1.PNG)

Kolejno otwiera nam się zdalny terminam gdzie trzeba podać nazwę urzytkownika w moim przypadku do Ubuntu (czyli daniel) i hasło do konta. Po tym dostęp jest już gotowy.

![putty2](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596/INO/GCL01/DK290596/LAB_02/putty2.PNG)

Osobiście miałem problem z nawiązaniem połączenia, co się okazało w VirtualBoxie nie miałem ustawionego portu. Załączam screen gdzie to ustawić

![VM_ssh](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596/INO/GCL01/DK290596/LAB_02/vw_ssh.PNG)

Podczas uruchamiania nowej sesji w WinSCP należy podać takie same dane jak przy Putty. To również udało się wykonać i załączam screen z potwierdzeniem.

![Win_SCP](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596/INO/GCL01/DK290596/LAB_02/win_scp.PNG)

Zatem punkt pierwszy z 3 zadania mamy wykonany. Punkt drugi nie dotytczy bo jest uzywana VM.

Przechodzimy do punktu 3 czyli instalcja dockera.
Zaczynamy ją od usuniecia starych wersji (jesli istniały to się usuną jesli nie dostaniemy informację ze nie ma co usunąć)

dokonujemy tego przy użyciu polecenia: apt-get remove docker-engine docker.io containerd runc

Kolejno musimy zaktualizowac apt pry użyciu polecenia: sudo apt-get update. Kolejno zainstalowac paczki umożliwiające dostęp apt do repozytorium HTTPS

![docker3](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596/INO/GCL01/DK290596/LAB_02/docker3.PNG)

Kolejno dodać klucz GPG docekra

![docker4](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596/INO/GCL01/DK290596/LAB_02/docker4.PNG)

I ustawić repozytorium jako stable
Do tego służy następujące polecenie:

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  

W tym momencie dokonujemy instalcji dockera w sposób przedstawiony na zrzucie poniżej.

![doceker6](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596/INO/GCL01/DK290596/LAB_02/docker6.PNG)

Po instalacji upewniamy się czy wszystko ok 

![docker7](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596/INO/GCL01/DK290596/LAB_02/docker7.PNG)

### Zadanie 4.

W ramach wykazania działania dockera z definicji sprawdzam wersje dockera i czy są jakies procesy związane z dockerem.

![docker_version](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596/INO/GCL01/DK290596/LAB_02/docker_version.PNG)

![docker_proces](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596/INO/GCL01/DK290596/LAB_02/docker_proces.PNG)

Wykazanie z własności następuje poprzez pobranie obrazu fedory.

![docker_fedora](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596/INO/GCL01/DK290596/LAB_02/docker_fedora.PNG)

sprawdzamy obrazy dockera

![docker_images](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596/INO/GCL01/DK290596/LAB_02/docker_iamges.PNG)

otwieramy go w trybie aktywnym i sprawdzamy numer jego wersji

![docker_uname](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596/INO/GCL01/DK290596/LAB_02/docker_uname.PNG)

### Zadanie 5.

W ramach zadania 5 należało założyć konto na Docker Hub

![docker_hub](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596/INO/GCL01/DK290596/LAB_02/profile_docker_hub.PNG)


