# Sprawozdanie 3
### 27.03.2022
---
## **Wybór oprogramowania na zajęcia**

Wybranym przeze mnie programem jest moja autorska implementacja prostego eksploratora bloków w sieci bitcoin. Projekt został napisany za pomocą React'a, dlatego będę pracował z obrazem node'a.

Na początku sklonowałem repozytorium na maszynę z windowsem.

![img1](./s1.png)

Doinstalowałem wymagane zależności

![img2](./s2.png)

Zbudowałem projekt

![img3](./s3.png)

Puściłem testy

![img4](./s4.png)


## **Przeprowadzenie buildu w kontenerze**

Pobrałem obraz node

![img5](./s5png)

Powtarzam czynności z punktu pierwszego ale tym razem w kontenerze

Wchodzę do kontenera i klonuje repo

![img6](./s6png)

Pobieram pakiety

![img7](./s7png)

Robie builda

![img8](./s8png)

Sprawdzam testy

![img9](./s9png)

## **Dockerfile**

Aby zautomatyzować powyższe kroki tworzę dwa pliki dockerfile. Jeden z nich tworzy obraz aż do builda. Drugi na podstawię utworzonego wcześniej obrazu odpala dodatkowo testy.

Pliki dockerfile:

![img10](./s10png)

Odpalam pierwszego dockerfila

![img11](./s11png)

![img12](./s12png)

Odpalam drugiego dockerfila

![img13](./s13png)

Tworze dodatkowy image do którego dodałem `npm run start` aby kontener nie zakańczał od razu swojej pracy. Dzięki tek komendzie hostuje on storne na localhost.

Po wpisaniu `docker ps -a` widzimy go jako aktywny kontener

![img14](./s14png)