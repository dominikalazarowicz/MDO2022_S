# Zachowywanie stanu

W celu skompilowania projektu w kontenerze skorystałem z obrazu deweloperskiego niezawierającego git-a. Zastosowane w nim przygotowane paczki mogą pozwalają na skompilowanie projektu

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

Tworzenie obrazu

```bash
root@szymonvm:/home/ubuntu# sudo docker build -t devenv . -f dokerek
Sending build context to Docker daemon  704.8MB
Step 1/18 : FROM ubuntu:latest
latest: Pulling from library/ubuntu
57d0418fe9dc: Already exists
Digest: sha256:bea6d19168bbfd6af8d77c2cc3c572114eb5d113e6f422573c93cb605a0e2ffb
Status: Downloaded newer image for ubuntu:latest
 ---> e784f03641c9
Step 2/18 : RUN apt-get update
 ---> Running in a849eade8809

 # .................................

 To install additional .NET runtimes or SDKs:
  https://aka.ms/dotnet-download
Removing intermediate container 0f627f5a947c
 ---> 4bcfbfb54c35
Step 17/18 : RUN node -v
 ---> Running in e12ddc092b21
v16.14.2
Removing intermediate container e12ddc092b21
 ---> eecae3e5898b
Step 18/18 : RUN npm -v
 ---> Running in e89beeb35e1c
8.5.0
Removing intermediate container e89beeb35e1c
 ---> 6ca07de65863
Successfully built 6ca07de65863
Successfully tagged devenv:latest
root@szymonvm:/home/ubuntu#

```

Aby przekazać nieulotne dane do kontenera można skorzystać z voluminów.
Z tego powodu tworzę dwa odpowiednie przestrzenie na pliki które są montowane w systemie w podanych lokalizacjach.

Tak stworzone woluminy mogą być zamontowane w kontenerze który będzie dokonywaw zapisów.


```bash

root@szymonvm:/home/ubuntu# docker volume create in
in
root@szymonvm:/home/ubuntu# docker volume create out
out
root@szymonvm:/home/ubuntu# docker volume ls
DRIVER    VOLUME NAME
local     in
local     out
root@szymonvm:/home/ubuntu# docker volume inspect in
[
    {
        "CreatedAt": "2022-04-03T11:49:44Z",
        "Driver": "local",
        "Labels": {},
        "Mountpoint": "/var/lib/docker/volumes/in/_data",
        "Name": "in",
        "Options": {},
        "Scope": "local"
    }
]
root@szymonvm:/home/ubuntu# docker volume inspect out
[
    {
        "CreatedAt": "2022-04-03T11:49:47Z",
        "Driver": "local",
        "Labels": {},
        "Mountpoint": "/var/lib/docker/volumes/out/_data",
        "Name": "out",
        "Options": {},
        "Scope": "local"
    }
]
```

Na wolumin wejściowy zostanie sklonowane repozytorium porjektu. Korzysta on z kluczy shh i klienta gita zainstalowanego w systemi przez co unikam konieczności dodawania tego w kontenerze



```bash
root@szymonvm:~# cd /var/lib/docker/volumes/in/_data
root@szymonvm:/var/lib/docker/volumes/in/_data# git clone git@gitlab.com:e-moto-smart-systems-5.0/web-app.git
Cloning into 'web-app'...
remote: Enumerating objects: 2938, done.
remote: Counting objects: 100% (499/499), done.
remote: Compressing objects: 100% (442/442), done.
remote: Total 2938 (delta 288), reused 95 (delta 45), pack-reused 2439
Receiving objects: 100% (2938/2938), 13.32 MiB | 12.89 MiB/s, done.
Resolving deltas: 100% (1662/1662), done.
root@szymonvm:/var/lib/docker/volumes/in/_data#

```
Uruchamiam kontener w trybie interaktywnym korzystając z obrazu środowiska deweloperskiego.
Ponadto montuje w kontenerze stworzone wolumniny

- Wolumin ```in``` Punkt montowania /app
- Wolumin ```out``` Punkt montowania /build

Po wykonaniu tego mogę w kontenrze zobaczyć pliki projektu

```bash

root@szymonvm:/var/lib/docker/volumes/in/_data# sudo docker run -it --name kontener --mount source=in,target=/app --mount source=out,target=/build    devenv
root@52f109e9e6ad:/# ls
app  bin  boot  build  dev  etc  home  lib  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
root@52f109e9e6ad:/# cd app
root@52f109e9e6ad:/app# ls
web-app
root@52f109e9e6ad:/app# cd web-app/
root@52f109e9e6ad:/app/web-app# ls
LICENSE.md                              Panel.EmotoAgh.Backend.Sql       Panel.EmotoAgh.Frontend
Panel.EmotoAgh.Backend                  Panel.EmotoAgh.Backend.UnitTest  Panel.EmotoAgh.ServerConfiguration
Panel.EmotoAgh.Backend.DatabaseContext  Panel.EmotoAgh.CI                Panel.EmotoAgh.SignalR.Client
Panel.EmotoAgh.Backend.DbContext        Panel.EmotoAgh.Deprecated        Panel.EmotoAgh.sln
Panel.EmotoAgh.Backend.Models           Panel.EmotoAgh.E2ETest           Readme.md
Panel.EmotoAgh.Backend.SignalR          Panel.EmotoAgh.ErrorPage.503
root@52f109e9e6ad:/app/web-app#

```

Przeprowdzam standordową operację publikacji aplikacji a jako folder wyściowy wskazuję /build co jest woluminem wyjściowym

```bash

root@52f109e9e6ad:/app/web-app/Panel.EmotoAgh.Backend# dotnet publish --configuration Relase --output /build
Microsoft (R) Build Engine version 17.0.0+c9eb9dd64 for .NET
Copyright (C) Microsoft Corporation. All rights reserved.

  Determining projects to restore...
  Restored /app/web-app/Panel.EmotoAgh.Backend.SignalR/Panel.EmotoAgh.Backend.SignalR.csproj (in 11.7 sec).
  Restored /app/web-app/Panel.EmotoAgh.Backend.Models/Panel.EmotoAgh.Backend.Models.csproj (in 2.92 sec).
  Restored /app/web-app/Panel.EmotoAgh.Backend.DatabaseContext/Panel.EmotoAgh.Backend.DatabaseContext.csproj (in 17 ms).
  Restored /app/web-app/Panel.EmotoAgh.Backend/Panel.EmotoAgh.Backend.csproj (in 18.07 sec).

 # .................................
 added 1639 packages, and audited 1640 packages in 37s

  187 packages are looking for funding
    run `npm fund` for details

  8 vulnerabilities (6 moderate, 2 high)

  To address issues that do not require attention, run:
    npm audit fix

  To address all issues (including breaking changes), run:
    npm audit fix --force
 # .................................

  > panel.emotoagh.frontend@0.1.0 build
  > react-scripts build

  Creating an optimized production build...
  Compiled successfully.

  File sizes after gzip:

    67.05 kB  build/static/js/main.6c2d5295.js
    24.43 kB  build/static/css/main.06daf35c.css
    1.44 kB   build/static/js/377.ac86b2d6.chunk.js


# .................................
  The build folder is ready to be deployed.
  You may serve it with a static server:

    npm install -g serve
    serve -s build

  Find out more about deployment here:

    https://cra.link/deployment

  Panel.EmotoAgh.Backend -> /build/

```

Zawartość zbudowanej aplikacji w kontenerze

```bash
root@52f109e9e6ad:/build# ls
AutoMapper.dll                                         NetTopologySuite.IO.GeoJSON4STJ.dll
IdentityModel.dll                                      NetTopologySuite.IO.PostGis.dll
IdentityServer4.EntityFramework.Storage.dll            NetTopologySuite.dll
IdentityServer4.EntityFramework.dll                    Newtonsoft.Json.dll
IdentityServer4.Storage.dll                            Npgsql.EntityFrameworkCore.PostgreSQL.NetTopologySuite.dll
IdentityServer4.dll                                    Npgsql.EntityFrameworkCore.PostgreSQL.dll
Microsoft.AspNetCore.Authentication.JwtBearer.dll      Npgsql.NetTopologySuite.dll
Microsoft.AspNetCore.Authentication.OpenIdConnect.dll  Npgsql.dll
Microsoft.EntityFrameworkCore.Abstractions.dll         Panel.EmotoAgh.Backend
Microsoft.EntityFrameworkCore.Relational.dll           Panel.EmotoAgh.Backend.DatabaseContext.dll
Microsoft.EntityFrameworkCore.dll                      Panel.EmotoAgh.Backend.DatabaseContext.pdb
Microsoft.Extensions.Caching.Memory.dll                Panel.EmotoAgh.Backend.Models.dll
Microsoft.IdentityModel.JsonWebTokens.dll              Panel.EmotoAgh.Backend.Models.pdb
Microsoft.IdentityModel.Logging.dll                    Panel.EmotoAgh.Backend.SignalR.dll
Microsoft.IdentityModel.Protocols.OpenIdConnect.dll    Panel.EmotoAgh.Backend.SignalR.pdb
Microsoft.IdentityModel.Protocols.dll                  Panel.EmotoAgh.Backend.deps.json
Microsoft.IdentityModel.Tokens.dll                     Panel.EmotoAgh.Backend.dll
NJsonSchema.Yaml.dll                                   Panel.EmotoAgh.Backend.pdb
NJsonSchema.dll                                        Panel.EmotoAgh.Backend.runtimeconfig.json
NSwag.Annotations.dll                                  Panel.EmotoAgh.Backend.xml
NSwag.AspNetCore.dll                                   Panel.EmotoAgh.ErrorPage.503
NSwag.Core.Yaml.dll                                    System.IdentityModel.Tokens.Jwt.dll
NSwag.Core.dll                                         YamlDotNet.dll
NSwag.Generation.AspNetCore.dll                        appsettings.Development.json
NSwag.Generation.dll                                   appsettings.json
Namotion.Reflection.dll                                web.config
NetTopologySuite.Features.dll                          wwwroot
root@52f109e9e6ad:/build#
```

Częściowa zawartość zbudowanej aplikacji w systemie hosta


```bash
root@szymonvm:/var/lib/docker/volumes/out/_data# ls
AutoMapper.dll                                         NetTopologySuite.IO.GeoJSON4STJ.dll
IdentityModel.dll                                      NetTopologySuite.IO.PostGis.dll
IdentityServer4.EntityFramework.Storage.dll            NetTopologySuite.dll
IdentityServer4.EntityFramework.dll                    Newtonsoft.Json.dll
IdentityServer4.Storage.dll                            Npgsql.EntityFrameworkCore.PostgreSQL.NetTopologySuite.dll
IdentityServer4.dll                                    Npgsql.EntityFrameworkCore.PostgreSQL.dll
Microsoft.AspNetCore.Authentication.JwtBearer.dll      Npgsql.NetTopologySuite.dll
Microsoft.AspNetCore.Authentication.OpenIdConnect.dll  Npgsql.dll

```

Uruchomienie aplikacji.
Na tym etapie uruchomiłem aplikację w systemie hosta natomiast można stworzyć kontener zawierający tylko środowisko uruchomieniowe dotnet 6, zamontować w nim wolumin ```out``` zawierający projekt dotneta i reacta


```bash
root@szymonvm:/var/lib/docker/volumes/out/_data# ./Panel.EmotoAgh.Backend  JWTAuthority=""  PostgreSqlConnectionString="localhost"
info: IdentityServer4.Startup[0]
      Starting IdentityServer4 version 4.1.2+997a6cdd643e46cd5762b710c4ddc43574cbec2e
info: IdentityServer4.Startup[0]
      Using the default authentication scheme Bearer for IdentityServer
info: IdentityServer4.Startup[0]
      Authentication scheme Bearer is configured for IdentityServer, but it is not a scheme that supports signin (like cookies). If you support interactive logins via the browser, then a cookie-based scheme should be used.
info: Microsoft.Hosting.Lifetime[14]
      Now listening on: http://localhost:5000
info: Microsoft.Hosting.Lifetime[0]
      Application started. Press Ctrl+C to shut down.
info: Microsoft.Hosting.Lifetime[0]
      Hosting environment: Production
info: Microsoft.Hosting.Lifetime[0]
      Content root path: /var/lib/docker/volumes/out/_data/
```

