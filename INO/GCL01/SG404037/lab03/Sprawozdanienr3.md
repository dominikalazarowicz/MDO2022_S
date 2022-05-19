# Sprawozdanie nr 3
## DevOps – Sandra Góra – Nr albumu 404037
	
Przebieg laboratorium nr3:

1.Wybrałam repozytorium nodejs/nodejs.org  i sklonowałam je :
 
 ![zdj1](zdj1.png)
 
 ![zdj2](zdj2.png)
 
2. Najpierw użyłam komendy npm install , następnie npm  run build oraz run test :
 ![zdj3](zdj3.png)

![zdj4](zdj4.png)


 
3.  Następnie przeszłam do putty i  tam wykonałam następujące komendy :

```
$sudo docker pull node
```
![zdj4(2)](Zdj4(2).png)

```
$ sudo docker images
 ```
![zdj5](zdj5.png)
 ```
$ sudo docker run –interactive –tty node sh
 ```
 ![zdj6](zdj6.png)
 ```
$ npm install
```
![zdj7](zdj7.png)
 ```
$ npm run build
```
![zdj8](zdj8.png)

 ```
$ npm run test
``` 
 ![zdj9](zdj9.png)
 
 ![zdj10](zdj10.png)
 
4. Utworzyłam plik Docker, tutaj zawartość pliku :

 ![zdj11](zdj11.png)
5. Sprawdziłam poprawność działania tego pliku :

  ![zdj12](zdj12.png)
  
  ![zdj13](zdj13.png)
 
6. Ponownie założyłam  plik Docker1, w którym wybrany jest aktualny obraz i uruchamiane są testy jednostkowe :
7
   ![zdj14](zdj14.png)
7. Sprawdziłam czy poprawnie działa :
 
  ![zdj15](zdj15.png)
 
   ![zdj16](zdj16.png)

  ![zdj17](zdj17.png)
  
8. Wykazałam, że dany kontener hostuje strone na porcie 8080 :
 
  ![zdj18](zdj18.png)

9. Ostatecznie sprawdziłam historie :

  ![zdj19](zdj19.png)