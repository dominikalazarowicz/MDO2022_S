# Sprawozdanie Pipeline
# Kamil Pazgan Inżynieria Obliczeniowa GCL02

## Realizacja Projektu

### Wstęp
Na poprzednich laboratoriach tworzyliśmy kontener *Jenkins* oraz *DIND*, które pozwalają nam zrealizować temat bierzący, czyli przygotowanie *pipeline*.

*DinD*, odpowiada za uruchamianie Dockera w kontenerze Dockera. Oznacza to, że instancja Dockera w kontenerze byłaby w stanie budować kontenery, a także je uruchamiać.

*Jenkins* - ```myjenkins-blueocean:2.332.1-1``` - jest kontenerem bazowym i zapewnia możliwość automatyzacji przeprowania operacji na wybranym repo.

Instalowanie tych kontenerów zaprezentowane poprzednio. Teraz konieczne jest uruchomienie obu kontenerów.

DinD:\
![](./screenshots/1_dind.PNG)

Jenkins:\
![](./screenshots/2_jenkins.PNG)

Utorzenie kontenerów można potwierdzić wypisując informacje ```docker ps```.\
![](./screenshots/3_docker_ps.PNG)

### Definiowanie pipeline dla Jenkins

1. Pracuje jak poprzednio na https://github.com/nodejs/nodejs.org
Wykonuje forka i kopiuje repozytorium do siebie, by móc swobodnie modyfikować pliki. Następnie klonuje je do siebie na Windows 10, żeby dodać istotne pliki i pracować z repo.\
![](./screenshots/4_fork.PNG)

2. Przygotowane dockerfile, umieściłem w katalogu głownym repozytorium.

- ```docker1.dockerfile``` - odpowiedzialny za build - tworzy obraz ```builder```, który ma za zadanie pobrać wymagane dependencje za pomocą ```npm install``` oraz stworzenie plików poprzez ```npm run build```.\
![](./screenshots/5_docker1.PNG)

- ```docker2.dockerfile``` - odpowiedzialny za testy - przeprowadza testy sprawdzające poprawność działania kodu.\
![](./screenshots/6_docker2.PNG)

- ```docker3.dockerfile``` - odpowiedzialny za deploy - z foldera build kopiowane są właściwe pliki do flderu z ```nginx```. Biorę pod uwagę tylko język angielski chcąc jak najbardziej oszczędzać na pamięci. Kopiuje też pliki odpowiedzialne za styl, html i css.\
![](./screenshots/7_docker3.PNG)

- ```docker4.dockerfile``` - odpowiedzialny za publish - korzystając z kontenera builder tworzę archiwum, które jest artefaktem.\
![](./screenshots/8_docker4.PNG)

3. Jenkinsfile (```jenkins```) wrzuciłem do folderu ```jenkins```, który stworzyłem wcześniej w katalogu głownym repozytorium.

Dzięki niemu mamy możliwość stowrzenia kilku projektów, wykorzystując tylko jedną instancję Jenkinsa. Dzieje się tak ponieważ, możemy użyć rozproszonej kompilacji odwołując się do węzłów agentów.\
![](./screenshots/9_pipeline.PNG)

- ```stage("build")``` - utworzenie aplikacji w kontenerze *(builder)*. W przypadku mojego repozytorium posiada on dependencję,którą jest *npm*.

- ```stage('test')``` - uruchommienie testów, będących częścią projektu. Dzieje się to za pomocą stworzonego obrazu tester.

- ```stage('deploy')``` - utworzenie obrazu deploy hostującego pliki. serwer hostujący - ```nginx``` - z przekierowaniem portu. Następnie uruchominie kontenera oraz zakończenie jego pracy. 

- ```stage('publish')``` - ostatni etap, czyli wydanie nowej wersji oprogramowania. Zbudowanie artefaktu i podpięcie do voluminu.

### Konfiguracja Jenkinsa

1. Najpierw tworzymy nowy projekt.\
![](./screenshots/10_jen.PNG)

2. Wybieramy pipeline i wprowadzamy nazwe.\
![](./screenshots/11_jen.PNG)

3. Definicja - *Pipeline script from SCM*, kontrola plików - Git, link do repozytorium, odpowiedni branch.\
![](./screenshots/12_jen.PNG)

4. Ścieżka do jenkinsfile.\
![](./screenshots/13_jen.PNG)

### Uruchominie Jenkinsa

1. Sklonowanie.\
![](./screenshots/14_run.PNG)

2. Build.\
![](./screenshots/15_run.PNG)
![](./screenshots/16_run.PNG)
![](./screenshots/17_run.PNG)
![](./screenshots/18_run.PNG)

3. Test.\
![](./screenshots/19_test.PNG)
![](./screenshots/20_test.PNG)
![](./screenshots/21_test.PNG)
![](./screenshots/22_test.PNG)
![](./screenshots/23_test.PNG)
![](./screenshots/24_test.PNG)

4. Deploy.\
![](./screenshots/25_dep.PNG)
![](./screenshots/26_dep.PNG)

5. Publish.\
![](./screenshots/27_pub.PNG)

6. Stage View.\
![](./screenshots/28_log.PNG)

Kiepskie czasy to wynik kiepskiego łącza w moim pokoju na mieszkaniu.

### Wnioski

Tematyka nie jest taka prosta i dla zwykłego programisty czy informatyka jest to problematyczne, chociaż po zagłębieniu się w tematykę możliwe. Pipeline jest bardzo użyteczny i można dzięki niemu ułatwić sobie znacznie pracę.

