# Sprawozdanie 3 - dockerfile - 400178

Projektem, którego używałem w ramach sprawozdania jest nodejs.org. Wybrałem go ponieważ posiada wymaganą licenjcę oraz
jest relatywnie łatwy w obsłudze. Mam na myśli, że korzystając z podstawowego obrazu "Node" nie musimy tak naprawdę
dociągać żadnych dependencji i mogę skupić się na najważniejszym aspekcie zadania - czyli stworzenie dockerfile.

1. Najpierw pobrałem repozytorium i zacząłem pracę poza kontenerem. zacząłem od pobrania repozytorium, zainstalowaniadependencji (package.json), zrobiłem build oraz uruchomiłem testy.
   # ![Alt text](git-clone-local.PNG?raw=true)
   # ![Alt text](npp-install-local.PNG?raw=true)
   # ![Alt text](npm-run-build.PNG?raw=true)
   # ![Alt text](npm-test-local.PNG?raw=true)
2. Pobrałem obraz Node z dockerhuba:
   ![Alt text](node-image.PNG?raw=true)
   ![Alt text](node-docker-desktop.PNG?raw=true)
3. Powtórzyłem czynności z kroku nr. 1, ale tym razem w kontenerze
   # ![Alt text](kontener-clone.PNG?raw=true)
   # ![Alt text](npm-i.PNG?raw=true)
   # ![Alt text](run-build.PNG?raw=true)
   # ![Alt text](npm-test-v1.PNG?raw=true)
   # ![Alt text](npm-test-confirm.PNG?raw=true)
4. Po wykonaniu powyższych kroków w kontenerze, pora na zautomatyzaowanie ich. W tym celu stworzyłem dwa dockerfile,jeden jest odpowiedzialny za zbudowanie projektu, a drugi za odpalenie w nim testów - czyli mamy do czynienia zzależnością.
5. zawartość dockerfile
   # ![Alt text](dockerbuild.PNG?raw=true)
   # ![Alt text](dockertest.PNG?raw=true)
   pierwszy dockerfile definiuje pobranie repozytorium, przejscie do odpowiedniego folderu i wykonanie npm install oraz
   npm run build. Drugi natomiast bazuje na poprzednim i uruchamia testy.
6. Skoro mam już napisane dockerfile, czas sprawdzić czy naprawdę działają. W tym celu uruchamiam je za pomocą głównej komendy docker build wraz z odpowiednimi flagami.
   # ![Alt text](docker-build-build.PNG?raw=true)
   # ![Alt text](docker-build-build2.PNG?raw=true)
7. Odpalam teraz  dockerfile odpowiedzialny za testy:
   # ![Alt text](docker-build-tests.PNG?raw=true)
   # ![Alt text](docker-build-tests2.PNG?raw=true)
8. Widzimy, że dockerfile wykonują poprawnie swoje działanie. Spróbujmy teraz to ostatecznie potwierdzić poprzez odpalenie aplikacji, tak aby na porcie 8080 wyświetlał się UI node.js.
   # ![Alt text](docker-run-build.PNG?raw=true)
9. Kontener teraz działa. Wchodzę do jego środka za pomocą aplikacji Docker Desktop for Windows (mógłbym także za pomocą konsoli, ale wolę korzystać z aplikacji) i wpisuje npm start.
   # ![Alt text](npm-start.PNG?raw=true)
10. Na porcie 8080 jest dostępny UI node.js:
![Alt text](nodejs-screen.PNG?raw=true)
