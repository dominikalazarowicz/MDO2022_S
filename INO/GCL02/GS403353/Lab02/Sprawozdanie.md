# Sprawozdanie - lab_02
## Gerard Skomin
### 1. & 2. Przygotowanie git hook'a i umieszczenie go w sprawozdaniu
* Sprawdzanie zgodności tytułu commit'a  
  * Kod w **bash'u**  
    ![](hook.png)
  * Sprawdzenie działania  
    ![](hook2.png)
* Sprawdzanie odpowiedniej treści commit'a

### 3. Przygotowanie środowiska Docker
* Konfiguracja środowiska do obsługi środowiska Docker'owego
  * Doinstalowywanie narzędzi  
    ![](ssh1.png)  
    ![](ssh2.png)  
  * Działanie SSH  
    ![](ssh3.png)
    ![](ssh4.png)  
    ![](ssh5.png)  
  * Połączenie systemu Windows z virtualką Ubuntu  
    ![](ssh6.png)
* Instalacja Docker'a - wykonanie poszczególnych kroków z dokumentacji dla Ubuntu: https://docs.docker.com/engine/install/ubuntu/    
  ![](inst1.png)  
  ```bash
  sudo apt-get update
  sudo apt-get install docker-ce docker-ce-cli containerd.io
  ```

### 4. Działanie środowiska
* Wykazanie działania z definicji - działanie deamon'a dockerowego, listowanie obrazów, uruchomienie obrazu `hello-world`  
  ![](zdef1.png)  
  ![](zdef2.png)
* Wykazanie działania z własności
  * Pobranie obrazu **Fedory** i jej uruchomienie  
    ![](zwł1.png)
  * Wyświetlenie numeru wersji poprzez interaktywną komunikację z kontenerem  
    ![](zwł2.png)
    ![](zwł3.png)

### 5. Założenie konta na Docker Hub  
![](docker_hub.png)