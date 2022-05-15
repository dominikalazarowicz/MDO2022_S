# Sprawozdanie Lab_5 Kacper Nosarzewski
## 1. Cel cwiczenia
Celem laboratorium bylo przygotowanie projektu z moliwoscia automatycznego wykonania czynnosci wykonanych na poprzednich labolatoriach takich jak budowanie i testowania oraz wdrozenia i publikowania 

## 2. Opis projektu
W celu wykonania projektu zostaly stworzone dwa Dockerfile.
 Dockerfile1 zawiera polecenia potrzebne do sklonowania repozytorium `https://github.com/knosarzewski/mongo-express` zainstalowania potrzebnych zaleznosci jak i zbudowanie programu. 
 Dockerfile2 zawiera polecenia uruchomiajace testy przeprowadzone dla wybranego repozytorium.
 Deploy zostal przeprowadzony wewnatrz kontenera wykorzystujac obraz Node.
 W kroku publish ze zbudowanego programu zostala stworzona paczka tar.tgz

## 3. Wykonanie cwiczenia

 1. Przygotowanie kontenerow

 ![img](kontenery.PNG)
Opis:

Zostaly przygotowane dwa kontenery kontener zawierajacy Jenkins o nazwie jenkins-blueocean a takze kontener wykonawczy z obrazem DIND kn_docker.
Polecenia potrzebne do uruchomienia tych kontenerow znajduja sie w dokumentacji Jenkinsa znajdujacej sie pod linkiem 
`https://www.jenkins.io/doc/book/installing/docker/` w razie wystapienia problemow pod linkiem `https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/tree/KN401526/ITE/GCL06/KN401526/Lab04` gdzie zostaje przedstawione jak sa one tworzone
aby sprawdzic czy kontenery zostaly poprawnie utworzorne mozna to zrobic za pomoca polecenia `sudo docker ps`

 2. Konfiguracja Pipline

    ![img](link_repo.PNG)

Opis:

W celu prawidloweo skonfigurowania pipline nalezy
 utworzyc nowy projekt pipline nastepnie wybrac 
 Definition `Pipline script from SCM` w zakladce `SCM` 
 nalezy wybrac opcje `Git` nastepnie nalezy 
 skopiowac link do repozytorium w ktorym znajduja sie potrzebne pliki
`https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S`
 
 3. Dalsza konfiguracja

  ![img](branch_jenkinsfile.PNG)


Opis:

W polu `Branch Specifier` nalezy wpisac `KN401526` nastepnie przechodzac do pola `Script Path` nalezy skopiowac sciezke do pliku 
Docker_Jenkinfile `TE/GCL06/KN401526/Lab05/Docker_Jenkinfile` w ktorym znajduja sie poszczegolnie kroki przeprowadzenia projektu

 4. Dockerfile1-Sklonowanie i zbudowanie repozytorium

 ```
 FROM node:latest

RUN git clone https://github.com/knosarzewski/mongo-express.git

WORKDIR mongo-express

RUN npm install

RUN npm run build
 ```
 Opis:

Powyzszy Dockerfile odpowiada za wykonanie polecenia git clone w celu sklonowania repozytorium mongo-express jak i zainstalowanie potrzebnych zaleznosci w celu pozniejszego przeprowadzenia budowy aplikacji 

5. Dockerfile2-Testowanie repozytorium

```
FROM kacper_build:latest

WORKDIR mongo-express

RUN npm test
```

Opis:

Powyzszy Dockerfile odpowiada za przeprowadzenie testow znajdujacych sie w repozytorium mongo-express

6. Jenkinsfile

    1. Parametry

    ```
    parameters
    {
        string(name: 'VERSION', defaultValue: '1.0.0', description: '')
        booleanParam(name: 'PROMOTE', defaultValue: true, description: '')
    }

    agent any
    ```
    Opis:

    W powyzszym fragmencie zostaly pokazane parametry jak i ustawnie agenta na any co umozliwia uruchomie zadania na dowolnym wezle aktualnie dostepnym. Wykonywany Pipline zostal obarczony dwama parametrami VERSION okreslajaca wersje programu jak i PROMOTE ktora okreslala czy publish sie wykona tym jak i zapisywala artefakty

    2. Preparing and Cleaning
    ```
    stage('Preparing and Build Cleaning')
     	{
     	  steps
     	  {
     	    sh 'docker volume create kacper_in'
            sh 'docker volume create kacper_out'
            sh 'docker rm -f kacper_build || true'
            sh 'docker volume prune -f'
     	  }
     	}
    ```

    Opis:

    Powyzszy fragment odpowiada za stworzenie dwoch voluminow wejsciowego i wyjsciowego jak i przeprowadzenia czyszczenia kontenerow uzytych w kroku budowania programu jak i usuniecia wszystkich nieaktywnych voluminow
    
    3. Build
    ```
    stage('Build') 
        {
            steps 
            {
              
              sh 'docker build . -f ./ITE/GCL06/KN401526/Lab05/Dockerfile1 -t kacper_build'
  	          sh 'docker run --mount type=volume,src="kacper_build",dst=/kacper_in kacper_build:latest bash -c "cd .. && cp -r /mongo-express /kacper_in && cp -r /kacper_in /kacper_out && ls ./kacper_in && ls ./kacper_out"'
            
            }
        }
    ```  

    Opis:
    
        
    












































