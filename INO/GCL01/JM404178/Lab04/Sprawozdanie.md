
# Sprawozdanie 4

## Zachowywanie stanu

* Pierwsza rzecza potrzebna do przygotowania to woluminy wejsciowy oraz wyjsciowy. Ich tworzenie zapewnia nam komenda `docker volume create`.

![volume in volume out](https://i.imgur.com/5NxRHRk.png)


* Nastepnie uruchamiamy kontener za pomoca `docker run -it` mount'ujac woluminy za pomoca `-v`  i instalujemy wymagania wstepne.

![docker run](https://i.imgur.com/DNcQrTQ.png)

* Klonujemy repo do volume in'a, poniewaz nie bedziemy instalowac gita.
Musialem za pomoca `su` wejsc jako root, aby moc przejsc za pomoca `cd /var/lib/docker/volumes`, gdzie mieszcza sie woluminy.

![git clone](https://i.imgur.com/hDG3dAZ.png)

* Uruchomienie build'u w kontenerze.

![build](https://i.imgur.com/iWa6k2V.png)

![built](https://i.imgur.com/gRkorT0.png)

## Eksponowanie portu

* Utworzenie dockerfile z serwerem iperf.

![iperf](https://i.imgur.com/fKiNCao.png)

![build](https://i.imgur.com/zCe9dVe.png)

![run](https://i.imgur.com/5OqYtPg.png)

* Polaczenie sie z serwerem z drugiego kontenera:

![another tab](https://i.imgur.com/sb9l6FC.png)

* Polaczenie sie spoza kontenera:

![outside of container](https://i.imgur.com/22hJBcN.png)

## Instancja Jenkins

* Utworzylem siec za pomoca komendy `docker network create jenkins`.

![network create](https://i.imgur.com/9OehDuk.png)

* Pullowanie DIND'a `docker pull docker:dind`:

![DIND](https://i.imgur.com/t17L5Nx.png)

* Docker run (dostepny na dokumentacji):

![docker run jenkins](https://i.imgur.com/dI5K5mb.png)

* Tworzenie dockerfile dla Jenkinsa

![dockerfile jenkins](https://i.imgur.com/5069RaN.png)

* Budowanie obrazu

![image create](https://i.imgur.com/bi3Dzua.png)

* Uruchomienie obrazu i ekran logowania Jenkinsa

![run](https://i.imgur.com/zexXCXI.png)

![Jenkins login](https://i.imgur.com/ewnf4RG.png)



















