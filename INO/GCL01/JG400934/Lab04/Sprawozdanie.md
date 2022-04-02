Utworzenie katalogów:

![1](super%20lab%204.png)


Zachowywanie stanu:


Utworzenie woluminów:

![2](create%20volumes.png)


Sklonowanie repo do woluminu wejściowego:

![3](git%20clone%20to%20volume.png)

Uruchomienie kontenera z zamontowanymi woluminami:

```
docker run -it -v vol_in:/vol_in -v vol_out:/vol_out fedora:latest
```

Instalacja dependencji:

![4](install%20dependencies.png)

Uruchomienie buildu do folderu w woluminie wyjściowym:

![5](meson%20build%20to%20vol%20out.png)

Zbuildowane irssi w woluminie wyjściowym:

![6](build%20irssi%20in%20vol%20out.png)

Dowód na poprawnego wykonanie zadania, uruchomienie kontenera jeszcze raz, po wcześniejszym buildzie
i pokazanie że pliki utworzone w ten sposób nadal się tam znajdują:

![7](proof.png)


Eksponowanie portu:


Utworzenie nowego obrazu z zainstalowanym iperf3:

```
FROM fedora:latest
RUN yum install -y iperf3
```

![8](docker%20images%20iperf3.png)

Start serwera:

![9](start%20server.png)

Klient w innym kontenerze:

![10](client%20-%20containter.png)

Klient na hoście:

![11](client%20-%20host.png)

Klient spoza hosta

![12](client%20-%20outside%20host.png)

Test spoza hosta wymagał pobrania iperf3.exe na windowsa, oraz otwarcie wymaganych portów w VM

![13](port.png)

![14](exe.png)


Logi (nie dodaje pliku,ani screena całości ponieważ wyniki znajdują się już w screenach wyżej)

Logi otrzymywane za pomocą:

```
docker logs container_name
```


![15](logs.png)


Instancja Jenkins:


Tworzenie sieci:

![16](jenkins%20create%20network.png)

Pobranie obrazu docker in docker (dind):

![17](jenkins%20pull%20dind.png)


Docker run wg instrukcji z strony:

![18](run%20run%20run.png)

Docker file:

![19](DOCKER-jenkins-screen.png)

Utworzenie obrazu z powyższego pliku:

![20](jenkins%20docker%20build.png)

![21](jenkins%20image.png)

Uruchomienie własnego obrazu:

```
docker run --name jenkins-jen --rm --detach \
  --network jenkins --env DOCKER_HOST=tcp://docker:2376 \
  --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1 \
  --publish 8080:8080 --publish 50000:50000 \
  --volume jenkins-data:/var/jenkins_home \
  --volume jenkins-docker-certs:/certs/client:ro \
  jenkins_1:latest
```

![23](run%20run%20run%202.png)


Działający Jenkins:

![24](jenking%20login.png)

![25](jenking%20super%20jest.png)