# Sprawozdanie 3

# Michael Paslawski, grupa nr 6

#### Sprawozdanie wyjatkowo sporzadone na Mac'u z uwagi na logistyke

* Znalezienie repozytorum spelniajacego warunku laboratorium 


![e.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MP401850/ITE/GCL06/MP401850/Lab03/Screenshot%202022-03-30%20at%2012.04.34.png)

* Zainstalowanie odpowiednich zaleznosci za pomoca `npm install`


![e.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MP401850/ITE/GCL06/MP401850/Lab03/Screenshot%202022-03-30%20at%2012.05.38.png)

* Zbudowanie programu przy uzyciu `npm build`


![e.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MP401850/ITE/GCL06/MP401850/Lab03/Screenshot%202022-03-30%20at%2012.06.46.png)

* Uruchomienie testow za pomoca `npm test`


![e.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MP401850/ITE/GCL06/MP401850/Lab03/Screenshot%202022-03-30%20at%2012.09.28.png)

* Pobranie obrazu ubuntu dla nasze dockera za pomoca `sudo docker pull ubuntu`


![e.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MP401850/ITE/GCL06/MP401850/Lab03/Screenshot%202022-03-30%20at%2012.11.29.png)

* Utworzenie i uruchomienie nowego kontenera za pomoca `sudo docker run --name lab3_devops -it ubuntu`


![e.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MP401850/ITE/GCL06/MP401850/Lab03/Screenshot%202022-03-30%20at%2012.13.00.png)

* Sklonowanie repozytorium za pomoca `git clone https://github.com/node-red/node-red.git`


![e.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MP401850/ITE/GCL06/MP401850/Lab03/Screenshot%202022-03-30%20at%2012.19.19.png)

* Ponowna sekwencja uruchomieniowa dla naszego repo, tylko na dockerze

* Zainstalowanie odpowiednich zaleznosci za pomoca `npm install` 


![e.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MP401850/ITE/GCL06/MP401850/Lab03/Screenshot%202022-03-30%20at%2012.26.25.png)

* Zbudowanie programu przy uzyciu `npm build`


![e.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MP401850/ITE/GCL06/MP401850/Lab03/Screenshot%202022-03-30%20at%2012.27.51.png)


* Uruchomienie testow za pomoca `npm test`

![e.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MP401850/ITE/GCL06/MP401850/Lab03/Screenshot%202022-03-30%20at%2012.30.23.png)

* Utworzenie plikow dockerfile automatyzujacych wszystkie powyzsze kroki

* Plik dockerlab3_build

![e.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MP401850/ITE/GCL06/MP401850/Lab03/Screenshot%202022-03-30%20at%2012.48.14.png)

* Plik dockerlab3_test

![e.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MP401850/ITE/GCL06/MP401850/Lab03/Screenshot%202022-03-30%20at%2012.48.33.png)

* Na koniec uzycie Komendy do uruchomienia pliku budujacego program `sudo docker build . -f dockerlab3_build -t nodered_build`


* oraz Komenda do uruchomienia pliku testujacego program `sudo docker build . -f dockerlab3_test -t nodered_test`








