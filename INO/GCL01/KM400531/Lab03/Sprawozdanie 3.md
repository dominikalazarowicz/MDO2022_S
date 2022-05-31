# Krzysztof Maurek #
## Inżynieria Obliczeniowa, gr. 1 ##
### Sprawozdanie 3 ###
Na początku zajęć skopiowałem repozytorium. Działać będę na repozytorium używanym na zajęciach czyli na irssi  
![](git_clone.png)  
W kolejnym kroku za pomocą środowiska meson buduje lokalnie program  
![](meson1.png)  
![](meson2.png)  
![](meson3.png)  
Dalej przechodzę do folderu Build i odpalam testy. Przechodzą one pomyślnie  
![](meson_test.png)  
Następnie odpalam konterem z systemem Fedora (wybrałem ten system zamiast ubuntu z powodu małych problemów z ubuntu)  
![](docker_run.png)  
W kolejnym kroku zainstalowałem git'a na dockerze  
![](docker_git.png)  
Skopiowałem repozytorium do kontenera  
![](docker_clone.png)  
Niestety pojawił się problem z brakującymi pakietami umożliwiającymi zbudowanie programu dlatego musiałem doinstalować je następującymi komendami  
![](pakiety.png)  
Udało mi się zbudować program na kontenerze  
![](build_docker.png)  
Przeprowadziłem testy  
![](docker_test.png)  
Następnie tworzę pliki dockerfile które będą służyć do zbudowania programu oraz do odpalenia testów. Za pomocą komendy *FROM* wybieram obraz który zostanie uruchomiony. Za pomocą komendy *RUN* uruchamiam kolejne polecenia (instalacji konkretnych pakietow, pobrania repozytorium czy budowania programu). Za pomocą komendy *WORKDIR* ustawiana jest ścieżka robocza.  
![](file1.png)  
Drugi plik wygląda następująco. Wskazuje on na obraz stworzony wcześniej, ustala ścieżkę roboczą i uruchamia testy  
![](file2.png)  
Uruchamiam pierwszy plik następującą komendą -f wskazuje który plik należy uruchomić, natomiast -t pozwala nazwać obraz  
![](firstDocker.png)  
![](firstdocker2.png)  
Następnie uruchamiam drugi plik z testami  
![](test1.png)  
![](test2.png)  
Jak widać testy przeszły bez problemu. Mogę zobaczyć ze są powstałe obrazy.  
![](images.png)  
Na koniec odpalam kontener z utworzonego obrazu. Jak widać uruchomił się zbudowany program  
![](Irssi.png)  


