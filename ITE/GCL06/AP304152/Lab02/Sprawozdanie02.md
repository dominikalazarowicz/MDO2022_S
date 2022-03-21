# Sprawozdanie 2

### Zadanie 1

-Utworzenie wymaganych folderów
![Obraz](1.png)

-Hook sprawdzający czy tytuł commita nazywa się <AP304152> tak jak nasz branch oraz czy w treści commita znajduję się numer laboratorium
  
![Obraz](2.png)

-Przetestowanie działania
![Obraz](3.png)

  
  ### Zadanie 2
-Zawartość commit-msg:
  
  #!/usr/bin/env bash

INPUT_FILE=$1

START=head $INPUT_FILE

if ! [[ "$START" =~ "JP300987" ]]; then

echo "Bad commit"

exit 1

fi

if ! [[ "$START" == *"Lab02"* ]]; then

echo "Bad commit"

exit 1

fi
  
### Zadanie 3
  -Wykorzystano WSL, dzięki czemu nie ma potrzeby konfiguracji SSH
  ![Obraz](4.png)
  
  
  -Sprawdzenie w Windows PowerShell działających dystrybucji Linux'a oraz ich wersji i  ewentualna zmiana wersji wsl z 1 na 2:
  ![Obraz](5.png)
  ![Obraz](5a.png)
  
  
  -Instalowanie środowiska Dockerowego:
  ![Obraz](6.png)
  ![Obraz](7.png)
  
  
  -Następnie należy przejść do ustawień i sprawdzić czy jest włączona integracja dla WSL:
  ![Obraz](7a.png)
  
  
  ### Zadanie 4
  Przetestowanie działania środowiska:
  ![Obraz](8.png)
  ![Obraz](8a.png)
  
  
  -Wykazanie, że środowisko dockerowe jest uruchomione i działa(z definicji):
  ![Obraz](9.png)
  ![Obraz](10.png)
  ![Obraz](11.png)
  
  
   -Wykazanie, że środowisko dockerowe jest uruchomione i działa(sposób praktyczny):
  ![Obraz](12.png)
  
  
  -Uruchomienie dystrybucji Ubuntu i wyświetlenie numeru wersji:
  ![Obraz](13.png)
  
  
  ### Zadanie 5
  -Założenie konta na DockerHub
  ![Obraz](14.png)
  ![Obraz](15.png)
