# Sprawozdanie
### Przygotowujemy pipeline!
---

Celem zadania było przprowadzenie czterech kroków: Build, Test, Deploy i Publish. Projekt, który wybrałam to strona nodejs.org. Celem całego zadania było przeprowadzenie operacji build, przetestowanie projektu, przygotowanie kontenera przeznaczonego do deployu opartego na nginx, który hostuje statyczne pliki, a także opublikowanie archiwum ze zbuildowanymi plikami strony nodejs.org, tak aby była ona łatwo przenośna i mogła działać na każdym innym urządzeniu.

- **Kontener Jenkins i DIND skonfigurowany według instrukcji dostawcy oprogramowania**

Instalacja konteneru z Jenkinsem i DIND'em została przeze mnie przeprowadzona w ramach poprzednich laboratoriów, więc nie wykonywałam tych czynności ponownie. DIND (Docker in Docker) jest kontenerem uruchamiającym następny kontener w sobie (istnieje możliwość budowania oraz uruchamiania kontenerów przez Docker wewnątrz konteneru). Myjenkins-blueocean:2.332.1-1 to kontener z Jenkinsem, zawierający system odpowiedzialny za Web UI oraz operatora Jenkinsa. Z kontenerem tym łącze się przez `localhost` na porcie `8080`.
W pierwszej kolejności uruchomiłam oba kontenery, najpierw kontener DIND:
![screen1](./screen1.png)

Następnie kontener z Jenkinsem:
![screen2](./screen2.png)

Sprawdziłam czy kontenery poprawnie działają za pomocą `sudo docker ps`.
![screen3](./screen3.png)

- **Pliki Dockerfile wdrażające instancję Jenkinsa załączone w repozytorium przedmiotowym pod ścieżką i na gałęzi według opisu z poleceń README**

Pliki Dockerfile załączyłam w repozytorium przedmiotowym, odpowiednio na swojej gałęzi `WD400194` w katalogu `Lab5`. Zamieściłam tam również plik `Jenkinsfile`, w którym zawarte są instrukcje kolejnych kroków pipelinu (build, test, deploy, publish).

![screen4](./screen4.png)

 - **Zdefiniowany wewnątrz Jenkinsa obiekt projektowy „pipeline”, realizujący następujące kroki:Build, Test, Deploy, Publish**
 

Przed realizacją poszczególnych kroków, najpierw klonowane jest repozytorium przedmiotowe `MDO2022_S`, aby pobrane były niezbędne do pipelinu pliki (Dockerfile, Jenkinsfile).
Stworzyłam obiekt projektowy `pipeline`, nazywając go jako `pipeline1`. 

![screen5](./screen5.png)

Następnie przeszłam do konfiguracji projektu. Zaznaczyłam opcję parametryzacji i przeszłam do ustawienia dwóch parametrów: `ProgramName` i `Version`.

![screen6](./screen6.png)
![screen7](./screen7.png)

W kolejnym kroku ustawiłam `Definition` na `Pipeline script from SCM`. Następnie przeszłam do konfiguracji `SCM` i ustawiłam jako adres URL, adres URL repozytorium przedmiotowego `MDO2022_S`. Wybrałam także odpowiednią gałąź `WD400194` oraz ustawiłam ścieżkę do pliku `Jenkinsfile`.

![screen8](./screen8.png)
![screen9](./screen9.png)

#### Realizacja kroków: Buid, Test, Deploy, Publish
#### Build

W tym kroku utworzony zostaje obraz `builder`, bazując na obrazie `node`. Najpierw klonowane jest repozytorium zawierające wybrany przeze mnie projekt nodejs.org, a następnie ma miejsce przełączenie na odpowiednią gałąź. Obraz `builder` tworzony jest dzięki plikowi `dockerfile1.dockerfile` (który znajduje się w sklonowanym repozytorium). Następnie pobierane są dependencje i tworzone są zbuildowane pliki, niezbędne do `npm run build`.

`dockerfile1`, dzięki któremu odbywa się `Build`:

![screen10](./screen10.png)

Odpowiedni fragment `Jenkinsfile`:
![screen10a](./screen10a.png)

#### Test

W tym kroku utworzony zostaje z kolei obraz `tester`, bazując tym razem na obrazie `builder`, stworzonym we wcześniejszym kroku. Jego zadaniem jest przeprowadzanie testów, które sprawdzają poprawność działania programu.

`dockerfile2`, dzięki któremu odbywa się krok `Test`:

![screen11](./screen11.png)

Odpowiedni fragment `Jenkinsfile`:
![screen11a](./screen11a.png)

#### Deploy

W tym kroku uruchomiony zostaje obraz `builder`, a także podłączony zostaje wolumin, na który kopiowane są foldery `en` oraz `static` (pochodzące z folderu `build`), zawierające potrzebne pliki. W kroku Deploy pliki z `buildera` zostają wyciągnięte (używam woluminu). Ścieżka woluminu prowadzi do `workspace`, który zawiera folder pipelinu i wcześniej sklonowane repozytorium. Tworzony jest obraz `deploy`, bazujący na serwerze `nginx`. Na podstawie tego obrazu powstaje kontener hostujący zbuildowane pliki. Aby działał on poprawnie, kopiowany jest folder `build` do woluminu, a następnie zawartość folderów `en` oraz `static` do `/usr/share/nginx/html` . Na koniec przekierowywane są porty, w celu możliwości wejścia przez `localhost` na hostowaną stronę. Uwzględnione zostało przeze mnie to, aby pipeline nie zawiesił się, czekając w nieskończoność na zakończenie pracy kontenera, więc wybrałam opcję uruchomienia i jego zakończenia.

`dockerfile3`, dzięki któremu odbywa się krok `Deploy`:

![screen12](./screen12.png)

Odpowiedni fragment `Jenkinsfile`:
![screen12a](./screen12a.png)

#### Publish

W tym kroku, jeśli `build`, `test` i `deploy` się powiodą, ma miejsce publikacja programu. Wybrany przeze mnie projekt nie wymaga instalatora, dlatego, że zbuildowane pliki są od razu gotowe do wrzucenia i hostowania w kontenerze. W trakcie realizacji tego kroku napotkałam problemy z publikacją, w związku z czym `build` został spakowany do pliku `TAR.XZ` (artefakt ma postać archwium, dlatego że w takiej postaci jest łatwiej przenośny). W pipelinie określiłam parametry, dzięki którym mogłabym nadać nazwę ostatniej wersji archiwum.

![screen13](./screen13.png)
![screen14](./screen14.png)

Niestety tutaj także napotkałam problemy z ustawieniem prawidłowej nazwy, więc ostatecznie jest ono zapisane pod nazwą `archive.tar.xz`.

`dockerfile4`, dzięki któremu odbywa się krok `Publish`:

![screen15](./screen15.png)

Odpowiedni fragment `Jenkinsfile`:
![screen15a](./screen15a.png)

Zawartość całego `Jenkinsfile`:

![screen16](./screen16.png)
![screen16a](./screen16a.png)

Za pomocą `sudo docker exec -it bash` weszłam do kontenera Jenkinsa i sprawdziłam czy znajduje się w nim nowo powstałe archiwum.

![screen17](./screen17.png)

- **Logi z wykonywania się pipelinu**

![screen18](./screen18.png)

- Build
![screen19](./screen19.png)
- Test
![screen20](./screen20.png)
- Deploy
![screen21](./screen21.png)

Poprzez problemy z kontenerem przeznaczonym do deployu, zmieniłam fragment pipelinu odpowiedzialny za deploy. Okazało się, że po przekopiowaniu całego folderu z `buildem`
`nginx` nie hostuje poprawnie plików, dlatego dla poprawnego wyświetlania strony nodejs.org skopiowałam pliki z folderów `en` i `static`. Zmodyfikowałam `dockerfile3.dockerfile`, dlatego wstawiam fragment logów deploya, które uległy zmianie.

![screen24](./screen24.png)

- Publish
![screen22](./screen22.png)

![screen23](./screen23.png)

W celu sprawdzenia poprawności działania pipelinu stworzyłam nowy pipeline `pipeline1`, aby Jenkins mógł na nowo przeprowadzić cały proces pipelinu. Poprzednio przeprowadzonym przeze mnie pipelinem był `pipeline`, którego przebieg jest przedstawiony na poniższych screenach. Widać, że w jego trakcie występowały liczne trudności, błędy, głównie wynikające z błędnej składni, błędnych ścieżek itp.

![screen25](./screen25.png)
![screen25a](./screen25a.png)
![screen25b](./screen25b.png)
![screen25c](./screen25c.png)
![screen26](./screen26.png)
![screen27](./screen27.png)
![screen28](./screen28.png)


