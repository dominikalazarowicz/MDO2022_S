# Sprawozdanie Lab04
## Zachowywanie stanu 
- Utworzenie voluminu wejściowego i wyjściowego używając ```sudo docker volume create --name vol_in/vol_out```
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/0cef4ef8de182203e9d13dd6b5dfa2ee4360dffb/INO/GCL02/IW402853/Lab04/utworzenie%20voluminow.png)
- Sprawdzenie połączenia voluminów oraz ścieżki przy pomocy ```sudo docker inspect vol_in/vol_out```
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/0cef4ef8de182203e9d13dd6b5dfa2ee4360dffb/INO/GCL02/IW402853/Lab04/sprawdzenie%20polaczenia%20voluminow.png)
- Uruchomienie kontenera razem z podłączeniem do niego voluminów ```sudo docker run -it --name node_volume --mount source=vol_in,target=/vol_in --mount source=vol_out,target=/vol_out node bash```.
Jak widać nasze foldery z voluminami zostały dodane do kontenera.
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/e1a59d7838179889b313cca8d76cbaa0f24ca60a/INO/GCL02/IW402853/Lab04/uruchomienie%20kontenera.png)
- Skopiowanie repozytorium na volumin wejściowy ```vol_in``` ```git clone [...]``` używając ścieżki do naszych voluminów wyświetloną wcześniej.
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/553a99a5c1b361030a95ea0b5c87a5f5cf34c6d6/INO/GCL02/IW402853/Lab04/skopiowanie%20repozytorium%20na%20volumin%20wej%C5%9Bciowy.png)
- Wejście do kontenera. Repozytorium znajduje się w kontenerze. Pobranie potrzebnych zależności przy użyciu ```npm install```.
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/73d317c07ea0bb1d3dee7e304e08d9d1ecfb04a2/INO/GCL02/IW402853/Lab04/pobranie%20potrzebnych%20zale%C5%BCno%C5%9Bci.png)
- Uruchomienie builda za pomocą ```npm run build```.
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/73d317c07ea0bb1d3dee7e304e08d9d1ecfb04a2/INO/GCL02/IW402853/Lab04/budowa%20projektu.png)
- Skopiowanie powstałych plików na volumin wyjściowy ```vol_out``` przy użyciu ```cp -r build /vol_out```.
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/8e53aad709127c562ebe6dd40605a4093401c1f2/INO/GCL02/IW402853/Lab04/skopiowanie%20build%20na%20vol_out.png)
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/8e53aad709127c562ebe6dd40605a4093401c1f2/INO/GCL02/IW402853/Lab04/pliki%20z%20voluminu%20wyjsciowego.png)
## Eksponowanie portu
- Pobranie odpowiedniego obrazu dockerowego ```docker pull networkstatic/iperf3```. Uruchomienie wewnątrz kontenera serwera iperf3 ```docker run```.
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/ce431b9ae9f064cd6c09e1646348ac3b5fd1d9ca/INO/GCL02/IW402853/Lab04/pobranie%20obrazu%20iperf3%20uruchomienie.png)
- Widoczny pobrany obraz ```sudo docker images```.
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/ce431b9ae9f064cd6c09e1646348ac3b5fd1d9ca/INO/GCL02/IW402853/Lab04/widoczny%20obraz%20docker%20networkstatics.png)
- Sprawdzenie czy serwer nasłuchuje ```sudo netstat -utnpa | grep LISTEN```.
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/ce431b9ae9f064cd6c09e1646348ac3b5fd1d9ca/INO/GCL02/IW402853/Lab04/sprawdzenie%20czy%20nasluchuje.png)
-
![]()
-
![]()
## Instancja Jenkins
-
![]()
-
![]()
-
![]()
-
![]()
