##Sprawozdanie 2
Będę pracował ze środowiskiem dockerowym na Windowsie, poprzez aplikację Docker Desktop for Windows. Chciałbym zaznaczyć, że wiele kroków ze sprawozdania zrobiłem już w przeszłości, ponieważ czasami pracuję z dockerem.
1. Zacząłem od utworzenia dwóch hooków, w specjalnym folderze (stan po edycji hooków):
   ![Alt text](hooks-folder.PNG?raw=true)
2. Zawartość hooków
   ![Alt text](commit-msg.PNG?raw=true)
   ![Alt text](pre-commit.PNG?raw=true)
Po prostu zedytowałem oba pliki i usunąłem rozszerzenie *.sample*.
3. Przykład działania Hooków - Error
   ![Alt text](commit-error.PNG?raw=true)
   ![Alt text](commit-error2.PNG?raw=true)
4. Przykład działania Hooków - Success
   ![Alt text](commit-success.PNG?raw=true)
5. przygotowanie środowiska dockera na Windows 10
   W tym celu użyłem Docker Desktop for Windows
   ![Alt text](docker-desktop-windows.PNG?raw=true)
   Dzięki Docker Desktop for Windows mogę w wygodny sposób zaglądać do wnętrza kontenera poprzez terminal cmd.
6. Wykazanie, że środowisko dockerowe działa z definicji (Windows PowerShell):
   ![Alt text](working-definition.PNG?raw=true)
7. Wykazanie, że środowisko dockerowe działa za pomocą docker cli:
   ![Alt text](docker-version.PNG?raw=true)
8. Wykazanie, że srodowisko dockerowe działa za pomocą uruchomienia kontenera z ubuntu:
   ![Alt text](ubuintu-os-release.PNG?raw=true)
9. Dostęp do kontenera ubuntu poprzez Docker Desktop for Windows
10. ![Alt text](terminal.PNG?raw=true)
11. Potwierdzenie posiadania konta na dockerHub:
    ![Alt text](dockerhub-account.PNG?raw=true)
