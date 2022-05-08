***Woluminy***

* Utworzenie woluminów wejściowych i wyjściowych

> sudo docker volume create input_vol
> 
> sudo docker volume create ouput_vol

![](Zrzut ekranu 2022-04-08 143156.png)

* Uruchomienie kontenera w trybie interaktywnym z zamontowanymi woluminami 

> sudo docker run -it --name builder_lab4 --mount "source=input_vol,target=/in" --mount "source=output_vol, target=/out" squirrelly bin/bash

![](Zrzut ekranu 2022-04-08 144753.png)

* Sklonowanie repozytorium na wolumin wejściowy

![](Zrzut ekranu 2022-04-08 160242.png)

* Uruchomienie buildu w kontenerze

> npm run build

![](Zrzut ekranu 2022-04-08 145236.png)

* Skopiowanie plików do woluminu wyjściowego

> cp squirrelly /out -r

![](Zrzut ekranu 2022-04-08 145425.png)

***iperf***

* Uruchomienie serwera iperf3 w kontenerze z Ubuntu

> iperf3 -s -p 2137

![](iperf_serwerDocker.png)

* Połączenie się za pomocą innego kontenera z Ubuntu

> iperf3 -c 172.17.0.2 -p 2137 

![](iperf_klientDocker.png)

* Połączenie się za pomocą hosta

![](iperf_host.png)

Jak możemy zauważyć połączenie się z serwerem Dockerowym przy pomocy hosta przyniosło poprawę 2 Gbit/s względem połączenia z użyciem innego kontenera.

***Jenkins***

* Utworzenie sieci dla Jenkinsa
![](Zrzut ekranu 2022-04-08 162023.png)
* Utworzenie kontenera docker:dind
![](Zrzut ekranu 2022-04-08 162055.png)
* Zbudowanie nowego obrazu z Dockerfile'a (dostępny w plikach)
![](Zrzut ekranu 2022-04-08 162148.png)
* Uruchomienie kontenera
![](Zrzut ekranu 2022-04-08 162239.png)
* Działający Jenkins
![](Zrzut ekranu 2022-04-08 155217.png)