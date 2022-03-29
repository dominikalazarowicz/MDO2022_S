## Szymon Mateusz Zych 402734 Lab01

### Kroki zadania

0. Maszyna na której wszystko jest wykonywane (ThinkPad x61 better).
![Screenshot](1.png)
1. Znalezienie projektu do wykonania laboratorium, środowisko Makefile w moim przypadku to npm.

Link: https://github.com/microsoft/TypeScript.git

![Screenshot](2.png)

2. Instalacja npm.
![Screenshot](3.png)

3. Zbudowanie projektu za pomoca npm. 
![Screenshot](4.png)

4. Testowanie

### gulp tests - zbudowanie infrastruktury testów
![Screenshot](5.png)
### gulp runtests-parallel - uruchumoenie testów
![Screenshot](test_1.png)
![Screenshot](test_2.png)

5. Pobranie obrazu node.
![Screenshot](node.png)

6. Uruchomienie kontenera z obrazem node, podłączenie sie do niego za pomocą TTY, oraz sprawdzenie wymaganych aplikacji do zbudowania.

###Sprawdzenie czy git i npm sa zainstalowane, skopiowanie projektu oraz zbudowanie.

![Screenshot](instalacja.png)

7. Uruchomienie testów
![Screenshot](testy.png)

8. Tworzenie Dockerfile az do builda
![Screenshot](build_file.png)
![Screenshot](docker_build_start.png)

8. Wykonanie testów
![Screenshot](test_file.png)
![Screenshot](test_dockerfile_1.png)
![Screenshot](test_file_powodzenie.png)
![Screenshot](succe.png)

9. Poprawność
![Screenshot](poprawnosc.png)

10. Co pracuje w kontenerze utworoznym przez nas?
W środowisku odizolowanym w kontenerze pracuje nasz program. Jest to sposób na odizolowanie od systemu, obraz jest podstawą do utworzenia kontenera.


