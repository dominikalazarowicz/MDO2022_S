# SPRAWOZDANIE 3

* Wybrano repozytorium https://github.com/kentcdodds/testing-node-apps.git, jest to prosta aplikacja w Node.js zawierająca testy.
* Pobrano obraz node

```
sudo docker pull node
sudo docker images --all
```

![image-20220328190449154](image-20220328190449154.png)

* Kolejnym krokiem było uruchomienie kontenera, podłączenie się do niego oraz klonowanie repozytorium

```bash
sudo docker run --interactive --tty node sh
git clone https://github.com/kentcdodds/testing-node-apps.git
```

![image-20220328194348102](image-20220328194348102.png)

* W uruchomionym kontenerze zbudowano projekt oraz uruchomiono testy

```bash
npm install
npm run build
```

![image-20220328194711271](image-20220328194711271.png)

```
npm run test
```

![image-20220328194856338](image-20220328194856338.png)

* Utworzono dockerfila o nazwie "build.dockerfile" służącego do budowania projektu oraz przetestowano jego działanie

```dockerfile
FROM node:latest
RUN git clone https://github.com/kentcdodds/testing-node-apps.git
WORKDIR /testing-node-apps/
RUN npm install
RUN npm run build
```

```bash
sudo docker build . -f build.dockerfile -t node-build
```

![image-20220328195649143](image-20220328195649143.png)

* Utworzono dockerfila o nazwie "test.dockerfile" służącego do uruchomienia testów bazując na poprzednim obrazie 

```dockerfile
FROM node-build:latest
WORKDIR /testing-node-apps/
RUN npm run test:final
```

```bash
sudo docker build . -f test.dockerfile -t node-test
```

![image-20220328202253880](image-20220328202253880.png)



* W celu przetestowania działania kontenera utworzono dockerfile "run.dockerfile" oraz uruchomiono kontener

  ```dockerfile
  FROM node-build:latest
  CMD ["npm", "start"]
  ```

![image-20220328212204843](image-20220328212204843.png)

![image-20220328213927106](image-20220328213927106.png)

