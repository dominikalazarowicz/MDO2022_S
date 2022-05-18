Sprawozdanie lab04
Jakub Jezierczak




Stworzenie woluminów wejscie i wyjście
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/JJ400051/ITE/GCL03/JJ400051/Lab04/1.PNG)
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/JJ400051/ITE/GCL03/JJ400051/Lab04/2.PNG)

Stworzenie kontenera z zamontowanymi woluminami
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/JJ400051/ITE/GCL03/JJ400051/Lab04/3.PNG)
Przejście do powłoki i z jej poziomu sklonowanie repozytorium
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/JJ400051/ITE/GCL03/JJ400051/Lab04/4.PNG)
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/JJ400051/ITE/GCL03/JJ400051/Lab04/6.PNG)
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/JJ400051/ITE/GCL03/JJ400051/Lab04/7.PNG)
W kolejnym oknie stworzono nowy kontener z zamontowanymi woluminami i sklonowanym repozytorium
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/JJ400051/ITE/GCL03/JJ400051/Lab04/9.PNG)
Następnie zbudowano projekt
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/JJ400051/ITE/GCL03/JJ400051/Lab04/10.PNG)

![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/JJ400051/ITE/GCL03/JJ400051/Lab04/11.PNG)

I skopiowano output do woluminu wyjsciowego

![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/JJ400051/ITE/GCL03/JJ400051/Lab04/12.PNG)

2. Iperf3

Pobrano kontener  serwerem iperf3 i uruchomiono go
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/JJ400051/ITE/GCL03/JJ400051/Lab04/13.PNG)
W kolejnym oknie zbadano adres ip stworzonego kontenera 
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/JJ400051/ITE/GCL03/JJ400051/Lab04/14.PNG)
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/JJ400051/ITE/GCL03/JJ400051/Lab04/15.PNG)
Stworzono kontener, łączący się z serwerem jednak nie zostało to udokumentowane, przepustowość była nieznacznie mniejsza w porównaniu do transferu host-kontener
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/JJ400051/ITE/GCL03/JJ400051/Lab04/16.PNG)
Połączono się wykorzystując PowerShell systemu windows po pobraniu odpowiedniego pliku wykonywalnego. Można zauważyć znaczny spadek przepustowości
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/JJ400051/ITE/GCL03/JJ400051/Lab04/17.PNG)

3. Jenkins

Konieczne było rozszerzenie przekierowywania portów o iperf (port 5201) i jenkins (port 8080).
Po zapoznaniu się z dokumentacją Jenkinsa wykonano opisano w niej kroki w celu instalacji z użyciem DIND
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/JJ400051/ITE/GCL03/JJ400051/Lab04/18.PNG)
W oparciu o instrucję stworzono Dockerfile
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/JJ400051/ITE/GCL03/JJ400051/Lab04/19.PNG)
I zbudowano obraz
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/JJ400051/ITE/GCL03/JJ400051/Lab04/20.PNG)
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/JJ400051/ITE/GCL03/JJ400051/Lab04/21.PNG)
Zainicjalizowano instancję 
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/JJ400051/ITE/GCL03/JJ400051/Lab04/22.PNG)
Wyświetlenie działających kontenerów
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/JJ400051/ITE/GCL03/JJ400051/Lab04/23.PNG)
Próba zalogowania się na Jenkinsa 
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/JJ400051/ITE/GCL03/JJ400051/Lab04/24.PNG)
Znaleziono hasło za pomocą docker exec jenkins-blueocean cat "sciezka" i wpisano je
Działający Jenkins 
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/JJ400051/ITE/GCL03/JJ400051/Lab04/26.PNG)
