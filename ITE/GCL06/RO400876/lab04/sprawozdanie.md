# Rafał Olech - Sprawozdanie z laboratorium 4

## Cel ćwiczeń laboratoryjnych:

Celem ćwiczeń laboratoryjnych była dalsza praca z środowiskiem Docker i poznanie dodatkowej terminologi w konteneryzacji. Druga część ćwiczenia dotyczyła instalacji Jenkinsa.


## Wykonanie ćwiczenia:

1. Utworzenie woluminu wejściowego (volume_input) oraz woluminu wyjściowego (volume_output) poleceniem `sudo docker volume create`:

![img](photo1.PNG)


2. Sprawdzenie czy woluminy zostały stworzone poprawnie wypisując wszystkie woluminy komendą `sudo docker volume ls`:

![img](wyswietlenie_woluminow.PNG)


3. Wyświetlenie informacji o utworzonych woluminach za pomocą polecenia `sudo docker inpect`:

![img](inspect.PNG)


4. Utworzenie i uruchomienie kontenera z utworzonymi wcześniej woluminami:

![img](utworz_kontenera_z_woluminami.PNG)


5. Sklonowanie repozytorium z poprzednich ćwiczeń na wolumin wejściowy. Link do repozytorium https://github.com/typicode/json-server:

![img](sudo_-i.PNG)
![img](git_clone.PNG)


6. Skopiowanie repozytorium z wolumina do kontenera poleceniem `cp volumin_input/json-server/ json-server -r`:

![img](cp_volume_input.PNG)


7. Instalacja niezbędnych zależności poleceniem `npm install`:

![img](npm_install.PNG)


8. Zbudowanie programu w kontenerze poleceniem `npm run build`:

![img](npm_run_build.PNG)


9. Zapisanie na woluminie wyjściowym powstałych przy bududowaniu plików poleceniem `cp -r json-server /volume_output/`:

![img](skopiowanie_folderu_na_woluminie_wyjsciowym.PNG)


10. Uruchomienie wewnątrz kontenera serwera iperf3:

![img](iPerf.PNG)


11. Odczytanie IP kontenera i hosta:

![img](ifconfig.PNG)


12. Połączenie z serwerem z drugiego kontenera:

Drugi kontener:
![img](kontener_kontener1.PNG)

Serwer:
![img](kontener_kontener2.PNG)


13. Połączenie z serwerem z hosta:

Host:
![img](server-host1.PNG)

Serwer:
![img](server-host2.PNG)


14. Połączenie z serwerem spoza hosta:

Windows:
![img](cmd.PNG)

Serwer:
![img](cmd_server.PNG)


15. Podsumowanie przepustowości komunikacji:

Analizując uzyskane wartości przepustowości komunikacji można zauważyć, że najszybsze łącze występuje pomiędzy kontenerem a hostem, a przepustowość wynosi 32,4 Gbits/sec. Nieco niższą przepustowość można odczytać w komunikacji pomiędzy dwoma kontenerami i wynosi ona 18,7 Gbits/sec. Najniższą przepustowość, a więc najwolniejsze łącze występuje pomiędzy serwerem a windowsem i wynosi 2,34 Gbits/sec.


16. Utworzenie sieci mostkowej w Dockerze poleceniem `sudo docker network create jenkins`: 

![img](jenkins1.png)


17. Pobranie i uruchomienie obrazu docker:dind:

![img](jenkins4.png)
![img](jenkins3.png)


18. Wyświetlenie aktualnie działających kontenerów poleceniem `sudo docker ps`:

![img](docker_ps.png)


19. Zbudowanie obrazu z pliku Dockerfile poleceniem `sudo docker build . -f jenkins_Dockerfile -t myjenkins-blueocean:2.332.1-1`:

![img](jenkins_build.png)


20. Uruchomienie obrazu jako kontener w Dockerze:

![img](jenkins_sudo_docker_run.png)


21. Odblokowywanie Jenkinsa:

![img](odblokuj.png)


22. Odczytanie hasła potrzebnego do odblokowania Jenkinsa:

![img](haslo.png)


23. Po zainstalowaniu dodatkowych wtyczek utworzenie pierwszego administratora: 

![img](admin.png)


24. Potwierdzenie zakończenie konfiguracji Jenkinsa:

![img](gotowy.png)


25. Panel startowy dla zalogowanego użytkownika:

![img](panel_startowy.png)





