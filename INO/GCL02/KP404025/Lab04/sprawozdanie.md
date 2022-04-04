# Sprawozdanie 4
# Kamil Pazgan Inżynieria Obliczeniowa GCL02

## Zachowywanie stanu
1. Prace rozpoczynam od stworzenia woluminów. ```volumein``` - wolumin wejsciowy oraz ```volumeout``` - wolumin wyjsciowy. Tworze je za pomoca ```docker volume create```\
![](./screenshots/1.PNG)\
Następnie wyświetlam szczegóły ```docker volume inspect```, w kolejnych krokach skorzystam z wyswietlonej zawartosci.\
![](./screenshots/2.PNG)\
![](./screenshots/3.PNG)\
Pobieram ```node:slim```, który dzieki temu, że jest duzo mniejszy nie zawiera gita.\
![](./screenshots/4.PNG)\
2. Uruchamiam kontener montujac woluminy za pomocą ```docker run```. ```-v``` - montowanie przełącznika, ```-it``` - interaktywny terminal, ```--name``` - nadana nazwa, ```bash``` - terminal bash.\
![](./screenshots/5.PNG)\
Zamontowane woluminy:\
![](./screenshots/6.PNG)\
3. Kolejnym krokiem było sklonowanie repozytorium na wejściowy wolumin ```volumein```. Wykorzystując ścieżke z inspecta klonuje repozytorium w odpowiednim miejscu.\
![](./screenshots/7.PNG)\
Zawartość:\
![](./screenshots/8.PNG)\
4. Następnie skopiowałem katalog na kontener, zainstalowałem dependencje oraz uruchomilem build, ```npm run build```.\
![](./screenshots/9.PNG)\
![](./screenshots/10.PNG)\
![](./screenshots/11.PNG)\
![](./screenshots/12.PNG)\
5. Ostatnim krokiem było zapisanie plików na woluminie wyjściowym:\
![](./screenshots/13.PNG)\
![](./screenshots/14.PNG)\

## Eksponowanie portu
1. W kolejnej części laboratoriów uruchomiłem wewnątrz kontenera serwer iperf (iperf3). W pierwszej kolejnosci pobrałem obraz: ```sudo docker pull clearlinux/ipref```\
![](./screenshots/15.PNG)\
Następnie uruchomiłem serwer za pomocą ```docker run```. ```-p``` - publikacja portu, ```-s``` - emitowanie działania serwera, ```-rm``` - usuniecie po zamknieciu.\
![](./screenshots/16.PNG)\
2. Przeszedłem do sprawdzenia czy serwer nasłuchuje:\
![](./screenshots/17.PNG)\
Następnie połaczyłem sie z drugiego kontenera. ```--time``` - czas połączenia, ustawiam na 15.\
![](./screenshots/18.PNG)\
3. Pozostałe połączenia:\
Połączenie z kontenerem z hosta (VM Ubuntu):\
![](./screenshots/19.PNG)\
Połączenie z kontenerem spoza hosta (Windows 10 na PC):\
![](./screenshots/20.PNG)\
4. Przepustowość komunikacji:\
- *Kontener --- Kontener*\
![](./screenshots/21.PNG)\
- *Host --- Kontener*\
![](./screenshots/22.PNG)\
- *Host zewnętrzny --- Kontener*\
![](./screenshots/23.PNG)\
- Wykres porównawczy:\
![](./screenshots/24.PNG)\
Najlepszą przepustowość wykazuje połączenie kontener z hostem, nie wiele gorsze jest połączenie kontener - kontener. Host zewnętrzny jest kilkukrotnie gorszy w połączeniu z kontenerem.

## Instancja Jenkins
1. Po zapoznaniu się z dokumentacją zawartą w instrukcji, przeszedłem do instalacji.
- Instalacja sieci dockerowej:\
![](./screenshots/25.PNG)\
![](./screenshots/26.PNG)\
- Postępując zgodnie z instrukcją kontynuuje instalację:\
![](./screenshots/27.PNG)\
- Stworzyłem dockerfile i skopiowałem zawartość z instrukcji:\
![](./screenshots/dockerfile.PNG)\
- Następnie przeszedłem do budowania obrazu za pomocą ```suddo docker build```:\
![](./screenshots/28.PNG)\
![](./screenshots/29.PNG)\
- Korzystając z instrukcji uruchamiam obraz:\
![](./screenshots/30.PNG)\
- Potwierdzenie utworzenia konteneru:\
![](./screenshots/31.PNG)\
2. Jenkins
- Przez przegladarke wchodze na *localhost:8080*\
![](./screenshots/32.PNG)\
- Nastepnie z poziomu kontenera pobieram hasło:\
![](./screenshots/33.PNG)\
- Po zalogowaniu instaluje domyślne wtyczki\
![](./screenshots/34.PNG)\
- Przechodze do panelu logowania:\
![](./screenshots/35.PNG)\





