# Lab02
## Mikołaj Migacz
### Wybór oprogramowania
1. Wybrałem repozytorium `https://github.com/spring-projects/spring-petclinic`
2. Sklonowałem wybrane repozytorium komendą `git clone git@github.com:spring-projects/spring-petclinic.git`
![img](./sc/0.1.PNG)
![img](./sc/0.2.PNG)
3. Zainstalowałem potrzebne narzędzia.
```
sudo apt install maven
sudo apt install default-jdk
```
![img](./sc/0.3.PNG)
![img](./sc/0.4.PNG)
4. Zbudowałem skonowane repozytorium.
```./mvnw install -DskipTests```
![img](./sc/0.5.PNG)
![img](./sc/0.6.PNG)
5. Uruchomiłem testy.
```./mvnw test```
![img](./sc/0.7.PNG)
![img](./sc/0.8.PNG)
### Przeprowadzenie buildu w kontenerze
1. Uruchomiłem kontener i podłączyłem do niego TTY.
```docker run -it --name test_lab3 openjdk:16-jdk-alpine sh```
![img](./sc/1.1.PNG)
2. W obrazie instalujemy gita i klonujemy repozytorium.
```
apk add git
git clone https://github.com/spring-projects/spring-petclinic.git
```
![img](./sc/1.2.PNG)
![img](./sc/1.3.PNG)
3. Przechodzimy do sklonowanego repozytorium i tak jak poprzednio budujemy go.
```
cd spring-petclinic
./mvnw install -DskipTests
```
![img](./sc/1.4.PNG)
![img](./sc/1.5.PNG)
4. Uruchamiam testy.
```
./mvnw test
```
![img](./sc/1.6.PNG)
![img](./sc/1.7.PNG)
### Tworzenie plików Dockerfile
1. Kroki które wykonaliśmy w poprzedniej sekcji, chcemy zapisać w pliku Dockerfile aby zostały wykonywane  za nas.
2. Tworzę dockerBuild - automatyzujący budowanie projektu.
```
touch dockerBuild
```
![img](./sc/2.1.PNG)
![img](./sc/2.2.PNG)
3. Buduje obraz z dockerBuild'a.
```docker build . -f dockerBuild -t lab3-petclinic```
![img](./sc/2.3.PNG)
4. Analogicznie postępuje z obrazem z dockerTest.
```
touch dockerTest
nano dockerTest
cat dockerTest
```
![img](./sc/2.4.PNG)
5. Buduje obraz z dockerTest'a.
```
docker build . -f dockerTest -t lab3-petclinic-test
```
![img](./sc/2.5.PNG)
6. Uruchamiamy kontener z zbudowanym obrazem. Domyślnie uruchamiany jest jshell. Aplikacje możemy wystartować po uruchomieniu kontenera.
```
Docker run -it –name pet-clinic-tested lab3-petclinic-test:latest
```
![img](./sc/2.7.PNG)