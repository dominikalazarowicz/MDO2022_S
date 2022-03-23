# Sprawozdanie 2

# Michael Paslawski, grupa nr 6

* Stworzenie folderu do opracowania Laboratorium nr 2

![zdjecie.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MP401850/ITE/GCL06/MP401850/Lab02/zdjecie.png)

* Stworzenie odpowiedniego pliku z nadaniem mu dodatkowych uprawnien. Plik dziala tak, ze trzeba wpisac odpowiednie komentarze przy commicie, aby mozna bylo wykonac rzecz poprawnie

![Screenshot 2022-03-23 at 09.56.13.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MP401850/ITE/GCL06/MP401850/Lab02/Screenshot%202022-03-23%20at%2009.56.13.png)

* Tresc pliku commit-msg

#!/usr/bin/env bash <br />
INPUT_FILE=$1 <br />
START='head $INPUT_FILE' <br />
if ! [[ "$START" =~ "MP401850" ]]; then <br />
echo "Bad commit, wrong name" <br />
exit 1 <br />
fi <br />
<br />
if ! [[ "$START" == "Lab02" ]]; then <br />
echo "Bad commit" <br />
exit 1 <br />
fi <br />

* Proba wykonania commitu z blednymi danymi

![/Screenshot 2022-03-23 at 10.03.34.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MP401850/ITE/GCL06/MP401850/Lab02/Screenshot%202022-03-23%20at%2010.03.34.png)

* Udany git commit z odpowiednymi danymi 

![Screenshot 2022-03-23 at 10.03.51.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MP401850/ITE/GCL06/MP401850/Lab02/Screenshot%202022-03-23%20at%2010.03.51.png)

* Pobranie Dockera 

![Screenshot 2022-03-23 at 10.29.23.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MP401850/ITE/GCL06/MP401850/Lab02/Screenshot%202022-03-23%20at%2010.29.23.png)

* Wyprobowanie roznych komend dockera w celu sprawdzenia poprawnosci dzialania 

![Screenshot 2022-03-23 at 10.25.34.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MP401850/ITE/GCL06/MP401850/Lab02/Screenshot%202022-03-23%20at%2010.25.34.png)

* Testowanie ubuntu 

![Screenshot 2022-03-23 at 10.26.04.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MP401850/ITE/GCL06/MP401850/Lab02/Screenshot%202022-03-23%20at%2010.26.04.png)

* Ukazanie statusu utworzenego kontenera, gdzie jest pokazane ile sekund temu zostal zamkniety = 8 sekund

![Screenshot 2022-03-23 at 10.28.09.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MP401850/ITE/GCL06/MP401850/Lab02/Screenshot%202022-03-23%20at%2010.28.09.png)

* Koncowa faza, czyli pokazanie pomyslnie utworzonego konta na docker.hub

![Screenshot 2022-03-23 at 10.28.35.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MP401850/ITE/GCL06/MP401850/Lab02/Screenshot%202022-03-23%20at%2010.28.35.png)

