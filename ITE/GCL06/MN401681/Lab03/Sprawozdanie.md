### Michał Nycz
### Informatyka-Techniczna
### Gr-lab 06

----
# Sprawozdanie
## Metodyki DevOps lab_nr_03

> ### Znajdź repozytorium z kodem dowolnego oprogramowania, które:
> - dysponuje otwartą licencją
> - jest umieszczone wraz ze swoimi narzędziami Makefile tak, aby możliwe był uruchomienie w repozytorium czegoś na kształt make build oraz make test. Środowisko Makefile jest dowolne. Może to być automake, meson, npm, maven, nuget, dotnet, msbuild...
> - Zawiera zdefiniowane i obecne w repozytorium testy, które można uruchomić np. jako jeden z "targetów" Makefile'a. Testy muszą jednoznacznie formułować swój raport końcowy (gdy są obecne, zazwyczaj taka jest praktyka)
> - Sklonuj niniejsze repozytorium, przeprowadź build programu (doinstaluj wymagane zależności)
> - Uruchom testy jednostkowe dołączone do repozytorium

----

#### W odpowiednim miejscu (na naszej gałęzi, w odpowiednim katalogu) utworzono plik ze sprawozdaniem.
![image](https://user-images.githubusercontent.com/75485199/160900852-cd117ed5-1a6b-4cfc-b2c0-b9aa44fbd009.png)
----
Klonujemy repozytorium z GitHub za pomocą komendy 
```
git clone git@github.com:spring-projects/spring-petclinic.git
```
![image](https://user-images.githubusercontent.com/75485199/160900908-f4670568-7aa8-4215-9b27-81b53407918f.png)

![image](https://user-images.githubusercontent.com/75485199/160900923-508e0492-1ef0-4685-8580-6c76fcc1f374.png)
----
Następnie przygotowujemy nasze „stanowisko robocze” do dalszej pracy:
```
sudo apt install maven
sudo apt install default-jdk
```
![image](https://user-images.githubusercontent.com/75485199/160900985-1bf64115-b7f3-4941-96cb-8dac70d1a586.png)

![image](https://user-images.githubusercontent.com/75485199/160900998-61e84fa0-84ec-4caf-b993-afdb8bc7f257.png)
----
Następnie budujemy program:
```
./mvnw install -DskipTests
```
![image](https://user-images.githubusercontent.com/75485199/160901043-b6cb8599-5d73-44f5-a3e3-bd9bc0a9b1d8.png)

![image](https://user-images.githubusercontent.com/75485199/160901068-f5a50470-eb8a-4597-9eac-ac4f7b03cf92.png)
----

Dodatkowo uruchamiamy testy, które są dostępne w repozytorium:
```
./mvnw test
```
![image](https://user-images.githubusercontent.com/75485199/160901120-69fa302e-2155-4c86-8957-a3a30db7ad28.png)

![image](https://user-images.githubusercontent.com/75485199/160901148-400e5ce7-5868-43df-afa9-a1be9e4f7b32.png)
----
> ### Przeprowadzenie buildu w kontenerze
> - Wykonaj kroki build i test wewnątrz wybranego kontenera bazowego. Tj. wybierz "wystarczający" kontener, np ubuntu dla aplikacji C lub node dla Node.js
> - uruchom kontener
> - podłącz do niego TTY celem rozpoczęcia interaktywnej pracy
> - zaopatrz kontener w wymagania wstępne (jeżeli proces budowania nie robi tego sam)
> - sklonuj repozytorium
> - uruchom build
> - uruchom testy

Kolejnym krokiem jest uruchomienie kontenera oraz podłączenie do niego TTY:
```
docker run -it –name test_lab3 openjdk:16-jdk-alpine sh
```
![image](https://user-images.githubusercontent.com/75485199/160901227-1654dde1-b62b-4c0c-af24-98a27e644a8a.png)
----
W uruchomionym obrazie instalujemy git, a następnie klonujemy repozytorium:
```
apk add git
git clone git@github.com:spring-projects/spring-petclinic.git
```
![image](https://user-images.githubusercontent.com/75485199/160901269-3cc8fb06-53d4-405d-8ca6-e14775697599.png)

![image](https://user-images.githubusercontent.com/75485199/160901301-da6fd8ba-33b4-416e-b7e8-6cab1537d168.png)
----
Przechodzimy do odpowiedniego katalogu a następnie budujemy:
```
cd spring-petclinic
./mvnw install -DskipTests
```
![image](https://user-images.githubusercontent.com/75485199/160901340-5f3622d7-711e-4c7f-818c-9b1dffd92c50.png)

![image](https://user-images.githubusercontent.com/75485199/160901352-fb1e783d-6af0-4d81-a018-d81fc936338b.png)
----
Uruchamiamy test:
```
./mvnw test
```
![image](https://user-images.githubusercontent.com/75485199/160901389-a5f1ddc6-fad8-4c67-9416-4f25ae2058ca.png)

![image](https://user-images.githubusercontent.com/75485199/160901409-19c97d23-723d-4942-8264-56567f3f92bc.png)
----
> - Stwórz dwa pliki Dockerfile automatyzujące kroki powyżej =, z uwzględnieniem następujących kwestii:
> - Kontener pierwszy ma przeprowadzić wszystkie kroki aż do builda
> - KOntener drugi ma bazować na pierwszym i wykonywać testy


Teraz naszym zadaniem jest stworzenie dwóch plików automatyzujących kroki wykonane powyżej:
```
touch dockerBuild
nano dockerBuild
cat dockerBuild
docker build . -f dockerBuild -t lab3-petclinic
```
![image](https://user-images.githubusercontent.com/75485199/160901448-71ff5e97-5429-4a51-a739-afcf9cdbb305.png)

![image](https://user-images.githubusercontent.com/75485199/160901461-dbeddaef-b17d-4e5b-9e27-82ef529ec9df.png)
----
Tutaj można zauważyć, że pojawiła się literówka w pliku dockerBuild, co skutkowało ERROEREM w etapie [4/4]. Wprowadzono poprawkę
![image](https://user-images.githubusercontent.com/75485199/160901567-d200d2f7-3aa3-45cd-9ca5-a69a9d099500.png)

![image](https://user-images.githubusercontent.com/75485199/160901578-74f9c56d-8419-4692-bd69-07fa80776ac2.png)

Po poprawce, zauważamy dobre działanie:
![image](https://user-images.githubusercontent.com/75485199/160901634-1d0ec873-570a-4704-952c-32d54a0b0046.png)
----
Teraz drugi plik, z testami:
```
touch dockerTest
nano dockerTest
cat dockerTest
docker build . -f dockerTest-t lab3-petclinic-test
```
![image](https://user-images.githubusercontent.com/75485199/160901698-b723d0f5-fcca-4424-bdcb-e2f0b6120e8b.png)

![image](https://user-images.githubusercontent.com/75485199/160901747-5f31fe85-47be-4391-9091-51fbe84b47ac.png)
----
> - Wykaż, że kontener wdraża się i pracuje poprawnie. Pamiętaj o różnicy między obrazem a kontenerem. Co pracuje w takim kontenerze? 


Na koniec uruchamiamy kontener ze zbudowanym obrazem. 
Domyślnie odpala nam się jshell. Aplikacja na razie nie jest uruchomiona, lecz po uruchomioniu kontenera możemy wystartować naszą apliakcję.
```
Docker run -it –name pet-clinic-tested lab3-petclinic-test:latest
```
![image](https://user-images.githubusercontent.com/75485199/160901773-9ee465d7-0083-4202-81e9-0c7afceada9d.png)





