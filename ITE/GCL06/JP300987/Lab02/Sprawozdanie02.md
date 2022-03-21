SPRAWOZDANIE 2

1. Przygotowanie git hook'a:

-utworzenie odpowiednich folderów:

![1a](https://user-images.githubusercontent.com/92218468/159165429-373a3582-b16e-4941-a849-ba332e334f7e.JPG)

-hook sprawdzający, czy tytuł commita nazywa się <inicjały numer indeksu> (pierwszy if), hook sprawdzający, czy w treści commita pada numer laboratorium (drugi if):

![1b](https://user-images.githubusercontent.com/92218468/159165449-b0cf028e-467b-4a77-8a84-9df9e345e235.JPG)

![1c](https://user-images.githubusercontent.com/92218468/159165452-7a22f353-31b2-438b-96cf-9d5f441781bb.JPG)

Aby hook działał należy usunąć rozszerzenie .sample z pliku oraz użyć komendy chmod +x commit-msg.

-przetestowanie działania:

![1d](https://user-images.githubusercontent.com/92218468/159165459-58c01910-baf8-4db2-87fa-92008f5be619.JPG)


2. Zawartość commit-msg:
  
#!/usr/bin/env bash
  
INPUT_FILE=$1
  
START=`head $INPUT_FILE`
  
if ! [[ "$START" =~ "JP300987" ]]; then
  
  echo "Bad commit"
  
  exit 1
  
fi
  

if ! [[ "$START" == \*"Lab02"\* ]]; then
  
  echo "Bad commit"
  
  exit 1
  
fi


3. Przygotowanie środowiska Dockerowego:
  
-wykorzystanie WSL brak potrzeby konfiguracji ssh:

![3a](https://user-images.githubusercontent.com/92218468/159165471-93809097-0a99-4e85-8684-209e18694189.JPG)

Sprawdzenie w PowerShell'u działających dystrybucji Linux'a:

![3b](https://user-images.githubusercontent.com/92218468/159165474-b00d29f4-d7c2-46cf-8193-730fca550284.JPG)

-instalacja środowiska dockerowego:
  
Ze względu na wykorzystanie WSL Docker'a najpierw należy zainstalować desktopowo na Windowsie:

![3c](https://user-images.githubusercontent.com/92218468/159165476-705523cd-60f2-4f25-9157-9c07267d5bae.JPG)

![3d](https://user-images.githubusercontent.com/92218468/159165477-494af12e-1802-4c8e-9fb1-2c963fbac2fc.JPG)


Następnie należy przejść do ustawień i sprawdzić czy jest włączona integracja dla WSL:

![3e](https://user-images.githubusercontent.com/92218468/159165480-90c70658-b0d6-489f-b6ca-b6a48cea6ebf.JPG)

Przetestowanie działania dockera na Linux WSL:

![3f](https://user-images.githubusercontent.com/92218468/159165483-29f0da87-6009-457d-910d-7debb64e7792.JPG)


4. Działanie środowiska:

-wykazanie, że środowisko dockerowe jest uruchomione i działa - z definicji:

![4a](https://user-images.githubusercontent.com/92218468/159165486-972ac1b3-558d-478e-b51f-2c8c9920db88.JPG)

![4b](https://user-images.githubusercontent.com/92218468/159165492-d6838907-8004-4d92-a8b1-96685dbc435a.JPG)

![4c](https://user-images.githubusercontent.com/92218468/159165497-f7568817-5a51-476a-8d0d-aeb632e9e8a9.JPG)

Ze względu na wykorzystanie WSL nie można użyć komendy systemctl.

-wykazanie, że środowisko dockerowe jest uruchomione i działa w sposób praktyczny - z własnoci:

Pobranie obrazu dystrybucji linuksowej:

![4d](https://user-images.githubusercontent.com/92218468/159165501-3608c299-8d61-46f5-9c0c-a6bf8592fb3d.JPG)

![4e](https://user-images.githubusercontent.com/92218468/159165508-efcd0e1d-f492-4bd8-8abd-3d675f4dca50.JPG)


Uruchomienie dystrybucji i wyświetlenie numeru wersji:

![4f](https://user-images.githubusercontent.com/92218468/159165511-6ebeacfe-cfdd-4e1b-8ecb-3c68bd82c146.JPG)


5. Założenie konta na Docker Hub:

![5a](https://user-images.githubusercontent.com/92218468/159165515-0630ba17-fcf0-48e6-a218-ece202977201.JPG)

![5b](https://user-images.githubusercontent.com/92218468/159165516-064c426f-2646-406a-a18d-0dbfe2112fc9.JPG)


Użyte komendy:

Punkt 1:

cd MDO2022_S/ITE/GCL06/JP300987

git branch
  
mkdir Lab02

cd Lab02

touch Sprawozdanie02.md

nano ~/MDO2022_S/.git/hooks/commit-msg.sample
chmod +x commit-msg


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



WNIOSKI:

Dzięki zastosowaniu git hooks staje się możliwa dogłębna analiza wprowadzanych poleceń git, dzięki temu jestesmy w stanie ustrzec się przed błędami wynikającymi z naszych niedopatrzeń. Pliki te znajdują się w jednym folderze co umożliwai sprawne zarządzanie nimi.

Zastosowanie środowiska dockerowego pozwala na wykorzystanie mechanizmu konteneryzacji, które polega na możliwości uruchomienia procesu w odizolowanym środowisku nazywanym kontenerem. Umożliwia pewną mobilność w zarządzaniu skonteneryzowanymi aplikacjami.

