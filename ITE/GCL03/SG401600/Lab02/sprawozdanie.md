Sprawozdanie DevOps - Lab02
Szymon Guziak - ITE-GCL03

## 1) Przygotuj git hook
Odnaleziono katalog hooks, w którym utworzono prostego commita sprawdzającego:
![hooks](Zdjecia/1.png)
![utworzenie commita](Zdjecia/2.png)

Następnie przetestowałem stworzonego hooka:
![teścik](Zdjecia/3.png)

## 2) Środowisko Dockerowe
Przy pomocy komendy 'sudo apt-get install docker.io' zainstalowano środowisko dockerowe:
![instalacja dockera](Zdjecia/4_1.png)
![instalacja dockera v2](Zdjecia/4_2.png)

## 3) Przetestowanie Dockera - działanie środowiska
Wykonałem szybki test, czy środowisko dobrze się zainstalowało.
W tym celu użyłem najbardziej popularnego obrazu 'hello-world'
Wykonałem to przy pomocy komendy 'sudo docker pull hello-world'
Następnie wykonałem komendę 'sudo docker images' która sprawdza czy obraz się zainstalował i uruchomiłem go :
![test dockera](Zdjecia/5_1.png)
![test dockera v2](Zdjecia/5_2.png)


Kolejnym etapem było praktyczne wykorzystanie docekra -
 - pobranie obrazu dystrybucji linuksowej za pomocą komendy 'sudo docker pull docker' //taka incepcja :D
Następnie uruchomiłem obraz i sprawdziłem wersję systemu
![praktyczne wykorzystanie](Zdjecia/6_1.png)
![praktyczne wykorzystanie v2](Zdjecia/6_2.png)

## 4) Założenie konta na Docker Hub

Ostatnim już elementem laboratoriów numer 2 było założenie konta na Docker Hub:
![Docker Hub](Zdjecia/7.png)
