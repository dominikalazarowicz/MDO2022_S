# Kacper Sochacki 401155

## Pipieline
<br/>

### Pliki dockerfile uzyte w pipeline
![Docker_build](img/dockerbuild.png)

![Docker_test](img/dockertest.png)

![Docker_publish](img/dockerpub.png)
<br/>
### Skonfigurowany pipeline na Jenkins:

![Jenkins1](img/jenkins1.png)

![Jenkins1](img/jenkins2.png)


### Build

### W kroku build tworze kontener na bazie ubuntu przy uzyciu dockerbuild. Klonuje repozytorium, pobieram dependencje oraz uruchamiam makefile.

![Build](img/build.png)

<br/>

### Test

### Tworze kontener na bazie kontenera budujacego oraz uruchamiam makefile test.

![Test](img/test.png)

<br/>

### Deploy

### Wyslanie obrazu do dockerhuba: ksochacki0

![Deploy](img/deploy.png)

### Publish

### Tworze kontener na bazie kontenera budujacego. Builduje tym razem przy uzyciu innej opcji z narzedzia poetry oraz pakuje katalog do archive.tar.xz. Nastepnie dopisuje wersje i archiwizuje plik, aby moc go pobrac z Jenkinsa.

![Publish](img/publish.png)

### Pipeline

### W Jenkinsie widac utworzony plik tar z wersja wybrana przy jego uruchomieniu

![Pipieline](img/pipeline1.png)
![Pipieline](img/pipeline2.png)

