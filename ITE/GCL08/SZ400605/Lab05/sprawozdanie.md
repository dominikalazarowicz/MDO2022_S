# Szymon Piotr Zych 400605 Sprawozdanie_projekt

## Konfiguracja kontenera Jenkins i DIND

Po konfiguracji w ramach poprzednich zajęć zgodnie z instruckją dostawcy oprogramowania, naszym zadaniem było po prostu uruchomienie kontenerów wykorzystując gotowe komendy.

Uruchomienie DINDA

```
docker run \
  --name jenkins-docker \
  --rm \
  --detach \
  --privileged \
  --network jenkins \
  --network-alias docker \
  --env DOCKER_TLS_CERTDIR=/certs \
  --volume jenkins-docker-certs:/certs/client \
  --volume jenkins-data:/var/jenkins_home \
  --publish 2376:2376 \
  docker:dind \
  --storage-driver overlay2
```

Uruchomienie Jenkinsa

```
docker run \
  --name jenkins-blueocean \
  --restart=on-failure \
  --detach \
  --network jenkins \
  --env DOCKER_HOST=tcp://docker:2376 \
  --env DOCKER_CERT_PATH=/certs/client \
  --env DOCKER_TLS_VERIFY=1 \
  --publish 8080:8080 \
  --publish 50000:50000 \
  --volume jenkins-data:/var/jenkins_home \
  --volume jenkins-docker-certs:/certs/client:ro \
  myjenkins-blueocean:2.332.3-1
```

![Docker_ps](./docker_ps.png)

## Fork repo

Dla własnej wygody i nie chcąc zaśmiecać niepotrzebnymi commitami własnego brancha na przedmiotowym repozytorium postanowiłem skopiować repozytorium aplikacji na której pracowałem korzystając z operacji fork.

![Fork_repo](./fork_repo.png)

[Link do forkowanego repozytorium](https://github.com/LuxikHS/deltachat-desktop)

Pliki dockerfile oraz Jenkinsfile z których korzystałem podczas wykonywanego zadania zostały umieszczone zarówno na forkowanym repo(tam przeprowadzałem zmiany na plikach dockerfile i pliku Jenkinsfile) oraz w repozytorium przedmiotowym(tutaj umieściłem tylko finalną wersję plików)

## Zdefiniowany wewnątrz Jenkinsa obiekt projektowy „pipeline”

Należy zmienić defition z pipeline script na pipeline script from scm, ponieważ chcemy uzyskać pipeline z Source Control Managment(SCM), którym będzie nasze lokalnie sklonowane repozytorium.
Jako SCM wybieramy Git i podajemy link do naszego repozytorium.

![Pipe_repo](./pipeline_repo.png)

Jak wcześniej wspominałem korzystam z forkowanego repozytorium i tam dodawałem na branch master dockerfile i Jenkinsfile dlatego jako Branch Specifier podany jest master, gdybym krok wyżej podał link do repozytorium przemiotowego Branch Specifier musiałby być ustawiony na branch na którym pracuje na przedmiotowym repozytorium tj. SZ600605.
Podobnie sprawa ma się z polem Script Path tutaj podana jest tylko nazwa Jenkinsfile, ponieważ Jenkinsfile znajduje się bezpośrednio na masterze, w przypadku przedmiotowego repozytorium ścieżka wyglądałaby w następujący sposób:
ITE/GCL08/SZ400605/Lab05/Jenkinsfile

![Pipe_branch](./pipeline_branch.png)

## Build

Dockerfile odpowiadający za build

![dockerfileB](./build_dockerfile.png)

Fragment Jenkinfile z krokiem build

![jenkinsfile_build](./stage_build.png)

Logi z pipeline'a

![pipe_build_logs](./pipe_build_logs.png)

## Test

Dockerfile odpowiadający za testy

![dockerfileB](./test_dockerfile.png)

Fragment Jenkinfile z krokiem test

![jenkinsfile_build](./stage_test.png)

Logi z pipeline'a

![pipe_build_logs](./pipe_test_logs.png)

## Deploy

Z racji tego, że wybrana przeze mnie aplikacja jest aplikacją desktopową w ramach deploya postanowiłem pushować obraz na repozytorium DockerHubowe. Aby to osiągnąć musieliśmy w Jenkinsfile'u przekazać zmienną środowiskową, w której są nasze login i hasło do konta na dockerhubie.

Ustawienie w Jenkinsie referencji do loginu i hasła do konta na DockerHub

![Creds](./dockerhub_cred.png)

Fragment Jenknsfile, w którym przypisujemy referencje.

![Jenkins_env](./jenkinsfile_ennvironment.png)

Fragment Jenkinfile z krokiem deploy

![jenkinsfile_build](./stage_deploy.png)

Logi z pipeline'a

![pipe_deploy_logs](./pipe_deploy_logs.png)

Potwierdzenie powodzenia pushowania obrazu na DockerHuba

![dockerhub_image](./dockerHub.png)

## Publish

W ramach kroku publish pakujemy nasz build do archiwum, a następnie przekazujemy je jako artefakt.

Dockerfile odpowiadający za publish

![dockerfileP](./publish_dockerfile.png)

Fragment Jenknsfile, z korkiem publish

![jenkinsfile_publish](./stage_publish.png)

Uzyskany artefakt:

![artifact](./artifact.png)

## Stage View

Potwierdzenie poprawności wykonania się wszytskich kroków

![stageView](./stage_view.png)
