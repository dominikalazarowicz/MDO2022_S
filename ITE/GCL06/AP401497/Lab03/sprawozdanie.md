# Lab 3 - Sprawozdanie
## Adrian Pabiniak

## 1. Wykonanie buildu i test wewnątrz wybranego konternera bazowego.

 ### Uruchomienie kontenera
  > docker run -it node:13 bash

  ![](./1.png)

 ### Klonowanie repozytorium
  > git clone https://github.com/dethcrypto/deth.git

  ![](./2.png)

 ### Wejście do sklonowanego projektu
  > cd deth

 ### Instalacja dependency
  > yarn
 
 ![](./3.png)
 
 ### Buildowanie aplikacji
  > yarn build
 
  ![](./4.png)
 
 ### Testowanie aplikacji
  > yarn test

  ![](./5.png)
 
## 2. Dockerfile
 
 ### Utworzenie dockerfile, który będzie buildował aplikację
  ```
  FROM node:13
  
  RUN git clone https://github.com/dethcrypto/deth.git
  WORKDIR ./deth
  RUN yarn
  RUN yarn build
  
  ```

 ### Zbudowanie obrazu

  ![](./6.png)

 ### Utworzenie dockerfile, który będzie testował aplikację
  ```
  FROM deth-builded

  RUN yarn test
  
  ```

 ### Zbudowanie obrazu

  ![](./7.png)

## 3. Wykazanie prawidłowości działania kontenera

 ### Uruchomienie kontenera w trybie interaktywnym

  ![](./8.png)

 ### Wykazanie istnienia aktywnego kontenera

  ![](./9.png)

 ### Uruchomienie testów w aktywnym kontenerze
 
  ![](./10.png)

 


