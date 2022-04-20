# SPRAWOZDANIE 04

# Sprawozdanie z laboratorium 4

## 1. Zachowywanie stanu


- Przygotowanie woluminu wejściowego oraz wyjściowego:

![1](https://user-images.githubusercontent.com/72975469/164216184-3a2da19e-f82a-4622-a7ec-ee530b155c8c.png)

- Podłączenie woluminów do kontenera oraz jego uruchomienie:

![2](https://user-images.githubusercontent.com/72975469/164216240-c4a19a7c-415d-4fb0-a98b-e7713ce7110d.png)

- Sklonowanie repozytorium na wolumin wejściowy:

![3](https://user-images.githubusercontent.com/72975469/164216281-1a4ed48b-ba2f-4834-8b3a-9ca204010190.png)

- Uruchomienie buildu w kontenerze:

![4](https://user-images.githubusercontent.com/72975469/164216318-f86540ec-0e95-423d-a6f9-cf69cb835edd.png)

- Zapisanie plików na woluminie wyjściowym:

![5](https://user-images.githubusercontent.com/72975469/164216462-ff5ef489-f4e7-4978-a527-e9dc444a531f.png)

## 2. Eksponowanie portu:

- Instalacja, uruchomienie serwera iperf oraz włączenie nasłuchiwania:

![6](https://user-images.githubusercontent.com/72975469/164216597-f29d9309-defe-4317-ba72-9388b502700e.png)
![7](https://user-images.githubusercontent.com/72975469/164216623-e130e0ae-1cfb-41bb-819e-cfe954796ccc.png)
![8](https://user-images.githubusercontent.com/72975469/164216631-71385162-8ad8-457c-832f-5ad1bd3b9394.png)

- Łączenie między dwoma kontenerami:
- Serwer:

![9_serwer](https://user-images.githubusercontent.com/72975469/164216735-2426885a-d791-426b-b903-90d27b0ea94c.png)
- Klient:

![9_klient](https://user-images.githubusercontent.com/72975469/164216744-fe330272-10c6-4a8a-8eb8-0a1f4aae90cb.png)

## 3. Instalacja Jenkinsa przeprowadzona według dokumentacji: https://www.jenkins.io/doc/book/installing/docker/:

- Utworzenie sieci, pobranie oraz uruchomienie dind:

![10](https://user-images.githubusercontent.com/72975469/164217026-05ecf38b-e8f6-4c61-bdac-4fee6965d9c7.png)

- Utworzenie dockerfile'a zgodnie z manualem:

`FROM jenkins/jenkins:2.332.2-jdk11`

`USER root`

`RUN apt-get update && apt-get install -y lsb-release`

`RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \`

 ` https://download.docker.com/linux/debian/gpg`
 
`RUN echo "deb [arch=$(dpkg --print-architecture) \`

 ` signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \`
 
  `https://download.docker.com/linux/debian \`
  
  `$(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list`
  
`RUN apt-get update && apt-get install -y docker-ce-cli`

`USER jenkins`

`RUN jenkins-plugin-cli --plugins "blueocean:1.25.3 docker-workflow:1.28" `

- Zbudowanie nowego obrazu z dockerfile'a:

![11](https://user-images.githubusercontent.com/72975469/164217866-6be4ba56-add3-46ac-b213-09b18c9f0110.png)

- Uruchomienie obrazu:

![12](https://user-images.githubusercontent.com/72975469/164218021-d7385f84-357e-402d-8a08-fb2caa8e4a12.png)

- Działające kontenery:

![13](https://user-images.githubusercontent.com/72975469/164218043-522350b9-a400-4273-8f8e-e73df48bf1db.png)

- Szukanie hasła admina:

![14a](https://user-images.githubusercontent.com/72975469/164218202-a4999f02-4963-4a8b-bb66-bcfde1440c53.png)

- Hasło zostało zablurowane w celu uniknięcia niepotrzebnych problemów:

![14_b](https://user-images.githubusercontent.com/72975469/164218219-8217ed04-2d15-441e-aa1c-90c7482f54ae.png)

- Ekran logowania Jenkins'a ukazujący po otwarciu localhost:8080 w przegladarce:

![15](https://user-images.githubusercontent.com/72975469/164218348-59880c88-dfc9-40bd-94ec-fbddb1f481bc.png)

- Instalacja wtyczek:

![16](https://user-images.githubusercontent.com/72975469/164218393-8a306746-e6e1-468b-b123-b56607960aac.png)

- Tworzenie Pierwszego admina:

![17](https://user-images.githubusercontent.com/72975469/164218454-493bf5ee-02e6-4a8b-ba1f-d0d532c1c15c.png)

- Potwierdzenie zakończenia konfiguracji:

![18](https://user-images.githubusercontent.com/72975469/164218518-05b5aa56-cb3d-4b76-a255-ffb2d472b0a7.png)
![19](https://user-images.githubusercontent.com/72975469/164218538-93517e5a-e8c0-4cdb-b474-9b6d1277a2cc.png)

4. Użyte komendy:

`git pull`

`cd ../`

`cd lab04`

`ls`

`git add sprawozdanie04.md`

`git commit -m "sprawozdanie04.md"`

`git push`

`cd `

`ls`

`docker volume ls`

`docker volume create wejsciowy`

`docker volume create wyjsciowy`

`docker volume ls`

`docker run -it -v "wejsciowy:/wejsciowy" -v "wyjsciowy:/wyjsciowy" node:13 bash`

`docker run -it -v "wejsciowy:/wejsciowy" -v "wyjsciowy:/wyjsciowy" node /bin/sh`

`docker run -it ubuntu`

`docker ls`

`docker --help`

`docker images`

`docker run -it -v "wejsciowy:/wejsciowy" -v "wyjsciowy:/wyjsciowy" node /bin/sh`

`apt-get install iperf3`

`sudo apt-get install iperf3`

`docker run -it -v "wejsciowy:/wejsciowy" -v "wyjsciowy:/wyjsciowy" node /bin/sh`

`docker run -it ubuntu`

`docker network jenkins`

`docker network create jenkins`

`docker run --name jenkins-docker --rm --detach   --privileged --network jenkins --network-alias docker   --env DOCKER_TLS_CERTDIR=/certs   --volume jenkins-docker-certs:/certs/client   --volume jenkins-data:/var/jenkins_home   --publish 2376:2376   docker:dind --storage-driver overlay2`

`nano dockerfile_`

`docker build -t myjenkins-blueocean:2.332.1-1 . -f dockerfile_`

`docker run --name jenkins-blueocean --rm --detach   --network jenkins --env DOCKER_HOST=tcp://docker:2376   --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1   --publish 8080:8080 --publish 50000:50000   --volume jenkins-data:/var/jenkins_home   --volume jenkins-docker-certs:/certs/client:ro   myjenkins-blueocean:2.332.1-1`

`sudo docker ps`

`docker logs jenkins-blueocean`


