
## Sprawozdanie 3

## Docker files, kontener jako definicja etapu

### Wykonane zadania

Wybranym repozytorium był framework [Svelte](https://github.com/sveltejs/svelte).

![git clone](./screenshots/git_clone.png) <br />
![node&npm versions](./screenshots/versions.png) <br />
![npm install](./screenshots/npm_install.png) <br />


Po zainstalowaniu wszystkich zależności, przeprowadzono *build* za pomocą polecenia **npm run build**, a testy jednostkowe stosując **npm run test:unit**.
 - Build
   ```
   npm run build
   ```
    ![npm run build](./screenshots/npm_run_build.png)

 - Testy
   ```
   npm run test:unit
   ```
   ![npm run test:unit](./screenshots/npm_run_testunit.png)


Następnie przystąpiono do konteneryzacji w Dockerze. Za obraz bazowy wybrano **Node** w najnowszej wersji. 

  ![docker pull node](./screenshots/docker_node.png)

Poniższym poleceniem doinstalowano wymagane do działania zależności. Zastosowano **npm ci** zamiast **npm i**, ponieważ zostało ono stworzone do uruchamiania w zautomatyzowanych środowiskach ([Link](https://docs.npmjs.com/cli/v8/commands/npm-ci)). 
```
npm ci
```
![npm ci](./screenshots/docker_npm_ci.png)

Tak jak wcześniej, sklonowano repozytorium i przetestowano działanie poprzez uruchomienie *build* i *testów*.

![npm run test:unit](./screenshots/docker-npm_testunit.png) <br />
![docker run](./screenshots/docker_run.png) <br />

Kolejnym etapem było utworzenie dwóch plików Dockerfile automatyzujących powyższe kroki. Stworzono w tym celu plik **Dockerfile.build**, którego zadaniem było przeprowadzenie wszystkich kroków aż do builda oraz **Dockerfile.test** bazujący na pierwszym kontenerze i uruchamiający testy.
```dockerfile
# Dockerfile.build
FROM node:latest

WORKDIR /app
COPY rollup.config.js ./
COPY package*.json ./

RUN npm ci

COPY . ./

RUN npm run build
```

```dockerfile
# Dockerfile.test
FROM docker-build

WORKDIR /app

CMD ["npm", "run", "test:unit"]
``` 

 - Budowa<br />
	![dockerfile build](./screenshots/dockerfile_build.png)<br />
	![dockerfile test](./screenshots/dockerfile_test.png)<br />

- Uruchomienie<br />
	![docker run build](./screenshots/docker_run_build.png)<br />
	![docker run build](./screenshots/docker_run_test.png)<br />
	
	![docker run build](./screenshots/docker_ps.png)<br />
