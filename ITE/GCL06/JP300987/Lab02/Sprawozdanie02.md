SPRAWOZDANIE 2

1. Przygotowanie git hook'a:
-utworzenie odpowiednich folderów:
![Obraz](1a.jpg)

-hook sprawdzający, czy tytuł commita nazywa się <inicjały><numer indeksu> (pierwszy if), hook sprawdzający, czy w treścin commita pada numer labu (drugi if):
![Obraz](1b.jpg)
![Obraz](1c.jpg)
Aby hook działał należy usunąć rozszerzenie sample z pliku.

-przetestowanie działania:
![Obraz](1d.jpg)

2. Zawartość commit-msg:
#!/usr/bin/env bash
INPUT_FILE=$1
START=`head $INPUT_FILE`
if ! [[ "$START" =~ "JP300987" ]]; then
  echo "Bad commit"
  exit 1
fi

if ! [[ "$START" == *"Lab02"* ]]; then
  echo "Bad commit"
  exit 1
fi


3. Przygotowanie środowiska Dockerowego:
-wykorzystanie WSL brak potrzeby konfiguracji ssh:
![Obraz](3a.jpg)

Sprawdzenie w PowerShell'u działających dystrybucji Linux'a:
![Obraz](3b.jpg)

-instalacja środowiska dockerowego:
Ze względu na wykorzystanie WSL Docker'a najpierw należy zainstalować desktopowo na Windowsie:
![Obraz](3c.jpg)
![Obraz](3d.jpg)

Następnie należy przejść do ustawień i sprawdzić czy jest włączona integracja dla WSL:
![Obraz](3e.jpg)

Przetestowanie działania dockera na Linux WSL:
![Obraz](3f.jpg)

4. Działanie środowiska:
-wykazanie, że środowisko dockerowe jest uruchomione i działa - z definicji:
![Obraz](4a.jpg)
![Obraz](4b.jpg)
![Obraz](4c.jpg)
Ze względu na wykorzystanie WSL nie można użyć komendy systemctl.

-wykazanie, że środowisko dockerowe jest uruchomione i działa w sposób praktyczny - z własnoci:
Pobranie obrazu dystrybucji linuksowej:
![Obraz](4d.jpg)
![Obraz](4e.jpg)

Uruchomienie dystrybucji i wyświetlenie numeru wersji:
![Obraz](4f.jpg)

5. Założenie konta na Docker Hub:
![Obraz](5a.jpg)
![Obraz](5b.jpg)

Użyte komendy:
Punkt 1:
cd MDO2022_S/ITE/GCL06/JP300987
git branch
mkdir Lab02
cd Lab02
touch Sprawozdanie02.md
nano ~/MDO2022_S/.git/hooks/commit-msg

Punkt 4:
docker run -d -p 80:80 docker/getting-started
docker run hello-world
docker info
sudo docker images
sudo docker ps
sudo docker rmi docker/getting-started --force
sudo docker rmi hello-world --force
sudo docker system prune --volumes
sudo docker ps
sudo docker images
sudo docker pull ubuntu
sudo docker images
sudo docker run --name test_ub -it ubuntu

