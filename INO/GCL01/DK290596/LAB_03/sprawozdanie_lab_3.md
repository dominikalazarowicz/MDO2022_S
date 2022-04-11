### Daniel Kabat
### Inzynieria Obliczeniowa
### INO GCL-01

# Laboratorium 03

## Wybór oprogramowania na zajęcia.

W ramach tej części należało znaleźć repozytorium z kodem dowolnego oprogramowania, które posiada otwartą licencję, a także zawiera narzędzia typu MakeFile umożliwiające przeprowadzenie builda i urochomienie testów. W tym celu w wyszukiwarce została wpisana odpowiednia fraza i jedna z początkowych propozycju okazała się spełniać wymagania. Był to link do oprogramowania Node-RED. Link do jakiego zostaliśmy przeniesieni był następujący:

https://github.com/node-red/node-red

Wyszukiwanie wyglądało w następujacy sposób




![how_to_find](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596/INO/GCL01/DK290596/LAB_03/how_to_find_open_source_app.PNG)

Repozytorium zawierało folder z testami oraz informacje jak dokonać builda.

![git](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596/INO/GCL01/DK290596/LAB_03/git.PNG)

Kolejno należało wykonać następujące kroki:

1. Sklonować niniejsze repozytorium i przeprowadzić build programu (doinstalowywując wymagane zależności)

Repozytorium zostało pobrane przy pomocy https w sposób przedstawiony na poniższym zrzucie ekranu
![download_node_red](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596/INO/GCL01/DK290596/LAB_03/download_node_red.PNG)

Kolejno została użyta komenda:
npm install
jednak okazało się ze trzeba pobrać odpowiednie pakiety związane z npm zatem została użyta komenda:
sudo apt-get install npm
a dopiero potem możliwe było użycie:
npm install

Po tym można było przejść do builda którego uruchomienie następowało po użyciu polecenia:
npm run build
widać to na załoczonym poniżej zrzucie.
![build_npm](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596/INO/GCL01/DK290596/LAB_03/build_npm.PNG)

2. Uruchomić testy jednostkowe dołączone do repozytorium.

Uruchomienie testów następowało przy użyciu polecenia:
npm test
Na poniższym zrzucie widać także informacje Done odnoszącą się do pomyślnie przeprowadzonego builda
![test_npm](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596/INO/GCL01/DK290596/LAB_03/test_npm.PNG)


## Przeprowadzenia builda w kontenerze.

1. Uruchomienie kontenera

Z racji że build uprzednio był wykonywany na Ubuntu wybór obrazu dla kontenera również padł na Ubuntu.

Sprawdziłem czy posiadam obraz Ubuntu przy pomocy polecenia:
sudo docker images
Okazało się, że nie zatem pobrałem obraz przy pomocy polecenia:
sudo docker pull ubuntu
Opisaną operację widać na zrzucie poniżej
![pull_ubuntu](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596/INO/GCL01/DK290596/LAB_03/docker_ubuntu.PNG)
Następnie został uruchomiony kontener o nazwie node_red oparty na obrazie Ubuntu przy pomocy polecenia:
sudo docker run --name node_red -it ubuntu

![node_red_ubuntu](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596/INO/GCL01/DK290596/LAB_03/node_red_ubuntu.PNG)

2. Zaopatrzenie kontenera w wymagania wstępne

Z racji, że początkowa funkcjonalność obrazu jest stosunkowo ogranoczona i nie można odrazu pobrać repozytorium przy użyciu git clone należało wykanać następującą sekcję komend:
apt-get update
![docker_get_update](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596/INO/GCL01/DK290596/LAB_03/docker_apt_update.PNG)

apt-get install git
![docker_git_install](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596/INO/GCL01/DK290596/LAB_03/docker_git_install.PNG)

Po takim zabiegu git już jest obsługiwany

3. Sklonowanie repozytorium

W tym momencie mogliśmy użyć już klasycznie komendy git clone w następujacej postaci:
git clone https://github.com/node-red/node-red.git
![docker_git_clone](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596/INO/GCL01/DK290596/LAB_03/docker_git_pull.PNG)

4. Uruchoienie builda

Przed uruchomieniem builda należało pobrać dependencje do niego potrzebne przy pomocy tak samo jak uprzegdnio polecenia:
npm install
![docker_npm_instal](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596/INO/GCL01/DK290596/LAB_03/docker_npm_install.PNG)

teraz można było uruchomić builda polecenie:
npm run build
![docker_build](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596/INO/GCL01/DK290596/LAB_03/docker_npm_run_build.PNG)

5. Uruchoienie testów

W celu uruchoienia testów należało jak uprzednio urzyć polecenia:
npm test
Na poniższym zrzucie widać również informajcę Done mówiąca o tym, że build sie powiódł.
![docekr_npm_test](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596/INO/GCL01/DK290596/LAB_03/test_npm.PNG)

## Utworzenie plików dockerfile









