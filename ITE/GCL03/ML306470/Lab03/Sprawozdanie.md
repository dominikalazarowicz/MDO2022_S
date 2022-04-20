### Wybór oprogramowania na zajęcia
* Znajdź repozytorium z kodem dowolnego oprogramowania, które:
	* dysponuje otwartą licencją
	* jest umieszczone wraz ze swoimi narzędziami Makefile tak, aby możliwe był uruchomienie w repozytorium czegoś na kształt ```make build``` oraz ```make test```. Środowisko Makefile jest dowolne. Może to być automake, meson, npm, maven, nuget, dotnet, msbuild...
	* Zawiera zdefiniowane i obecne w repozytorium testy, które można uruchomić np. jako jeden z "targetów" Makefile'a. Testy muszą jednoznacznie formułować swój raport końcowy (gdy są obecne, zazwyczaj taka jest praktyka)

	Wykorzystane repozytorium: https://github.com/EchoOfCasual/Hello-World-With-Tests-Maven.git


---

* Sklonuj niniejsze repozytorium, przeprowadź build programu (doinstaluj wymagane zależności)

	Klonowanie repozytorium i budowanie programu (```mvn install```)
	
![clone and mvn install](ScreenShots/cloneAndBuildPart1.png?raw=true)

![build success](ScreenShots/cloneAndBuildPart2.png?raw=true)

---

* Uruchom testy jednostkowe dołączone do repozytorium

	Uruchomienie testów (```mvn test```)
	
![unit tests](ScreenShots/unitTests.png?raw=true)

---

### Przeprowadzenie buildu w kontenerze
1. Wykonaj kroki build i test wewnątrz wybranego kontenera bazowego. Tj. wybierz "wystarczający" kontener, np ```ubuntu``` dla aplikacji C lub ```node``` dla Node.js
	* uruchom kontener
	* podłącz do niego TTY celem rozpoczęcia interaktywnej pracy
	* zaopatrz kontener w wymagania wstępne (jeżeli proces budowania nie robi tego sam)
	
	Został wybrany "wystarczający" kontener ```ubuntu``` (obraz w dockerze został z poprzednich zajęć).
	
	![images](ScreenShots/images.png?raw=true)
	
	
	Następnie został uruchomiony kontener w trybie pracy interaktywnej i wykonano w nim komendy ```apt-get update``` i ```apt-get install git``` (w celu instalacji gita)
	
	![](ScreenShots/contenerAndAptUpdateAndGit.png?raw=true)
	
	
	Następnie zainstalowane zostały: maven i openjdk-17-jdk używając komend ```apt-get install maven``` i ```apt-get install openjdk-17-jdk```
	
	![installMaven](ScreenShots/installMaven.png?raw=true)
	
	![installJava](ScreenShots/installJava.png?raw=true)
	
	---
	
	* sklonuj repozytorium
	
	Sklonowano repozytorium komendą ```git clone https://github.com/EchoOfCasual/Hello-World-With-Tests-Maven.git```
	
	![gitCloneContainer](ScreenShots/gitCloneContainer.png?raw=true)
	
	---
	
	* uruchom build
	
	Uruchamianie buildu nie powiodło się za pierwszym razem, ponieważ została zainstalowana wersja mavena 3.6.3, która działa z javą 11, dlatego też została zainstalowana openjdk-11-jdk komendą ```apt-get install openjdk-11-jdk```. Następnie została zmieniona ścieżka do jvm 11 z użyciem komendy ```export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/```.
	Następnie uruchamianie buildu powiodło się. (```mvn install```).
	
	![java11](ScreenShots/java11.png?raw=true)
	
	![settingJava11AndBuildingApp](ScreenShots/settingJava11AndBuildingApp.png?raw=true)
	
	![buildingAppSuccess](ScreenShots/buildingAppSuccess.png?raw=true)
	
	---
	
	* uruchom testy
	
	Uruchomienie testów używając komendy ```mvn test```
	
	![mvnTestContainer](ScreenShots/mvnTestContainer.png?raw=true)
	
	---
	
2. Stwórz dwa pliki Dockerfile automatyzujące kroki powyżej, z uwzględnieniem następujących kwestii
	* Kontener pierwszy ma przeprowadzać wszystkie kroki aż do builda
	
	Docker-build:
	```
	FROM ubuntu:latest

	RUN apt-get -y update && apt-get -y install git

	ENV TZ=Europe/Warsaw
	RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
	RUN apt-get -y install maven

	RUN apt-get -y install openjdk-11-jdk

	RUN git clone https://github.com/EchoOfCasual/Hello-World-With-Tests-Maven.git
	WORKDIR Hello-World-With-Tests-Maven
	RUN mvn install
	```
	
	Użyta komenda ```sudo docker build -t builder:latest . -f ./Docker-build```
	
	![dockerfileBuildStart](ScreenShots/dockerfileBuildStart.png?raw=true)
	
	![dockerfileBuildComplete](ScreenShots/dockerfileBuildComplete.png?raw=true)
	
	---
	
	* Kontener drugi ma bazować na pierwszym i wykonywać testy
	
	```
	FROM builder:latest

	RUN mvn test
	```
	
	Użyta komenda ```sudo docker build -t tester:latest . -f ./Docker-test```
	
	![dockerfileTest](ScreenShots/dockerfileTest.png?raw=true)
	
	---
	
3. Wykaż, że kontener wdraża się i pracuje poprawnie. Pamiętaj o różnicy między obrazem a kontenerem. Co pracuje w takim kontenerze?

	Kontenery działają. Po użyciu komend ```sudo docker run builder:latest``` i ```sudo docker run tester:latest```, a następnie ```sudo docker ps -a``` można zauważyć 2 kontenery (bazujące na obrazach tester:latest i builder:latest), które działały chwilę przed użyciem ostatniej z komend i zakończyły się kodem 0 (tzn. bez błędu).
	![containersAreWorking](ScreenShots/containersAreWorking.png?raw=true)