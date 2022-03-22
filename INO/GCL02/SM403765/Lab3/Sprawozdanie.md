# Wybór oprogramowania na zajęcia

Oprogramowanie które wybrałem to projekt aplikacji webowej (nowa wersja) projektu naukowego EmotoAGH.

Część webowa projektu zarządza rolami, uprawnieniami w dostępie, spełnia funkcję promocji motocykla oraz kluczowa przedstawienie telemetrii motocykla.

Kwestia licencji nie stanowi tu problemu, ponieważ jest główną odpowiedzialną osobą za projekt.

Projekt jest hostowany na serwerze i posiada testy jednostkowe fontend, backend oraz test E2E na playwright. platforma arm clouda oferowała więcej zasobów aczkolwiek czasem jest to problematyczne.

# Przeprowadzenie buildu w kontenerze

Przygotowanie obrazu - środowiska

Środowisko aplikacji wymaga dotneta 6, a przy budowaniu aplikacji ponadto NodeJs ze względu na React.

## Poniżej przedstawiam problemy przy tworzeniu środowiska:

### 1. Pobranie dystrybucji dockera z zainstalowanym SDK

```bash
ubuntu@szymonvm:~$ sudo docker run -it --name dotnet-sdk bitnami/dotnet-sdk:latest
Unable to find image 'bitnami/dotnet-sdk:latest' locally
latest: Pulling from bitnami/dotnet-sdk
a2b89359fa38: Pull complete
5f060ec42d27: Pull complete
be96036eaef8: Pull complete
8b8b05374d97: Pull complete
4825c0d1444d: Pull complete
fe29352e86bd: Pull complete
de0c938bb66c: Pull complete
9410fed9b531: Pull complete
Digest: sha256:319967ef2b0e8399dfd6af6a92ad9b8d313a7d866d4b56cd3240431076a9e410
Status: Downloaded newer image for bitnami/dotnet-sdk:latest
WARNING: The requested image's platform (linux/amd64) does not match the detected host platform (linux/arm64/v8) and no specific platform was requested
standard_init_linux.go:228: exec user process caused: exec format error
```

Nie chciałem robic obrazów które mogą być emulowane aby nie tracić na wydajności dlatego postanowiłem zrobić obraz na natywnej architekturze: arm64

### 2. Zainstalowanie sdk na kontenerze ubuntu

Po uruchomieniu kontenera w trybie interaktywnym i wykonaniu skryptów dostarczonych przez MS instalacja nie linkuje globalnie pliku wykonywalnego dlatego postanowiłem zrobić to ręcznie

Znalazłem adres do pobrania plików: https://dotnetcli.blob.core.windows.net/dotnet/Sdk/master/dotnet-sdk-latest-linux-arm64.tar.gz

Następnie zaaktualizowałem menadźer pakietów aby zaindeksował paczki a nastepnie zainstalowałem curl a z przełącznikiem -y który zgadza się na instalację przez co nie powoduje to blokowania frontendu cli

Potem pobrałem plik z paczką SDK

```bash
ubuntu@szymonvm:~$ sudo docker run -it --name kontener ubuntu
root@66da68d71573:/# apt-get update
root@66da68d71573:/# apt-get install -y curl
root@66da68d71573:/# curl -SL -o dotnet.tar.gz https://dotnetcli.blob.core.windows.net/dotnet/Sdk/master/dotnet-sdk-latest-linux-arm64.tar.gz
```

Paczkę wypakowałem, przeniosłem z binariami do wspólnego katalogu linuxa oraz zrobiłem linka aby dotnet był dostępny globalnie ( w przeciwieństwie do poradnika microsoft o ręcznej instalacji, bez korzystania z .bashrc)

```bash
root@66da68d71573:/#  mkdir -p /usr/share/dotnet
root@66da68d71573:/#  tar -zxf dotnet.tar.gz -C /usr/share/dotnet
root@66da68d71573:/#  ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet
```

Próba uruchomienia maszyny:

```bash
root@66da68d71573:/# dotnet --info
Process terminated. Couldn't find a valid ICU package installed on the system. Please install libicu using your package manager and try again. Alternatively you can set the configuration flag System.Globalization.Invariant to true if you want to run with no globalization support. Please see https://aka.ms/dotnet-missing-libicu for more information.
   at System.Environment.FailFast(System.String)
   at System.Globalization.GlobalizationMode.GetGlobalizationInvariantMode()
   at System.Globalization.GlobalizationMode..cctor()
   at System.Globalization.CultureData.CreateCultureWithInvariantData()
   at System.Globalization.CultureData.get_Invariant()
   at System.Globalization.CultureInfo..cctor()
   at System.Globalization.CultureInfo.get_InvariantCulture()
   at Interop+procfs.GetStatFilePathForProcess(Int32)
   at System.Diagnostics.Process.GetStat()
   at System.Diagnostics.Process.get_StartTimeCore()
   at System.Diagnostics.Process.get_StartTime()
   at Microsoft.DotNet.Cli.Program.Main(System.String[])
Aborted (core dumped)
root@66da68d71573:/#
```

### 3. Brakujące zależności

W poszukiwaniu zależności udałem się na stronę microsoftu i próbowałem zainstalować pakiety. m.in:  libicu67
Okazało się to wyzwaniem ponieważ nie ma go i nie możnabyło znaleść informacji jak zedytować sources.list
```bash
root@66da68d71573:/# apt-get install -y libicu67
Reading package lists... Done
Building dependency tree
Reading state information... Done
E: Unable to locate package libicu67
root@66da68d71573:/# apt-get install -y libicu-dev
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following additional packages will be installed:
  icu-devtools libc-dev-bin libc6-dev libcrypt-dev libicu66 linux-libc-dev manpages manpages-dev tzdata
Suggested packages:
  glibc-doc icu-doc man-browser
The following NEW packages will be installed:
  icu-devtools libc-dev-bin libc6-dev libcrypt-dev libicu-dev libicu66 linux-libc-dev manpages manpages-dev tzdata
0 upgraded, 10 newly installed, 0 to remove and 0 not upgraded.
Need to get 25.1 MB of archives.
```

Zainstalowanie wszystkich zależności: 
```bash
root@66da68d71573:/# apt-get install -y libicu-dev libc6 libgcc1 libgssapi-krb5-2 libssl1.1 libstdc++6 zlib1g curl git
```

### 4. Lokalizacja

Podczas instalacji dependencji instalacja odbywała się w trybie blokującym oczekującym na wejście od uzytkownika co przeszkadza w automatyzacji procesu.

```bash
Configuring tzdata
------------------

Please select the geographic area in which you live. Subsequent configuration questions will narrow this down by
presenting a list of cities, representing the time zones in which they are located.

  1. Africa   3. Antarctica  5. Arctic  7. Atlantic  9. Indian    11. SystemV  13. Etc
  2. America  4. Australia   6. Asia    8. Europe    10. Pacific  12. US
Geographic area:
```

Rozwiązaniem było wczęsniejsze ręczne skonfigurowanie lokalizacji:

```bash

root@66da68d71573:/# ln -fs /usr/share/zoneinfo/Europe/Warsaw /etc/localtime
root@66da68d71573:/# apt-get install -y tzdata
Reading package lists... Done
Building dependency tree
Reading state information... Done

# ...............................................................

Current default time zone: 'Europe/Warsaw'
Local time is now:      Tue Mar 22 19:32:45 CET 2022.
Universal Time is now:  Tue Mar 22 18:32:45 UTC 2022.
Run 'dpkg-reconfigure tzdata' if you wish to change it.

root@66da68d71573:/# dpkg-reconfigure --frontend noninteractive tzdata

Current default time zone: 'Europe/Warsaw'
Local time is now:      Tue Mar 22 19:32:56 CET 2022.
Universal Time is now:  Tue Mar 22 18:32:56 UTC 2022.
```

Po tym możnabyło bez blokowania zainstalować brakujące pakiety

```bash
root@66da68d71573:/# apt-get install -y libicu-dev libc6 libgcc1 libgssapi-krb5-2 libssl1.1 libstdc++6 zlib1g curl git
```

I tym samym uruchomić bezproblemowo dotneta

```bash
root@66da68d71573:/# dotnet --info
.NET SDK (reflecting any global.json):
 Version:   6.0.100-preview.3.21168.18
 Commit:    823c1dfceb

Runtime Environment:
 OS Name:     ubuntu
 OS Version:  20.04
 OS Platform: Linux
 RID:         ubuntu.20.04-arm64
 Base Path:   /usr/share/dotnet/sdk/6.0.100-preview.3.21168.18/

Host (useful for support):
  Version: 6.0.0-preview.3.21167.1
  Commit:  0f64b267ac

.NET SDKs installed:
  6.0.100-preview.3.21168.18 [/usr/share/dotnet/sdk]

.NET runtimes installed:
  Microsoft.AspNetCore.App 6.0.0-preview.3.21167.12 [/usr/share/dotnet/shared/Microsoft.AspNetCore.App]
  Microsoft.NETCore.App 6.0.0-preview.3.21167.1 [/usr/share/dotnet/shared/Microsoft.NETCore.App]

To install additional .NET runtimes or SDKs:
  https://aka.ms/dotnet-download
```

Ostatnią rzeczą jest pobranie i zainstalowanie NodeJs 16

```bash


root@66da68d71573:/# curl -sL https://deb.nodesource.com/setup_16.x -o /tmp/nodesource_setup.sh
root@66da68d71573:/# bash /tmp/nodesource_setup.sh


root@66da68d71573:/# apt install nodejs
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following NEW packages will be installed:
  nodejs
0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
Need to get 25.6 MB of archives.
After this operation, 121 MB of additional disk space will be used.
Get:1 https://deb.nodesource.com/node_16.x focal/main arm64 nodejs arm64 16.14.2-deb-1nodesource1 [25.6 MB]
Fetched 25.6 MB in 1s (50.3 MB/s)
debconf: delaying package configuration, since apt-utils is not installed
Selecting previously unselected package nodejs.
(Reading database ... 15122 files and directories currently installed.)
Preparing to unpack .../nodejs_16.14.2-deb-1nodesource1_arm64.deb ...
Unpacking nodejs (16.14.2-deb-1nodesource1) ...
Setting up nodejs (16.14.2-deb-1nodesource1) ...
root@66da68d71573:/# node -v
v16.14.2
root@66da68d71573:/# mpm -v
8.5.0
root@66da68d71573:/#
```



## DockerFile

Mając ręcznie przeprowadzony proces budowania obrazu automatyzuję proces przez umieszczeni instruckji w dockerfile

```dockerfile
FROM ubuntu:latest

RUN apt-get update

RUN ln -fs /usr/share/zoneinfo/Europe/Warsaw /etc/localtime
RUN apt-get install -y tzdata
RUN dpkg-reconfigure --frontend noninteractive tzdata

RUN apt-get install -y libicu-dev libc6 libgcc1 libgssapi-krb5-2 libssl1.1 libstdc++6 zlib1g curl git

RUN curl -SL -o dotnet.tar.gz https://download.visualstudio.microsoft.com/download/pr/33c6e1e3-e81f-44e8-9de8-91934fba3c94/9105f95a9e37cda6bd0c33651be2b90a/dotnet-sdk-6.0.201-linux-arm64.tar.gz
RUN mkdir -p /usr/share/dotnet
RUN tar -zxf dotnet.tar.gz -C /usr/share/dotnet
RUN ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet

RUN rm dotnet.tar.gz

RUN curl -sL https://deb.nodesource.com/setup_16.x -o /tmp/nodesource_setup.sh
RUN bash /tmp/nodesource_setup.sh

RUN apt install nodejs

RUN dotnet --info
```

## Budowanie obrazu

```bash
ubuntu@szymonvm:~$ sudo docker build -t devenv . -f dokerek
Sending build context to Docker daemon  562.3MB
Step 1/15 : FROM ubuntu:latest
 ---> e784f03641c9
Step 2/15 : RUN apt-get update
 ---> Running in d9ee454350f9
Get:1 http://ports.ubuntu.com/ubuntu-ports focal InRelease [265 kB]
Get:2 http://ports.ubuntu.com/ubuntu-ports focal-updates InRelease [114 kB]
Get:3 http://ports.ubuntu.com/ubuntu-ports focal-backports InRelease [108 kB]
Get:4 http://ports.ubuntu.com/ubuntu-ports focal-security InRelease [114 kB]
Get:5 http://ports.ubuntu.com/ubuntu-ports focal/multiverse arm64 Packages [139 kB]
Get:6 http://ports.ubuntu.com/ubuntu-ports focal/restricted arm64 Packages [1317 B]
Get:7 http://ports.ubuntu.com/ubuntu-ports focal/universe arm64 Packages [11.1 MB]
Get:8 http://ports.ubuntu.com/ubuntu-ports focal/main arm64 Packages [1234 kB]
Get:9 http://ports.ubuntu.com/ubuntu-ports focal-updates/main arm64 Packages [1450 kB]
Get:10 http://ports.ubuntu.com/ubuntu-ports focal-updates/restricted arm64 Packages [4150 B]
Get:11 http://ports.ubuntu.com/ubuntu-ports focal-updates/universe arm64 Packages [1080 kB]
Get:12 http://ports.ubuntu.com/ubuntu-ports focal-updates/multiverse arm64 Packages [9066 B]
Get:13 http://ports.ubuntu.com/ubuntu-ports focal-backports/universe arm64 Packages [26.0 kB]
Get:14 http://ports.ubuntu.com/ubuntu-ports focal-backports/main arm64 Packages [51.1 kB]
Get:15 http://ports.ubuntu.com/ubuntu-ports focal-security/restricted arm64 Packages [3913 B]
Get:16 http://ports.ubuntu.com/ubuntu-ports focal-security/multiverse arm64 Packages [3254 B]
Get:17 http://ports.ubuntu.com/ubuntu-ports focal-security/universe arm64 Packages [797 kB]
Get:18 http://ports.ubuntu.com/ubuntu-ports focal-security/main arm64 Packages [1092 kB]
Fetched 17.6 MB in 1s (17.3 MB/s)
Reading package lists...
Removing intermediate container d9ee454350f9
 ---> 511bdba4e635
Step 3/15 : RUN ln -fs /usr/share/zoneinfo/Europe/Warsaw /etc/localtime
 ---> Running in b70958c0e2ff
Removing intermediate container b70958c0e2ff
 ---> a1fedac57135
Step 4/15 : RUN apt-get install -y tzdata

#........................................................

Step 15/15 : RUN dotnet --info
 ---> Running in 9f5c9fdac60a
.NET SDK (reflecting any global.json):
 Version:   6.0.201
 Commit:    ef40e6aa06

Runtime Environment:
 OS Name:     ubuntu
 OS Version:  20.04
 OS Platform: Linux
 RID:         ubuntu.20.04-arm64
 Base Path:   /usr/share/dotnet/sdk/6.0.201/

```

Posiadane obrazy

```bash
ubuntu@szymonvm:~$ sudo docker images
REPOSITORY           TAG       IMAGE ID       CREATED              SIZE
devenv               latest    96fa8ad6111c   About a minute ago   1.12GB
bitnami/dotnet-sdk   latest    e81634f3b723   13 hours ago         933MB
ubuntu               latest    e784f03641c9   4 days ago           65.6MB
```

## Klonowanie repo

sklonowałem repozytorium aplikacji webowej
uruchomiłem kontener montując w nim w ścieżce /app sklonowany folder repozytorium przełącznik -v. Skopiowałem folder to tymczasowego katalogu aby zmiany nie były dokonywane na hoście.


```bash

ubuntu@szymonvm:~$ sudo docker run -p 27017:27017 -v /home/ubuntu/web-app/:/app -it devenv bash
root@33ed5dc67514:/#

root@33ed5dc67514:/# cp -r app /tmp

root@33ed5dc67514:/# cd /app /tmp
root@33ed5dc67514:/tmp/app# ls
LICENSE.md                              Panel.EmotoAgh.Backend.Sql       Panel.EmotoAgh.Frontend
Panel.EmotoAgh.Backend                  Panel.EmotoAgh.Backend.UnitTest  Panel.EmotoAgh.ServerConfiguration
Panel.EmotoAgh.Backend.DatabaseContext  Panel.EmotoAgh.CI                Panel.EmotoAgh.SignalR.Client
Panel.EmotoAgh.Backend.DbContext        Panel.EmotoAgh.Deprecated        Panel.EmotoAgh.sln
Panel.EmotoAgh.Backend.Models           Panel.EmotoAgh.E2ETest           Readme.md
Panel.EmotoAgh.Backend.SignalR          Panel.EmotoAgh.ErrorPage.503
root@33ed5dc67514:/tmp/app#

```


### Kompilowanie projektu

```bash
root@33ed5dc67514:/tmp/app# cd Panel.EmotoAgh.Backend
root@33ed5dc67514:/tmp/app/Panel.EmotoAgh.Backend# ls
Controllers                    Program.cs  Utils               appsettings.Development.json  bin  s
Panel.EmotoAgh.Backend.csproj  Properties  WeatherForecast.cs  appsettings.json              obj
root@33ed5dc67514:/tmp/app/Panel.EmotoAgh.Backend# ls
Controllers                    Program.cs  Utils               appsettings.Development.json  bin  s
Panel.EmotoAgh.Backend.csproj  Properties  WeatherForecast.cs  appsettings.json              obj
root@33ed5dc67514:/tmp/app/Panel.EmotoAgh.Backend# dotnet build

Welcome to .NET 6.0!
---------------------
```

Na tym etapie pojawił się problem że pakiety nie są typu 6.0.3-preview (MS <3) dlatego ponowiłem cały proces budowania obrazu z stabliną wersją. Link na stronie posiada nie stabilne SDK dlatego korzystając z skryptów microsoftu do instalacji dotneta odszukałem ścieżkę nie zawierającą GUID a

Ponadto aby zmniejszyć rozmiar dodałem usuwanie pobranego archiwum, oraz pliku node install.

Ostatnią zmianą było dodanie ostatnich poleceń sprawdzających wersje programów, ma to na celu przerwanie budowania jeśli info zwróci błąd, czyli w momencie jakiegoś błędu instalacji

```bash
ubuntu@szymonvm:~$ node -v

Command 'node' not found, but can be installed with:

sudo apt install nodejs

ubuntu@szymonvm:~$ echo $?
127
ubuntu@szymonvm:~$ pwd
/home/ubuntu
ubuntu@szymonvm:~$ echo $?
0
ubuntu@szymonvm:~$
```


## Ostateczny dockerfile

```dockerfile
RUN curl -SL -o dotnet.tar.gz https://dotnetcli.azureedge.net/dotnet/Sdk/6.0.103/dotnet-sdk-6.0.103-linux-arm64.tar.gz

```

```dockerfile
FROM ubuntu:latest

RUN apt-get update

RUN ln -fs /usr/share/zoneinfo/Europe/Warsaw /etc/localtime
RUN apt-get install -y tzdata
RUN dpkg-reconfigure --frontend noninteractive tzdata

RUN apt-get install -y libicu-dev libc6 libgcc1 libgssapi-krb5-2 libssl1.1 libstdc++6 zlib1g curl git

RUN curl -SL -o dotnet.tar.gz https://dotnetcli.azureedge.net/dotnet/Sdk/6.0.103/dotnet-sdk-6.0.103-linux-arm64.tar.gz
RUN mkdir -p /usr/share/dotnet
RUN tar -zxf dotnet.tar.gz -C /usr/share/dotnet
RUN ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet

RUN rm dotnet.tar.gz

RUN curl -sL https://deb.nodesource.com/setup_16.x -o /tmp/nodesource_setup.sh
RUN bash /tmp/nodesource_setup.sh

RUN apt install nodejs

RUN rm /tmp/nodesource_setup.sh


RUN dotnet --info
RUN node -v
RUN npm -v

```


Następnie ponownie stworzyłem obraz kończąc tym samym przeprawę przez budowanie obrazu oraz tym samym osiągając swój cel. tj mam obraz w natywnej platformie, bez emulacji itp. 


## Budowanie, testowanie aplikacji

Proces budowania aplikacji rozpoczynam po znalezieniu się w katalogu od zbudowania backendu, przetestowaniu backendu (xunit).
Następnie przechodzę do frontendu i wykonuję w nim testy jednostkowe (jest).

Po przetestowaniu tworzę build produkcyjny


```dockerfile
FROM devenv

EXPOSE 5000/tcp

COPY /web-app /app

WORKDIR /app/Panel.EmotoAgh.Backend

RUN dotnet build
RUN dotnet test

WORKDIR /app/Panel.EmotoAgh.Frontend
RUN npm install
RUN npm run test

WORKDIR /app/Panel.EmotoAgh.Backend

RUN dotnet publish --configuration Relase --output /rc
```


Wybrane kroki
```bash
ubuntu@szymonvm:~$ sudo docker build -t devapp . -f dokerek2
Step 1/11 : FROM devenv
 ---> 4d0a44c1b368
Step 2/11 : EXPOSE 5000/tcp
 ---> Running in 355e991137f6
Removing intermediate container 355e991137f6
 ---> 4f32ae64bebf
Step 3/11 : COPY /web-app /app
 ---> 96f9546242e0
Step 4/11 : WORKDIR /app/Panel.EmotoAgh.Backend
 ---> Running in 686113f091fa
Removing intermediate container 686113f091fa
 ---> d27d27e5b306
Step 5/11 : RUN dotnet build
 ---> Running in f9e26957dfad
# ------------------------------
Step 6/11 : RUN dotnet test
 ---> Running in 1c90846ce528
  Determining projects to restore...
  All projects are up-to-date for restore.
Removing intermediate container 1c90846ce528
 ---> e141cb0fd4d8
Step 7/11 : WORKDIR /app/Panel.EmotoAgh.Frontend
 ---> Running in 87caae4a9754
Removing intermediate container 87caae4a9754
 ---> edf7b12c65aa
Step 8/11 : RUN npm install
 ---> Running in 97d6e63deb9d
# ------------------------------
Removing intermediate container 97d6e63deb9d
 ---> 7d8c9d8e81f3
Step 9/11 : RUN npm run test
 ---> Running in 60e8c555ddbb

> panel.emotoagh.frontend@0.1.0 test
> cross-env CI=true react-scripts test --env=jsdom

# ------------------------------

Test Suites: 8 passed, 8 total
Tests:       26 passed, 26 total
Snapshots:   0 total
Time:        4.664 s
Ran all test suites.
Removing intermediate container 60e8c555ddbb
 ---> 9b769b4cdab4
Step 10/11 : WORKDIR /app/Panel.EmotoAgh.Backend
 ---> Running in 61b8376d8075
Removing intermediate container 61b8376d8075
 ---> e04f0a4b2bee
Step 11/11 : RUN dotnet publish --configuration Relase --output /rc
 ---> Running in 3add72582bca
Microsoft (R) Build Engine version 17.0.0+c9eb9dd64 for .NET
Copyright (C) Microsoft Corporation. All rights reserved.

# ------------------------------
  Panel.EmotoAgh.Backend -> /app/Panel.EmotoAgh.Backend/bin/Relase/net6.0/Panel.EmotoAgh.Backend.dll
# ------------------------------
  > panel.emotoagh.frontend@0.1.0 build
  > react-scripts build

  Creating an optimized production build...
  Compiled successfully.

  File sizes after gzip:

    67.05 kB  build/static/js/main.6c2d5295.js
    24.43 kB  build/static/css/main.06daf35c.css
    1.44 kB   build/static/js/377.ac86b2d6.chunk.js,

# ------------------------------

Panel.EmotoAgh.Backend -> /rc/
Removing intermediate container 3add72582bca
 ---> d3ee598f8b2b
Successfully built d3ee598f8b2b
Successfully tagged devapp:latest

```

Obraz zawierający tysiące pakietów node odwdzięcza się rozmiarem

```bash
ubuntu@szymonvm:~$ sudo docker images
REPOSITORY   TAG       IMAGE ID       CREATED              SIZE
devapp       latest    d3ee598f8b2b   About a minute ago   2.39GB
devenv       latest    4d0a44c1b368   50 minutes ago       1.11GB
ubuntu       latest    e784f03641c9   4 days ago           65.6MB
```

Srodowisko produkcyjne nie musi zawierać node, oraz nie musi zawierać dotenta SDK, wystarczy sam runtime, co więcej wystarczy plik wykonywalny w konfiguracji self-contaned uruchomiony na kontenerze ubuntu, wtedy jego rozmiar jest znacznie mniejszy.

Natomiast mając taki obraz deweloperski gdy nie podbijamy wersji pakietów npm czy nie wywołujemy npn install build jest dużo szybszy, w momencie zmiany paczek stworzenie ponowanie obrazu z paczkami rozwiąże ten problem


Pozostało uruchomić kontener a w nim aplikacją znajdującą się na obrazie

```bash
ubuntu@szymonvm:~$ sudo docker run -p 5000:5000 -d --name rc devapp /rc/Panel.EmotoAgh.Backend --urls=http://localhost:5000/  JWTAuthority="Nie bd wykorzystane" PostgreSqlConnectionString="***********"
3d64c51bc9153c14de56a4017ccba076dc275e1ae500a7327ea901d5690a0341
ubuntu@szymonvm:~$ sudo netstat -tunlp | grep 5000
tcp        0      0 0.0.0.0:5000            0.0.0.0:*               LISTEN      108069/docker-proxy
tcp6       0      0 :::5000                 :::*                    LISTEN      108075/docker-proxy
ubuntu@szymonvm:~$
```

## Wykaż, że kontener wdraża się i pracuje poprawnie

Na etapie budowania obrazów wykazywałem to np. uruchamiając dotnet --info (brak dependencji pokazał że wystąpi błąd) 
Poprawnie działający kontener pokazałem ostatnio sprawdzając nasłuchiwanie na porcie 5000. Dotatkowo mogę pokazać poniższy output 

```bash
ubuntu@szymonvm:~$ sudo docker run -p 5000:5000 --name rc devapp /rc/Panel.EmotoAgh.Backend --urls=http://localhost:5000/  JWTAuthority="Nie bd wykorzystane" PostgreSqlConnectionString="***********"
info: IdentityServer4.Startup[0]
      Starting IdentityServer4 version 4.1.2+997a6cdd643e46cd5762b710c4ddc43574cbec2e
info: IdentityServer4.Startup[0]
      Using the default authentication scheme Bearer for IdentityServer
info: IdentityServer4.Startup[0]
      Authentication scheme Bearer is configured for IdentityServer, but it is not a scheme that supports signin (like cookies). If you support interactive logins via the browser, then a cookie-based scheme should be used.
warn: Microsoft.AspNetCore.DataProtection.KeyManagement.XmlKeyManager[35]
      No XML encryptor configured. Key {861dfe40-f36b-4bcc-b3f8-757581f9840a} may be persisted to storage in unencrypted form.info: Microsoft.Hosting.Lifetime[14]
      Now listening on: http://localhost:5000
info: Microsoft.Hosting.Lifetime[0]
      Application started. Press Ctrl+C to shut down.
info: Microsoft.Hosting.Lifetime[0]
      Hosting environment: Production
info: Microsoft.Hosting.Lifetime[0]
      Content root path: /app/Panel.EmotoAgh.Backend/

```


# W sprawozdaniu dla ułatwienia czytelności umieszczam basha w md, natomiast zdjęcia i tak znajdują się w folderze obok sprawozdania