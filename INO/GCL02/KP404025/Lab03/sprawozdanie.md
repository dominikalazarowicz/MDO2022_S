# Sprawozdanie 3
# Kamil Pazgan Inżynieria Obliczeniowa GCL02

## Wybór oprogramowania na zajęcia
1. Repozytorium, które wybrałem w ramach zajęć to node-red: https://github.com/nodejs/nodejs.org
- Posiada ono otwartą licencję
- Narzędzia Makefile, dostępne na potrzeby testów to *npm*
- Sklonowałem repozytorium wykorzystując HTTPS i pobierając link z repozytorium\
![](./screenshots/1_clone.PNG)
- Zainstalowałem zależności ```npm install```\
![](./screenshots/2_npm_install.PNG)
- Następnie buduję projekt za pomocą ```npm run build```\
![](./screenshots/3_build1.PNG)\
![](./screenshots/4_build2.PNG)
- Na koniec uruchomiłem testy jednostkowe dołączone do repozytorium ```npm test```\
![](./screenshots/5_tst.PNG)
## Przeprowadzenie buildu w kontenerze
1. Kroki wykonane wewnątrz kontenera Node, który jest adekwatny do repozytorium
- W pierwszej kolejności uruchamiam kontener wraz z podłączeniem TTY za pomocą ```sudo docker run```, wykorzystując odpowiednie opcje: ```-p``` - określenie portu, ```-it``` - interaktywny terminal, ```bash``` - bash terminal\
![](./screenshots/6_kontener.PNG)
- Następnie klonuje repozytorium ```git clone https://github.com/nodejs/nodejs.org```\
![](./screenshots/7_clone_kontener.PNG)
- Instaluje na kontenerze npm ```npm install```\
![](./screenshots/8_npm_install_kontener.PNG)
- Uruchomienie buildu ```npm run build```\
![](./screenshots/9_build_kontener1.PNG)\
![](./screenshots/10_build_kontener2.PNG)
- Na koniec uruchomienie testu za pomocą ```npm test```\
![](./screenshots/11_kontener_test1.PNG)\
![](./screenshots/12_kontener_test2.PNG)
2. Pliki Dockerfile automatyzujące kroki powyżej
- Pierwszy plik wykonuje wszytkie kroki, aż do builda: ```FROM``` - najnowszy obraz, ```RUN``` - uruchamianie, ```WORKDIR``` - ścieżka\
![](./screenshots/13_buildfile.PNG)
- Drugi plik bazuje na pierwszym i uruchamia testy\
![](./screenshots/14_testfile.PNG)
3. Wykazanie, poprawności wdrażania się kontenera i poprawności działania
- W pierwszej kolejności sprawdziłem działanie pierwszego Dockerfile poprzez ```sudo docker build```, ```-f``` - wybór pliku, ```-t``` - nazwa obrazu\
![](./screenshots/15_dockerfile1.PNG)\
![](./screenshots/16_dockerfile2.PNG)
- Następnie drugiego\
![](./screenshots/17_dockerfile3.PNG)\
![](./screenshots/18_dockerfile4.PNG)
- Stworzone obrazy ```sudo docker images```\
![](./screenshots/19_docker_images.PNG)
- Potwierdzenie działania, uruchomienie kontenera z utworzonego obrazu\
![](./screenshots/20_dowod.PNG)

