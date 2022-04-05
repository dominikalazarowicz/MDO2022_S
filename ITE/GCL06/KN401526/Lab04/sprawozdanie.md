# Sprawozdanie Lab_04 Kacper Nosarzewski
## 1. Cel cwiczenia
Celem labolatorium byla dalsza praca ze srodowiskiem Dockerowym oraz zapoznanie sie z aplikacja Jenkins

## 2. Wykonanie cwicznenia

1. Utworzenie woluminu wejscia i wyjscia poleceniem `sudo docker volume create kacper_in/kacper_out` i sprawdzenie czy sie utworzyly poleceniem `sudo docker volume ls` 
![img](sudo_docker_volume_create.PNG) 
2. Wyswietlenie szczegolowych informacji voluminu wejsciowego poleceniem `sudo docker inspect kacper_in`
![img](sudo_docker_inspect_kacper_in.PNG)
3. Wyswietlenie szczegolowych informacji voluminu wyjsciowego poleceniem `sudo docker inspect kacper_out`
![img](sudo_docker_inspect_kacper_out.PNG)
4. Stworzenie i uruchomienie kontenera wraz z podlaczonymi voluminami poleceniem 

![img](sudo_docker_run_kacper_volumes_container.PNG)

5. Sklonowanie repzytorium uzytego w poprzednim labolatorium `https://github.com/mongo-express/mongo-express`
![img](git_clone.PNG)

6. Skopiowanie katalogu z repozytorium do kontenera poleceniem `cp kacper_in/mongo-express/ mongo-express -r` 

![img](cp_kacper_in_mongo-express.PNG)
![img](ls.PNG)
7. Instalacja wymaganych zaleznosci poleceniem `npm install`

![img](npm_install.PNG)
8. Zbudowanie programu poleceniem `npm run build`
![img](npm_run_build.PNG)
9. Skopiowanie powstalych plikow do voluminu wyjsciowego poleceniem `cp -r mongo-express /kacper_out/`

![img](cp_out.PNG)

10. Uruchomienie serwera iPerf poleceniem  `sudo docker run -rm -it -p 5201:5201 taoyou/iperf3-alpine:latest`

![img](sudo_docker_run_ipferf3.PNG)

11. Sprawdzenie ip kontenera
![img](ifconfig.PNG)

12. Nawiazanie polaczenia kontener-kontener
![img](conecting_to_host_172.17.0.1.PNG)

13. Nawiazanie polaczenia host-kontener
![img](host_kontener.PNG)
14. Nawiazanie polaczeia z poza hosta
![img](telnet.PNG)
15. Przepustowosc komunikacji Analiza
Analizujac uzyskane dane przepustowosci mozna zauwazyc ze najlepsza przepustowosc ma przesyl z windowsa o wartosci 2.01 Gbits/sec troche wieksza przepustowowcia wykazuje przesyl kontener kontener o wartosci 8.98 Gbits/sec najdluzszym czasem przepustowosci odznacza sie przesyl host kontener z czasem 16.4 Gbits/sec
16. Utworzenie Jenkinsa w w Dockerze poleceniem `sudo docker network create jenkins`
![img](sudo_docker_network_create_jenkins.PNG)
17. Pobranie i uruchomienie obrazu docker:dind
![img](sudo_docker_run_jenkins.PNG)
18. Wyswietlenie stworzonego kontenra jenkinsa `sudo docker network ls` i `sudo docker ps`
![img](sudo_docker_network_ls.PNG)

![img](sudo_docker_ps.PNG)
19. Zbudowanie obrazu uzywajac dockerfile Jenkins_Dockerfile
poleceniem `sudo docker build . -f Jenkins_Dockerfile -t myjenkins-blueocean:2.332.1-1`

![img](sudo_dockerfile_run.PNG)
![img](sudo_dockerfile_run1.PNG)
20. Uruchomienie wlasnego obrazu jako kontener

![img](sudo_docker_run_jenkins_dock.PNG)

21. Odblokowywanie jenkinsa 
![img](unlock_jenkins.PNG)
22. Wyswietlenie hasla do odblokowania jenkinsa
![img](password.PNG)
23. Instalacja wymaganych wtyczek
![img](instalacja_wtyczek.PNG)
24. Tworzenie nowego uzytkownika
![img](admin.PNG)

25. Udane utworzenie nowego uzytkownika
![img](jenkins_is_ready.PNG)
![img](user.PNG)

