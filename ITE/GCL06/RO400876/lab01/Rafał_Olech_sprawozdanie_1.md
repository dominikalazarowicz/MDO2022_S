# Rafał Olech - Sprawozdanie z laboratorium 1

## Cel ćwiczeń laboratoryjnych:

    Celem ćwiczeń było zapoznanie się z podstawową obsługą i działaniem środowiska GitHub. Utworzenie własnej gałęzi w repozytorium i połączenie się z nią za pomocą SSH.

## Wykonanie ćwiczenia:

1. Instalacja klienta Git oraz obsługa kluczy SSH.

 * Instalacja klienta Git komendą `sudo apt-get install git` :

    ![img](DevOps_lab1_ss1.png)

 * Sprawdzenie czy poprawnie zainstalowano Git'a za pomocą polecenia `git --version` :

     ![img](DevOps_lab1_ss2.png)

 * Instalacja SSH poleceniem `sudo apt-get install openssh-server` :

     ![img](DevOps_lab1_ss3.png)


2. Sklonowanie repozytorium za pomocą HTTPS komendą `git clone https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S` :

    ![img](DevOps_lab1_ss4.png)


3. Sklonowanie repozytorium za pomocą SSH :

 * Wygenerowanie pary kluczy SSH. Został utworzony klucz publiczny oraz klucz prywatny zakodowany hasłem :

    ![img](DevOps_lab1_ss5.png)

 * Wyświetlenie klucza publicznego :

    ![img](DevOps_lab1_ss8.png)


 * Powiązanie klucza SSH z własnym kontem na GitHub :

    ![img](DevOps_lab1_ss7.png)

 * Sklonowanie repozytorium wykorzystując SSH poleceniem `git clone git@github.com:InzynieriaOprogramowaniaAGH/MDO2022_S.git` :

    ![img](DevOps_lab1_ss9.png)


4. Przełączenie się na gałąź swojej grupy :

    ![img](DevOps_lab1_ss12.png)

 * Sprawdzenie czy przełączenie na gałąź grupy przeszło pomyślnie za pomocą polecenia `git branch` :

    ![img](DevOps_lab1_ss13.png)


5. Utworzenie własnej gałęzi poleceniem `git checkout -b RO400876` o nazwie składającej się z inicjałów oraz numeru indeksu :

    ![img](DevOps_lab1_ss15.png)

 * Sprawdzenie czy utworzenie własnej gałęzi przeszło pomyślnie za pomocą polecenia `git branch` :

    ![img](DevOps_lab1_ss16.png)


6. Praca na nowej gałęzi :

 * Przejście do katalogu właściwego dla grupy, i utworzenie w nim za pomocą `mkdir RO400876`katalogu o nazwie takiej samej jak powyżej czyli składającej się z inicjałów oraz numeru indeksu :

    ![img](DevOps_lab1_ss17.png)

 * W nowym katalogu utworzenie katalogu o nazwie lab01 poleceniem `mkdir lab01` :

    ![img](DevOps_lab1_ss18.png)

 * Utworzenie pliku ze sprawozdaniem w katalogu lab01 poleceniem `code Rafał_Olech_sprawozdanie_1.md` :

    ![img](DevOps_lab1_ss19.png)

 * Tworzenie sprawozdania w aplikacji Visual Studio Code.
 
    





















