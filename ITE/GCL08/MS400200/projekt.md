# Sprawozdanie 


## Cel ćwiczenia
Przygotowanie Pipeline

## Przebieg
Stworzono kontenenery Jenkins-bluocean oraz DIND:
![1](1.png)

Niezbedne byly rowniez pliki Dockerfiles:

DockerBuild
```
FROM python:3.8.10

RUN apt update
RUN git clone https://github.com/michaElOs769/devops.git

WORKDIR "/basictracer-python"
RUN python3 -m venv /opt/env
RUN . /opt/env/bin/activate
RUN python3 -m venv make bootstrap
```

DockerTest
```
FROM basictracer_build:latest
RUN ls
RUN python3 -m venv make test
```
