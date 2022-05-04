Sprawozdanie DevOps - Lab03
Szymon Guziak - ITE/GCL03

## 1) Wybór oprogramowania
Szukając odpowiedniego repozytorium natknąłem się na nodejs.org
Wybrałem je, ponieważ już kiedyś o nim słyszałem (przy szukaniu info o Node JS)

## 2) Wykonanie build i test na maszynie wirtualnej
Na początku przeprowadziłem operacje na Linuxie.
Wykonałem clonowanie git-a, następnie instalowałem npm,
 by na koniec móc wykonać build oraz test:
![poczatek](Zdjecia/0_1.png)
![poczatek v2](Zdjecia/0_2.png)
![poczatek v3](Zdjecia/0_3.png)
![poczatek v4](Zdjecia/0_4.png)

## 3) Wykonanie build i test na dockerze
Wpierw, by móc działać na git-cie wykonałem komende 'sudo docker pull ubuntu' i przygotowałem dockera - wykonałem clone i npm install
![docker - ubuntu](Zdjecia/1_1.png)
![docker - ubuntu v2](Zdjecia/1_2.png)

Następnie, gdy już miałem git-a, zainstalowałem sobie npm, zbudowałem, wykonałem i przeprowadziłem testy dla tego repozytorium:
![build](Zdjecia/2_1.png)
![build v2](Zdjecia/2_2.png)
![start](Zdjecia/3.png)
![test](Zdjecia/4.png)

## 4) Stwórz dwa pliki dockerfile - build oraz test
Utworzono Dockerfile dla obrazu budującego oraz testującego
![dockerfile - build](Zdjecia/5.png)
![dockerfile - test](Zdjecia/6.png)
