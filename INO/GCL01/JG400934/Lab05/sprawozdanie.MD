Uruchomienie dinda oraz jenkinsa:


```
docker run --name jenkins-docker --rm --detach \
  --privileged --network jenkins --network-alias docker \
  --env DOCKER_TLS_CERTDIR=/certs \
  --volume jenkins-docker-certs:/certs/client \
  --volume jenkins-data:/var/jenkins_home \
  --publish 2376:2376 \
  docker:dind --storage-driver overlay2
```


```
docker run --name jenkins-jen --rm --detach \
  --network jenkins --env DOCKER_HOST=tcp://docker:2376 \
  --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1 \
  --publish 8080:8080 --publish 50000:50000 \
  --volume jenkins-data:/var/jenkins_home \
  --volume jenkins-docker-certs:/certs/client:ro \
  jenkins_1:latest
```

Utworzenie odpowiednich plików Dockerfile:


Deps:


![deps](dockerfile-deps.png)


Build:


![build](dockerfile-build.png)



Test:


![test](dockerfile-test.png)


Deploy:


![deploy](dockerfile-deploy.png)


Publish:


![publish](dockerfile-publish.png)


Skopiowanie ich na jenkinsa za pomocą komend:


```
docker cp DOCKER-IRSSI-DEPS jenkins-jen:/var/jenkins_home/DockerFiles/DOCKER-IRSSI-DEPS
docker cp DOCKER-IRSSI-BUILD jenkins-jen:/var/jenkins_home/DockerFiles/DOCKER-IRSSI-BUILD
docker cp DOCKER-IRSSI-TEST jenkins-jen:/var/jenkins_home/DockerFiles/DOCKER-IRSSI-TEST
docker cp DOCKER-IRSSI-DEPLOY jenkins-jen:/var/jenkins_home/DockerFiles/DOCKER-IRSSI-DEPLOY
docker cp DOCKER-IRSSI-PUBLISH jenkins-jen:/var/jenkins_home/DockerFiles/DOCKER-IRSSI-PUBLISH
```



Pipeline:


```
pipeline {
    agent any

    stages {
        stage('Init') {
            steps {
                echo 'Init'
                sh "docker build -t irssi_deps_1:latest . -f /var/jenkins_home/DockerFiles/DOCKER-IRSSI-DEPS"
            }
        }
        stage('Build') {
            steps {
                echo 'Build'
                sh "docker build -t irssi_build_1:latest . -f /var/jenkins_home/DockerFiles/DOCKER-IRSSI-BUILD"
				sh "docker run -t -d --name irssi_build_21 -v vol_out_irssi:/vol_out_irssi irssi_build_1:latest"
				sh "docker cp irssi_build_21:/irssi/build ./build-irssi-super"
				sh "docker cp ./build-irssi-super irssi_build_21:/vol_out_irssi/build"
				sh "docker stop irssi_build_21"
				sh "docker container rm irssi_build_21"
            }
        }
        stage('Test') {
            steps {
                echo 'Test'
                sh "docker build -t irssi_test_1:latest . -f /var/jenkins_home/DockerFiles/DOCKER-IRSSI-TEST"
            }
        }
		stage('Deploy') {
            steps {
                echo 'Deploy'
                sh "docker build -t irssi_deploy_1:latest . -f /var/jenkins_home/DockerFiles/DOCKER-IRSSI-DEPLOY"
				sh "docker run -t -d -e TERM=xterm --name irssi_deploy_21 -v vol_out_irssi:/vol_out_irssi irssi_deploy_1:latest"
				sh "docker exec irssi_deploy_21 irssi"
				sh "docker stop irssi_deploy_21"
				sh "docker container rm irssi_deploy_21"
            }
        }
		stage('Publish') {
            steps {
                echo 'Publish'
                sh "docker build -t irssi_publish_1:latest . -f /var/jenkins_home/DockerFiles/DOCKER-IRSSI-PUBLISH"
				sh "docker run -t -d --name irssi_publish_21 -v vol_out_irssi:/vol_out_irssi irssi_publish_1:latest"
				sh "docker exec irssi_publish_21 tar -czvf archive.tgz ./build"
				sh "docker stop irssi_publish_21"
				sh "docker container rm irssi_publish_21"
            }
        }
    }
}

```


Wszystko na zielone, jest dobrze:


![green](pipeline-green.png)


Na samym dole dodatkowo załączam wydruk z konsoli z działania tego pipeline'a.


Krótki opis co i dlaczego:

Stage Init:

Utworzenie obrazu z dependencjami

Stage Build:

Utworzenie (na podstawie obrazu deps) obrazu do którego zostaje sklonowane irssi z githuba oraz zbuildowane a następnie gotowy build "wyrzucony" na wolumin wyjściowy.

Stage Test:

Na podstawie obrazu build, przeprowadzenie testów builda

Stage Deploy:

Uruchomienie programu. Deploy w przypadku np. restowego api, mogłoby być postawione na dockerze wrzucone na kubernetesa i udostępnione na jakimś adresie, ale że to aplikacja IRSSI to wrzucenie jej na dockera i włączenie nie ma za dużo sensu, ale spełnić krok deploy jakoś trzeba było :)

Stage Publish:

Spakowanie zkompilowanego programu do archiwum i udostępnienie na działającynm dockerze.

Dla uproszczenia wszystkie kontenery po wykonaniu powyższych czynności zostają zamknięte i usunięte.





Output:


```
Started by user admin
[Pipeline] Start of Pipeline
[Pipeline] node
Running on Jenkins in /var/jenkins_home/workspace/irssi_1
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Init)
[Pipeline] echo
Init
[Pipeline] sh
+ docker build -t irssi_deps_1:latest . -f /var/jenkins_home/DockerFiles/DOCKER-IRSSI-DEPS
Sending build context to Docker daemon  27.79MB

Step 1/2 : FROM fedora:34
 ---> af70648d87b6
Step 2/2 : RUN yum install -y --skip-broken git gcc gcc-c++ make automake meson ca-c* libgcrypt* glib2* utf8proc* openssl-devel ncurses* libgcrypt* glib2-devel utf8proc* openssl-devel ncurses*
 ---> Using cache
 ---> ec239addfeb4
Successfully built ec239addfeb4
Successfully tagged irssi_deps_1:latest
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Build)
[Pipeline] echo
Build
[Pipeline] sh
+ docker build -t irssi_build_1:latest . -f /var/jenkins_home/DockerFiles/DOCKER-IRSSI-BUILD
Sending build context to Docker daemon  27.79MB

Step 1/5 : FROM irssi_deps_1:latest
 ---> ec239addfeb4
Step 2/5 : RUN git clone https://github.com/irssi/irssi.git
 ---> Using cache
 ---> 921fe06a7970
Step 3/5 : WORKDIR irssi
 ---> Using cache
 ---> e478f8473e4d
Step 4/5 : RUN meson setup build
 ---> Using cache
 ---> f12ecd4687d2
Step 5/5 : RUN ninja -C build
 ---> Using cache
 ---> 4f0304c6ee41
Successfully built 4f0304c6ee41
Successfully tagged irssi_build_1:latest
[Pipeline] sh
+ docker run -t -d --name irssi_build_21 -v vol_out_irssi:/vol_out_irssi irssi_build_1:latest
35afcaa872b5e0967c5e25a4dc8ae137ed7c5d3d6988ec627a7a12d59b559cae
[Pipeline] sh
+ docker cp irssi_build_21:/irssi/build ./build-irssi-super
[Pipeline] sh
+ docker cp ./build-irssi-super irssi_build_21:/vol_out_irssi/build
[Pipeline] sh
+ docker stop irssi_build_21
irssi_build_21
[Pipeline] sh
+ docker container rm irssi_build_21
irssi_build_21
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Test)
[Pipeline] echo
Test
[Pipeline] sh
+ docker build -t irssi_test_1:latest . -f /var/jenkins_home/DockerFiles/DOCKER-IRSSI-TEST
Sending build context to Docker daemon  27.79MB

Step 1/3 : FROM irssi_build_1:latest
 ---> 4f0304c6ee41
Step 2/3 : WORKDIR build
 ---> Using cache
 ---> 2292f6468857
Step 3/3 : RUN meson test
 ---> Using cache
 ---> 6530c31094ac
Successfully built 6530c31094ac
Successfully tagged irssi_test_1:latest
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Deploy)
[Pipeline] echo
Deploy
[Pipeline] sh
+ docker build -t irssi_deploy_1:latest . -f /var/jenkins_home/DockerFiles/DOCKER-IRSSI-DEPLOY
Sending build context to Docker daemon  27.79MB

Step 1/2 : FROM irssi_build_1:latest
 ---> 4f0304c6ee41
Step 2/2 : RUN ninja -C build install
 ---> Using cache
 ---> 68647a78d548
Successfully built 68647a78d548
Successfully tagged irssi_deploy_1:latest
[Pipeline] sh
+ docker run -t -d -e TERM=xterm --name irssi_deploy_21 -v vol_out_irssi:/vol_out_irssi irssi_deploy_1:latest
4b1eb718040fd4c61af813bdf4a535784e68ef157103d69f9520c22318e97d4d
[Pipeline] sh
+ docker exec irssi_deploy_21 irssi
[?1049h[22;0;0t[?1h=[?25l[24;1H[K[K[K[37m[44m[1;1H [79b[1;1H[24;1H[?12l[?25h(B[m[24m[27m[23m[?25l[2;1H09:15 [34m[1m-(B[m[24m[27m[23m![34m[1m-(B[m[24m[27m[23m  ___           _[K[3;1H09:15 [34m[1m-(B[m[24m[27m[23m![34m[1m-(B[m[24m[27m[23m |_ _|_ _ _____(_)[K[4;1H09:15 [34m[1m-(B[m[24m[27m[23m![34m[1m-(B[m[24m[27m[23m  | || '_(_-<_-< |[K[5;1H09:15 [34m[1m-(B[m[24m[27m[23m![34m[1m-(B[m[24m[27m[23m |___|_| /__/__/_|[K[6;1H09:15 [34m[1m-(B[m[24m[27m[23m![34m[1m-(B[m[24m[27m[23m Irssi v1.3.2 - https://irssi.org[K[7;1H09:15 [34m[1m-(B[m[24m[27m[23m![34m[1m-(B[m[24m[27m[23m - - - - - - - - - - - - - - - - - - - - - - - - - - - -[K[8;1H09:15 [34m[1m-(B[m[24m[27m[23m![34m[1m-(B[m[24m[27m[23m Hi there! If this is your first time using Irssi, you[K[9;1H09:15 [34m[1m-(B[m[24m[27m[23m![34m[1m-(B[m[24m[27m[23m might want to go to our website and read the startup[K[10;1H09:15 [34m[1m-(B[m[24m[27m[23m![34m[1m-(B[m[24m[27m[23m documentation to get you going.[K[11;1H09:15 [34m[1m-(B[m[24m[27m[23m![34m[1m-(B[m[24m[27m[23m [K[12;1H09:15 [34m[1m-(B[m[24m[27m[23m![34m[1m-(B[m[24m[27m[23m Our community and staff are available to assist you or[K[13;1H09:15 [34m[1m-(B[m[24m[27m[23m![34m[1m-(B[m[24m[27m[23m to answer any questions you may have.[K[14;1H09:15 [34m[1m-(B[m[24m[27m[23m![34m[1m-(B[m[24m[27m[23m [K[15;1H09:15 [34m[1m-(B[m[24m[27m[23m![34m[1m-(B[m[24m[27m[23m Use the /HELP command to get detailed information about[K[16;1H09:15 [34m[1m-(B[m[24m[27m[23m![34m[1m-(B[m[24m[27m[23m the available commands.[K[17;1H09:15 [34m[1m-(B[m[24m[27m[23m![34m[1m-(B[m[24m[27m[23m - - - - - - - - - - - - - - - - - - - - - - - - - - - -[K[18;1H09:15 [34m[1m-(B[m[24m[27m[23m![34m[1m-(B[m[24m[27m[23m [1mIrssi:(B[m[24m[27m[23m The following settings were initialized[K[19;1H09:15                        real_name [1mroot(B[m[24m[27m[23m[K[20;1H09:15                        user_name [1mroot(B[m[24m[27m[23m[K[21;1H09:15                             nick [1mroot(B[m[24m[27m[23m[K[22;1H[K[24;1H[?12l[?25h[K[(status)] [K[K[37m[44m[?25l[1;1H [79b[1;1H Irssi v1.3.2 - https://irssi.org[23;1H [79b[23;1H [36m[[37m09:15[36m][37m [36m[][37m [36m[[37m1[36m][37m[23;80H [24;12H[?12l[?25h(B[m[24m[27m[23m(B[m[24m[27m[23m(B[m[24m[27m[23m[24;1H[?1049l[23;0;0t[?1l>
[Pipeline] sh
+ docker stop irssi_deploy_21
irssi_deploy_21
[Pipeline] sh
+ docker container rm irssi_deploy_21
irssi_deploy_21
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Publish)
[Pipeline] echo
Publish
[Pipeline] sh
+ docker build -t irssi_publish_1:latest . -f /var/jenkins_home/DockerFiles/DOCKER-IRSSI-PUBLISH
Sending build context to Docker daemon  27.79MB

Step 1/2 : FROM fedora:34
 ---> af70648d87b6
Step 2/2 : WORKDIR vol_out_irssi
 ---> Using cache
 ---> 42716308514a
Successfully built 42716308514a
Successfully tagged irssi_publish_1:latest
[Pipeline] sh
+ docker run -t -d --name irssi_publish_21 -v vol_out_irssi:/vol_out_irssi irssi_publish_1:latest
387f56c8b5aed7654cd8b4f67e16bd112598e6070dae067dad4a3e9b497b945d
[Pipeline] sh
+ docker exec irssi_publish_21 tar -czvf archive.tgz ./build
./build/
./build/docs/
./build/docs/help/
./build/meson-uninstalled/
./build/meson-uninstalled/irssi-1-uninstalled.pc
./build/.hgignore
./build/irssi/
./build/irssi/src
./build/irssi/irssi-config.h
./build/irssi/irssi-version.h
./build/meson-info/
./build/meson-info/meson-info.json
./build/meson-info/intro-installed.json
./build/meson-info/intro-buildsystem_files.json
./build/meson-info/intro-benchmarks.json
./build/meson-info/intro-projectinfo.json
./build/meson-info/intro-tests.json
./build/meson-info/intro-dependencies.json
./build/meson-info/intro-buildoptions.json
./build/meson-info/intro-targets.json
./build/.gitignore
./build/src/
./build/src/fe-common/
./build/src/fe-common/core/
./build/src/fe-common/core/libfe_common_core.a.p/
./build/src/fe-common/irc/
./build/src/fe-common/irc/dcc/
./build/src/fe-common/irc/dcc/libfe_irc_dcc.a.p/
./build/src/fe-common/irc/libfe_common_irc.a.p/
./build/src/fe-common/irc/notifylist/
./build/src/fe-common/irc/notifylist/libfe_irc_notifylist.a.p/
./build/src/core/
./build/src/core/libcore.a.p/
./build/src/irc/
./build/src/irc/core/
./build/src/irc/core/libirc_core.a.p/
./build/src/irc/dcc/
./build/src/irc/dcc/libirc_dcc.a.p/
./build/src/irc/flood/
./build/src/irc/flood/libirc_flood.a.p/
./build/src/irc/libirc.a.p/
./build/src/irc/notifylist/
./build/src/irc/notifylist/libirc_notifylist.a.p/
./build/src/lib-config/
./build/src/lib-config/libirssi_config.a.p/
./build/src/fe-text/
./build/src/fe-text/irssi.p/
./build/build.ninja
./build/compile_commands.json
./build/irssi-config.h
./build/themes/
./build/tests/
./build/tests/fe-common/
./build/tests/fe-common/core/
./build/tests/fe-common/core/test-formats.p/
./build/tests/irc/
./build/tests/irc/core/
./build/tests/irc/core/test-irc.p/
./build/tests/irc/core/test-channel-events.p/
./build/tests/irc/flood/
./build/tests/irc/flood/test-796.p/
./build/tests/fe-text/
./build/tests/fe-text/test-paste-join-multiline.p/
./build/build/
./build/build/docs/
./build/build/docs/help/
./build/build/meson-uninstalled/
./build/build/meson-uninstalled/irssi-1-uninstalled.pc
./build/build/.hgignore
./build/build/irssi/
./build/build/irssi/src
./build/build/irssi/irssi-config.h
./build/build/irssi/irssi-version.h
./build/build/meson-info/
./build/build/meson-info/meson-info.json
./build/build/meson-info/intro-installed.json
./build/build/meson-info/intro-buildsystem_files.json
./build/build/meson-info/intro-benchmarks.json
./build/build/meson-info/intro-projectinfo.json
./build/build/meson-info/intro-tests.json
./build/build/meson-info/intro-dependencies.json
./build/build/meson-info/intro-buildoptions.json
./build/build/meson-info/intro-targets.json
./build/build/.gitignore
./build/build/src/
./build/build/src/fe-common/
./build/build/src/fe-common/core/
./build/build/src/fe-common/core/libfe_common_core.a.p/
./build/build/src/fe-common/core/libfe_common_core.a.p/module-formats.c.o
./build/build/src/fe-common/core/libfe_common_core.a.p/windows-layout.c.o
./build/build/src/fe-common/core/libfe_common_core.a.p/fe-messages.c.o
./build/build/src/fe-common/core/libfe_common_core.a.p/fe-common-core.c.o
./build/build/src/fe-common/core/libfe_common_core.a.p/themes.c.o
./build/build/src/fe-common/core/libfe_common_core.a.p/printtext.c.o
./build/build/src/fe-common/core/libfe_common_core.a.p/chat-completion.c.o
./build/build/src/fe-common/core/libfe_common_core.a.p/fe-core-commands.c.o
./build/build/src/fe-common/core/libfe_common_core.a.p/window-activity.c.o
./build/build/src/fe-common/core/libfe_common_core.a.p/fe-ignore.c.o
./build/build/src/fe-common/core/libfe_common_core.a.p/fe-queries.c.o
./build/build/src/fe-common/core/libfe_common_core.a.p/fe-tls.c.o
./build/build/src/fe-common/core/libfe_common_core.a.p/fe-modules.c.o
./build/build/src/fe-common/core/libfe_common_core.a.p/window-items.c.o
./build/build/src/fe-common/core/libfe_common_core.a.p/fe-ignore-messages.c.o
./build/build/src/fe-common/core/libfe_common_core.a.p/fe-settings.c.o
./build/build/src/fe-common/core/libfe_common_core.a.p/command-history.c.o
./build/build/src/fe-common/core/libfe_common_core.a.p/fe-recode.c.o
./build/build/src/fe-common/core/libfe_common_core.a.p/fe-windows.c.o
./build/build/src/fe-common/core/libfe_common_core.a.p/formats.c.o
./build/build/src/fe-common/core/libfe_common_core.a.p/keyboard.c.o
./build/build/src/fe-common/core/libfe_common_core.a.p/completion.c.o
./build/build/src/fe-common/core/libfe_common_core.a.p/window-commands.c.o
./build/build/src/fe-common/core/libfe_common_core.a.p/hilight-text.c.o
./build/build/src/fe-common/core/libfe_common_core.a.p/fe-expandos.c.o
./build/build/src/fe-common/core/libfe_common_core.a.p/fe-help.c.o
./build/build/src/fe-common/core/libfe_common_core.a.p/fe-exec.c.o
./build/build/src/fe-common/core/libfe_common_core.a.p/fe-server.c.o
./build/build/src/fe-common/core/libfe_common_core.a.p/fe-log.c.o
./build/build/src/fe-common/core/libfe_common_core.a.p/fe-channels.c.o
./build/build/src/fe-common/core/libfe_common_core.a
./build/build/src/fe-common/irc/
./build/build/src/fe-common/irc/libfe_common_irc.a
./build/build/src/fe-common/irc/dcc/
./build/build/src/fe-common/irc/dcc/libfe_irc_dcc.a.p/
./build/build/src/fe-common/irc/dcc/libfe_irc_dcc.a.p/module-formats.c.o
./build/build/src/fe-common/irc/dcc/libfe_irc_dcc.a.p/fe-dcc.c.o
./build/build/src/fe-common/irc/dcc/libfe_irc_dcc.a.p/fe-dcc-server.c.o
./build/build/src/fe-common/irc/dcc/libfe_irc_dcc.a.p/fe-dcc-chat-messages.c.o
./build/build/src/fe-common/irc/dcc/libfe_irc_dcc.a.p/fe-dcc-chat.c.o
./build/build/src/fe-common/irc/dcc/libfe_irc_dcc.a.p/fe-dcc-get.c.o
./build/build/src/fe-common/irc/dcc/libfe_irc_dcc.a.p/fe-dcc-send.c.o
./build/build/src/fe-common/irc/dcc/libfe_irc_dcc.a
./build/build/src/fe-common/irc/libfe_common_irc.a.p/
./build/build/src/fe-common/irc/libfe_common_irc.a.p/module-formats.c.o
./build/build/src/fe-common/irc/libfe_common_irc.a.p/fe-irc-channels.c.o
./build/build/src/fe-common/irc/libfe_common_irc.a.p/fe-events-numeric.c.o
./build/build/src/fe-common/irc/libfe_common_irc.a.p/fe-cap.c.o
./build/build/src/fe-common/irc/libfe_common_irc.a.p/fe-events.c.o
./build/build/src/fe-common/irc/libfe_common_irc.a.p/irc-completion.c.o
./build/build/src/fe-common/irc/libfe_common_irc.a.p/fe-irc-messages.c.o
./build/build/src/fe-common/irc/libfe_common_irc.a.p/fe-irc-commands.c.o
./build/build/src/fe-common/irc/libfe_common_irc.a.p/fe-ircnet.c.o
./build/build/src/fe-common/irc/libfe_common_irc.a.p/fe-irc-queries.c.o
./build/build/src/fe-common/irc/libfe_common_irc.a.p/fe-netsplit.c.o
./build/build/src/fe-common/irc/libfe_common_irc.a.p/fe-common-irc.c.o
./build/build/src/fe-common/irc/libfe_common_irc.a.p/irc-modules.c.o
./build/build/src/fe-common/irc/libfe_common_irc.a.p/fe-whois.c.o
./build/build/src/fe-common/irc/libfe_common_irc.a.p/fe-netjoin.c.o
./build/build/src/fe-common/irc/libfe_common_irc.a.p/fe-irc-server.c.o
./build/build/src/fe-common/irc/libfe_common_irc.a.p/fe-ctcp.c.o
./build/build/src/fe-common/irc/libfe_common_irc.a.p/fe-sasl.c.o
./build/build/src/fe-common/irc/libfe_common_irc.a.p/fe-modes.c.o
./build/build/src/fe-common/irc/notifylist/
./build/build/src/fe-common/irc/notifylist/libfe_irc_notifylist.a
./build/build/src/fe-common/irc/notifylist/libfe_irc_notifylist.a.p/
./build/build/src/fe-common/irc/notifylist/libfe_irc_notifylist.a.p/module-formats.c.o
./build/build/src/fe-common/irc/notifylist/libfe_irc_notifylist.a.p/fe-notifylist.c.o
./build/build/src/core/
./build/build/src/core/libcore.a.p/
./build/build/src/core/libcore.a.p/channels-setup.c.o
./build/build/src/core/libcore.a.p/signals.c.o
./build/build/src/core/libcore.a.p/tls.c.o
./build/build/src/core/libcore.a.p/refstrings.c.o
./build/build/src/core/libcore.a.p/servers-setup.c.o
./build/build/src/core/libcore.a.p/log-away.c.o
./build/build/src/core/libcore.a.p/special-vars.c.o
./build/build/src/core/libcore.a.p/channels.c.o
./build/build/src/core/libcore.a.p/ignore.c.o
./build/build/src/core/libcore.a.p/line-split.c.o
./build/build/src/core/libcore.a.p/settings.c.o
./build/build/src/core/libcore.a.p/modules-load.c.o
./build/build/src/core/libcore.a.p/network.c.o
./build/build/src/core/libcore.a.p/commands.c.o
./build/build/src/core/libcore.a.p/args.c.o
./build/build/src/core/libcore.a.p/expandos.c.o
./build/build/src/core/libcore.a.p/net-sendbuffer.c.o
./build/build/src/core/libcore.a.p/write-buffer.c.o
./build/build/src/core/libcore.a.p/misc.c.o
./build/build/src/core/libcore.a.p/net-disconnect.c.o
./build/build/src/core/libcore.a.p/rawlog.c.o
./build/build/src/core/libcore.a.p/session.c.o
./build/build/src/core/libcore.a.p/utf8.c.o
./build/build/src/core/libcore.a.p/log.c.o
./build/build/src/core/libcore.a.p/modules.c.o
./build/build/src/core/libcore.a.p/masks.c.o
./build/build/src/core/libcore.a.p/wcwidth-wrapper.c.o
./build/build/src/core/libcore.a.p/core.c.o
./build/build/src/core/libcore.a.p/recode.c.o
./build/build/src/core/libcore.a.p/network-openssl.c.o
./build/build/src/core/libcore.a.p/wcwidth.c.o
./build/build/src/core/libcore.a.p/nickmatch-cache.c.o
./build/build/src/core/libcore.a.p/levels.c.o
./build/build/src/core/libcore.a.p/chatnets.c.o
./build/build/src/core/libcore.a.p/net-nonblock.c.o
./build/build/src/core/libcore.a.p/nicklist.c.o
./build/build/src/core/libcore.a.p/iregex-gregex.c.o
./build/build/src/core/libcore.a.p/servers-reconnect.c.o
./build/build/src/core/libcore.a.p/chat-protocols.c.o
./build/build/src/core/libcore.a.p/servers.c.o
./build/build/src/core/libcore.a.p/pidwait.c.o
./build/build/src/core/libcore.a.p/chat-commands.c.o
./build/build/src/core/libcore.a.p/queries.c.o
./build/build/src/core/libcore.a
./build/build/src/irc/
./build/build/src/irc/libirc.a
./build/build/src/irc/core/
./build/build/src/irc/core/libirc_core.a
./build/build/src/irc/core/libirc_core.a.p/
./build/build/src/irc/core/libirc_core.a.p/irc-queries.c.o
./build/build/src/irc/core/libirc_core.a.p/servers-idle.c.o
./build/build/src/irc/core/libirc_core.a.p/irc-servers-reconnect.c.o
./build/build/src/irc/core/libirc_core.a.p/irc-session.c.o
./build/build/src/irc/core/libirc_core.a.p/irc-servers.c.o
./build/build/src/irc/core/libirc_core.a.p/lag.c.o
./build/build/src/irc/core/libirc_core.a.p/channel-rejoin.c.o
./build/build/src/irc/core/libirc_core.a.p/irc-chatnets.c.o
./build/build/src/irc/core/libirc_core.a.p/channel-events.c.o
./build/build/src/irc/core/libirc_core.a.p/servers-redirect.c.o
./build/build/src/irc/core/libirc_core.a.p/irc.c.o
./build/build/src/irc/core/libirc_core.a.p/irc-cap.c.o
./build/build/src/irc/core/libirc_core.a.p/sasl.c.o
./build/build/src/irc/core/libirc_core.a.p/irc-channels.c.o
./build/build/src/irc/core/libirc_core.a.p/massjoin.c.o
./build/build/src/irc/core/libirc_core.a.p/irc-masks.c.o
./build/build/src/irc/core/libirc_core.a.p/modes.c.o
./build/build/src/irc/core/libirc_core.a.p/mode-lists.c.o
./build/build/src/irc/core/libirc_core.a.p/irc-commands.c.o
./build/build/src/irc/core/libirc_core.a.p/irc-nicklist.c.o
./build/build/src/irc/core/libirc_core.a.p/irc-servers-setup.c.o
./build/build/src/irc/core/libirc_core.a.p/bans.c.o
./build/build/src/irc/core/libirc_core.a.p/irc-core.c.o
./build/build/src/irc/core/libirc_core.a.p/channels-query.c.o
./build/build/src/irc/core/libirc_core.a.p/netsplit.c.o
./build/build/src/irc/core/libirc_core.a.p/ctcp.c.o
./build/build/src/irc/core/libirc_core.a.p/irc-channels-setup.c.o
./build/build/src/irc/core/libirc_core.a.p/irc-expandos.c.o
./build/build/src/irc/dcc/
./build/build/src/irc/dcc/libirc_dcc.a
./build/build/src/irc/dcc/libirc_dcc.a.p/
./build/build/src/irc/dcc/libirc_dcc.a.p/dcc-get.c.o
./build/build/src/irc/dcc/libirc_dcc.a.p/dcc-server.c.o
./build/build/src/irc/dcc/libirc_dcc.a.p/dcc-queue.c.o
./build/build/src/irc/dcc/libirc_dcc.a.p/dcc.c.o
./build/build/src/irc/dcc/libirc_dcc.a.p/dcc-autoget.c.o
./build/build/src/irc/dcc/libirc_dcc.a.p/dcc-chat.c.o
./build/build/src/irc/dcc/libirc_dcc.a.p/dcc-resume.c.o
./build/build/src/irc/dcc/libirc_dcc.a.p/dcc-send.c.o
./build/build/src/irc/flood/
./build/build/src/irc/flood/libirc_flood.a
./build/build/src/irc/flood/libirc_flood.a.p/
./build/build/src/irc/flood/libirc_flood.a.p/flood.c.o
./build/build/src/irc/flood/libirc_flood.a.p/autoignore.c.o
./build/build/src/irc/libirc.a.p/
./build/build/src/irc/libirc.a.p/irc.c.o
./build/build/src/irc/notifylist/
./build/build/src/irc/notifylist/libirc_notifylist.a
./build/build/src/irc/notifylist/libirc_notifylist.a.p/
./build/build/src/irc/notifylist/libirc_notifylist.a.p/notify-commands.c.o
./build/build/src/irc/notifylist/libirc_notifylist.a.p/notify-ison.c.o
./build/build/src/irc/notifylist/libirc_notifylist.a.p/notify-setup.c.o
./build/build/src/irc/notifylist/libirc_notifylist.a.p/notify-whois.c.o
./build/build/src/irc/notifylist/libirc_notifylist.a.p/notifylist.c.o
./build/build/src/lib-config/
./build/build/src/lib-config/libirssi_config.a.p/
./build/build/src/lib-config/libirssi_config.a.p/set.c.o
./build/build/src/lib-config/libirssi_config.a.p/parse.c.o
./build/build/src/lib-config/libirssi_config.a.p/write.c.o
./build/build/src/lib-config/libirssi_config.a.p/get.c.o
./build/build/src/lib-config/libirssi_config.a
./build/build/src/fe-text/
./build/build/src/fe-text/irssi
./build/build/src/fe-text/irssi.p/
./build/build/src/fe-text/irssi.p/module-formats.c.o
./build/build/src/fe-text/irssi.p/statusbar-config.c.o
./build/build/src/fe-text/irssi.p/textbuffer.c.o
./build/build/src/fe-text/irssi.p/textbuffer-view.c.o
./build/build/src/fe-text/irssi.p/textbuffer-commands.c.o
./build/build/src/fe-text/irssi.p/irssi.c.o
./build/build/src/fe-text/irssi.p/mainwindow-activity.c.o
./build/build/src/fe-text/irssi.p/mainwindows.c.o
./build/build/src/fe-text/irssi.p/term-terminfo.c.o
./build/build/src/fe-text/irssi.p/gui-windows.c.o
./build/build/src/fe-text/irssi.p/statusbar.c.o
./build/build/src/fe-text/irssi.p/term.c.o
./build/build/src/fe-text/irssi.p/gui-entry.c.o
./build/build/src/fe-text/irssi.p/gui-expandos.c.o
./build/build/src/fe-text/irssi.p/terminfo-core.c.o
./build/build/src/fe-text/irssi.p/lastlog.c.o
./build/build/src/fe-text/irssi.p/gui-readline.c.o
./build/build/src/fe-text/irssi.p/gui-printtext.c.o
./build/build/src/fe-text/irssi.p/mainwindows-layout.c.o
./build/build/src/fe-text/irssi.p/statusbar-items.c.o
./build/build/src/fe-text/irssi.p/textbuffer-formats.c.o
./build/build/default-config.h
./build/build/build.ninja
./build/build/compile_commands.json
./build/build/.ninja_deps
./build/build/irssi-config.h
./build/build/themes/
./build/build/tests/
./build/build/tests/fe-common/
./build/build/tests/fe-common/core/
./build/build/tests/fe-common/core/test-formats.p/
./build/build/tests/fe-common/core/test-formats.p/test-formats.c.o
./build/build/tests/fe-common/core/test-formats
./build/build/tests/irc/
./build/build/tests/irc/core/
./build/build/tests/irc/core/test-channel-events
./build/build/tests/irc/core/test-irc
./build/build/tests/irc/core/test-irc.p/
./build/build/tests/irc/core/test-irc.p/test-irc.c.o
./build/build/tests/irc/core/test-channel-events.p/
./build/build/tests/irc/core/test-channel-events.p/test-channel-events.c.o
./build/build/tests/irc/flood/
./build/build/tests/irc/flood/test-796.p/
./build/build/tests/irc/flood/test-796.p/test-796.c.o
./build/build/tests/irc/flood/test-796
./build/build/tests/fe-text/
./build/build/tests/fe-text/test-paste-join-multiline
./build/build/tests/fe-text/test-paste-join-multiline.p/
./build/build/tests/fe-text/test-paste-join-multiline.p/.._.._src_fe-text_gui-entry.c.o
./build/build/tests/fe-text/test-paste-join-multiline.p/.._.._src_fe-text_terminfo-core.c.o
./build/build/tests/fe-text/test-paste-join-multiline.p/.._.._src_fe-text_mainwindows.c.o
./build/build/tests/fe-text/test-paste-join-multiline.p/test-paste-join-multiline.c.o
./build/build/tests/fe-text/test-paste-join-multiline.p/.._.._src_fe-text_textbuffer.c.o
./build/build/tests/fe-text/test-paste-join-multiline.p/.._.._src_fe-text_gui-printtext.c.o
./build/build/tests/fe-text/test-paste-join-multiline.p/.._.._src_fe-text_gui-windows.c.o
./build/build/tests/fe-text/test-paste-join-multiline.p/.._.._src_fe-text_textbuffer-view.c.o
./build/build/tests/fe-text/test-paste-join-multiline.p/.._.._src_fe-text_textbuffer-formats.c.o
./build/build/tests/fe-text/test-paste-join-multiline.p/.._.._src_fe-text_term.c.o
./build/build/tests/fe-text/test-paste-join-multiline.p/.._.._src_fe-text_term-terminfo.c.o
./build/build/tests/fe-text/test-paste-join-multiline.p/mock-irssi.c.o
./build/build/scripts/
./build/build/irssi-version.h
./build/build/meson-private/
./build/build/meson-private/build.dat
./build/build/meson-private/sanitycheckc.c
./build/build/meson-private/sanitycheckc.exe
./build/build/meson-private/coredata.dat
./build/build/meson-private/cleantrees.dat
./build/build/meson-private/meson.lock
./build/build/meson-private/irssi-1.pc
./build/build/meson-private/meson_test_setup.dat
./build/build/meson-private/meson_benchmark_setup.dat
./build/build/meson-private/cmd_line.txt
./build/build/meson-private/install.dat
./build/build/default-theme.h
./build/build/.ninja_log
./build/build/meson-logs/
./build/build/meson-logs/meson-log.txt
./build/scripts/
./build/meson-private/
./build/meson-private/build.dat
./build/meson-private/sanitycheckc.c
./build/meson-private/sanitycheckc.exe
./build/meson-private/coredata.dat
./build/meson-private/cleantrees.dat
./build/meson-private/meson.lock
./build/meson-private/irssi-1.pc
./build/meson-private/meson_test_setup.dat
./build/meson-private/meson_benchmark_setup.dat
./build/meson-private/cmd_line.txt
./build/meson-private/install.dat
./build/build-irssi-super/
./build/build-irssi-super/docs/
./build/build-irssi-super/docs/help/
./build/build-irssi-super/meson-uninstalled/
./build/build-irssi-super/meson-uninstalled/irssi-1-uninstalled.pc
./build/build-irssi-super/.hgignore
./build/build-irssi-super/irssi/
./build/build-irssi-super/irssi/src
./build/build-irssi-super/irssi/irssi-config.h
./build/build-irssi-super/irssi/irssi-version.h
./build/build-irssi-super/meson-info/
./build/build-irssi-super/meson-info/meson-info.json
./build/build-irssi-super/meson-info/intro-installed.json
./build/build-irssi-super/meson-info/intro-buildsystem_files.json
./build/build-irssi-super/meson-info/intro-benchmarks.json
./build/build-irssi-super/meson-info/intro-projectinfo.json
./build/build-irssi-super/meson-info/intro-tests.json
./build/build-irssi-super/meson-info/intro-dependencies.json
./build/build-irssi-super/meson-info/intro-buildoptions.json
./build/build-irssi-super/meson-info/intro-targets.json
./build/build-irssi-super/.gitignore
./build/build-irssi-super/src/
./build/build-irssi-super/src/fe-common/
./build/build-irssi-super/src/fe-common/core/
./build/build-irssi-super/src/fe-common/core/libfe_common_core.a.p/
./build/build-irssi-super/src/fe-common/irc/
./build/build-irssi-super/src/fe-common/irc/dcc/
./build/build-irssi-super/src/fe-common/irc/dcc/libfe_irc_dcc.a.p/
./build/build-irssi-super/src/fe-common/irc/libfe_common_irc.a.p/
./build/build-irssi-super/src/fe-common/irc/notifylist/
./build/build-irssi-super/src/fe-common/irc/notifylist/libfe_irc_notifylist.a.p/
./build/build-irssi-super/src/core/
./build/build-irssi-super/src/core/libcore.a.p/
./build/build-irssi-super/src/irc/
./build/build-irssi-super/src/irc/core/
./build/build-irssi-super/src/irc/core/libirc_core.a.p/
./build/build-irssi-super/src/irc/dcc/
./build/build-irssi-super/src/irc/dcc/libirc_dcc.a.p/
./build/build-irssi-super/src/irc/flood/
./build/build-irssi-super/src/irc/flood/libirc_flood.a.p/
./build/build-irssi-super/src/irc/libirc.a.p/
./build/build-irssi-super/src/irc/notifylist/
./build/build-irssi-super/src/irc/notifylist/libirc_notifylist.a.p/
./build/build-irssi-super/src/lib-config/
./build/build-irssi-super/src/lib-config/libirssi_config.a.p/
./build/build-irssi-super/src/fe-text/
./build/build-irssi-super/src/fe-text/irssi.p/
./build/build-irssi-super/build.ninja
./build/build-irssi-super/compile_commands.json
./build/build-irssi-super/irssi-config.h
./build/build-irssi-super/themes/
./build/build-irssi-super/tests/
./build/build-irssi-super/tests/fe-common/
./build/build-irssi-super/tests/fe-common/core/
./build/build-irssi-super/tests/fe-common/core/test-formats.p/
./build/build-irssi-super/tests/irc/
./build/build-irssi-super/tests/irc/core/
./build/build-irssi-super/tests/irc/core/test-irc.p/
./build/build-irssi-super/tests/irc/core/test-channel-events.p/
./build/build-irssi-super/tests/irc/flood/
./build/build-irssi-super/tests/irc/flood/test-796.p/
./build/build-irssi-super/tests/fe-text/
./build/build-irssi-super/tests/fe-text/test-paste-join-multiline.p/
./build/build-irssi-super/build/
./build/build-irssi-super/build/docs/
./build/build-irssi-super/build/docs/help/
./build/build-irssi-super/build/meson-uninstalled/
./build/build-irssi-super/build/meson-uninstalled/irssi-1-uninstalled.pc
./build/build-irssi-super/build/.hgignore
./build/build-irssi-super/build/irssi/
./build/build-irssi-super/build/irssi/src
./build/build-irssi-super/build/irssi/irssi-config.h
./build/build-irssi-super/build/irssi/irssi-version.h
./build/build-irssi-super/build/meson-info/
./build/build-irssi-super/build/meson-info/meson-info.json
./build/build-irssi-super/build/meson-info/intro-installed.json
./build/build-irssi-super/build/meson-info/intro-buildsystem_files.json
./build/build-irssi-super/build/meson-info/intro-benchmarks.json
./build/build-irssi-super/build/meson-info/intro-projectinfo.json
./build/build-irssi-super/build/meson-info/intro-tests.json
./build/build-irssi-super/build/meson-info/intro-dependencies.json
./build/build-irssi-super/build/meson-info/intro-buildoptions.json
./build/build-irssi-super/build/meson-info/intro-targets.json
./build/build-irssi-super/build/.gitignore
./build/build-irssi-super/build/src/
./build/build-irssi-super/build/src/fe-common/
./build/build-irssi-super/build/src/fe-common/core/
./build/build-irssi-super/build/src/fe-common/core/libfe_common_core.a.p/
./build/build-irssi-super/build/src/fe-common/core/libfe_common_core.a.p/module-formats.c.o
./build/build-irssi-super/build/src/fe-common/core/libfe_common_core.a.p/windows-layout.c.o
./build/build-irssi-super/build/src/fe-common/core/libfe_common_core.a.p/fe-messages.c.o
./build/build-irssi-super/build/src/fe-common/core/libfe_common_core.a.p/fe-common-core.c.o
./build/build-irssi-super/build/src/fe-common/core/libfe_common_core.a.p/themes.c.o
./build/build-irssi-super/build/src/fe-common/core/libfe_common_core.a.p/printtext.c.o
./build/build-irssi-super/build/src/fe-common/core/libfe_common_core.a.p/chat-completion.c.o
./build/build-irssi-super/build/src/fe-common/core/libfe_common_core.a.p/fe-core-commands.c.o
./build/build-irssi-super/build/src/fe-common/core/libfe_common_core.a.p/window-activity.c.o
./build/build-irssi-super/build/src/fe-common/core/libfe_common_core.a.p/fe-ignore.c.o
./build/build-irssi-super/build/src/fe-common/core/libfe_common_core.a.p/fe-queries.c.o
./build/build-irssi-super/build/src/fe-common/core/libfe_common_core.a.p/fe-tls.c.o
./build/build-irssi-super/build/src/fe-common/core/libfe_common_core.a.p/fe-modules.c.o
./build/build-irssi-super/build/src/fe-common/core/libfe_common_core.a.p/window-items.c.o
./build/build-irssi-super/build/src/fe-common/core/libfe_common_core.a.p/fe-ignore-messages.c.o
./build/build-irssi-super/build/src/fe-common/core/libfe_common_core.a.p/fe-settings.c.o
./build/build-irssi-super/build/src/fe-common/core/libfe_common_core.a.p/command-history.c.o
./build/build-irssi-super/build/src/fe-common/core/libfe_common_core.a.p/fe-recode.c.o
./build/build-irssi-super/build/src/fe-common/core/libfe_common_core.a.p/fe-windows.c.o
./build/build-irssi-super/build/src/fe-common/core/libfe_common_core.a.p/formats.c.o
./build/build-irssi-super/build/src/fe-common/core/libfe_common_core.a.p/keyboard.c.o
./build/build-irssi-super/build/src/fe-common/core/libfe_common_core.a.p/completion.c.o
./build/build-irssi-super/build/src/fe-common/core/libfe_common_core.a.p/window-commands.c.o
./build/build-irssi-super/build/src/fe-common/core/libfe_common_core.a.p/hilight-text.c.o
./build/build-irssi-super/build/src/fe-common/core/libfe_common_core.a.p/fe-expandos.c.o
./build/build-irssi-super/build/src/fe-common/core/libfe_common_core.a.p/fe-help.c.o
./build/build-irssi-super/build/src/fe-common/core/libfe_common_core.a.p/fe-exec.c.o
./build/build-irssi-super/build/src/fe-common/core/libfe_common_core.a.p/fe-server.c.o
./build/build-irssi-super/build/src/fe-common/core/libfe_common_core.a.p/fe-log.c.o
./build/build-irssi-super/build/src/fe-common/core/libfe_common_core.a.p/fe-channels.c.o
./build/build-irssi-super/build/src/fe-common/core/libfe_common_core.a
./build/build-irssi-super/build/src/fe-common/irc/
./build/build-irssi-super/build/src/fe-common/irc/libfe_common_irc.a
./build/build-irssi-super/build/src/fe-common/irc/dcc/
./build/build-irssi-super/build/src/fe-common/irc/dcc/libfe_irc_dcc.a.p/
./build/build-irssi-super/build/src/fe-common/irc/dcc/libfe_irc_dcc.a.p/module-formats.c.o
./build/build-irssi-super/build/src/fe-common/irc/dcc/libfe_irc_dcc.a.p/fe-dcc.c.o
./build/build-irssi-super/build/src/fe-common/irc/dcc/libfe_irc_dcc.a.p/fe-dcc-server.c.o
./build/build-irssi-super/build/src/fe-common/irc/dcc/libfe_irc_dcc.a.p/fe-dcc-chat-messages.c.o
./build/build-irssi-super/build/src/fe-common/irc/dcc/libfe_irc_dcc.a.p/fe-dcc-chat.c.o
./build/build-irssi-super/build/src/fe-common/irc/dcc/libfe_irc_dcc.a.p/fe-dcc-get.c.o
./build/build-irssi-super/build/src/fe-common/irc/dcc/libfe_irc_dcc.a.p/fe-dcc-send.c.o
./build/build-irssi-super/build/src/fe-common/irc/dcc/libfe_irc_dcc.a
./build/build-irssi-super/build/src/fe-common/irc/libfe_common_irc.a.p/
./build/build-irssi-super/build/src/fe-common/irc/libfe_common_irc.a.p/module-formats.c.o
./build/build-irssi-super/build/src/fe-common/irc/libfe_common_irc.a.p/fe-irc-channels.c.o
./build/build-irssi-super/build/src/fe-common/irc/libfe_common_irc.a.p/fe-events-numeric.c.o
./build/build-irssi-super/build/src/fe-common/irc/libfe_common_irc.a.p/fe-cap.c.o
./build/build-irssi-super/build/src/fe-common/irc/libfe_common_irc.a.p/fe-events.c.o
./build/build-irssi-super/build/src/fe-common/irc/libfe_common_irc.a.p/irc-completion.c.o
./build/build-irssi-super/build/src/fe-common/irc/libfe_common_irc.a.p/fe-irc-messages.c.o
./build/build-irssi-super/build/src/fe-common/irc/libfe_common_irc.a.p/fe-irc-commands.c.o
./build/build-irssi-super/build/src/fe-common/irc/libfe_common_irc.a.p/fe-ircnet.c.o
./build/build-irssi-super/build/src/fe-common/irc/libfe_common_irc.a.p/fe-irc-queries.c.o
./build/build-irssi-super/build/src/fe-common/irc/libfe_common_irc.a.p/fe-netsplit.c.o
./build/build-irssi-super/build/src/fe-common/irc/libfe_common_irc.a.p/fe-common-irc.c.o
./build/build-irssi-super/build/src/fe-common/irc/libfe_common_irc.a.p/irc-modules.c.o
./build/build-irssi-super/build/src/fe-common/irc/libfe_common_irc.a.p/fe-whois.c.o
./build/build-irssi-super/build/src/fe-common/irc/libfe_common_irc.a.p/fe-netjoin.c.o
./build/build-irssi-super/build/src/fe-common/irc/libfe_common_irc.a.p/fe-irc-server.c.o
./build/build-irssi-super/build/src/fe-common/irc/libfe_common_irc.a.p/fe-ctcp.c.o
./build/build-irssi-super/build/src/fe-common/irc/libfe_common_irc.a.p/fe-sasl.c.o
./build/build-irssi-super/build/src/fe-common/irc/libfe_common_irc.a.p/fe-modes.c.o
./build/build-irssi-super/build/src/fe-common/irc/notifylist/
./build/build-irssi-super/build/src/fe-common/irc/notifylist/libfe_irc_notifylist.a
./build/build-irssi-super/build/src/fe-common/irc/notifylist/libfe_irc_notifylist.a.p/
./build/build-irssi-super/build/src/fe-common/irc/notifylist/libfe_irc_notifylist.a.p/module-formats.c.o
./build/build-irssi-super/build/src/fe-common/irc/notifylist/libfe_irc_notifylist.a.p/fe-notifylist.c.o
./build/build-irssi-super/build/src/core/
./build/build-irssi-super/build/src/core/libcore.a.p/
./build/build-irssi-super/build/src/core/libcore.a.p/channels-setup.c.o
./build/build-irssi-super/build/src/core/libcore.a.p/signals.c.o
./build/build-irssi-super/build/src/core/libcore.a.p/tls.c.o
./build/build-irssi-super/build/src/core/libcore.a.p/refstrings.c.o
./build/build-irssi-super/build/src/core/libcore.a.p/servers-setup.c.o
./build/build-irssi-super/build/src/core/libcore.a.p/log-away.c.o
./build/build-irssi-super/build/src/core/libcore.a.p/special-vars.c.o
./build/build-irssi-super/build/src/core/libcore.a.p/channels.c.o
./build/build-irssi-super/build/src/core/libcore.a.p/ignore.c.o
./build/build-irssi-super/build/src/core/libcore.a.p/line-split.c.o
./build/build-irssi-super/build/src/core/libcore.a.p/settings.c.o
./build/build-irssi-super/build/src/core/libcore.a.p/modules-load.c.o
./build/build-irssi-super/build/src/core/libcore.a.p/network.c.o
./build/build-irssi-super/build/src/core/libcore.a.p/commands.c.o
./build/build-irssi-super/build/src/core/libcore.a.p/args.c.o
./build/build-irssi-super/build/src/core/libcore.a.p/expandos.c.o
./build/build-irssi-super/build/src/core/libcore.a.p/net-sendbuffer.c.o
./build/build-irssi-super/build/src/core/libcore.a.p/write-buffer.c.o
./build/build-irssi-super/build/src/core/libcore.a.p/misc.c.o
./build/build-irssi-super/build/src/core/libcore.a.p/net-disconnect.c.o
./build/build-irssi-super/build/src/core/libcore.a.p/rawlog.c.o
./build/build-irssi-super/build/src/core/libcore.a.p/session.c.o
./build/build-irssi-super/build/src/core/libcore.a.p/utf8.c.o
./build/build-irssi-super/build/src/core/libcore.a.p/log.c.o
./build/build-irssi-super/build/src/core/libcore.a.p/modules.c.o
./build/build-irssi-super/build/src/core/libcore.a.p/masks.c.o
./build/build-irssi-super/build/src/core/libcore.a.p/wcwidth-wrapper.c.o
./build/build-irssi-super/build/src/core/libcore.a.p/core.c.o
./build/build-irssi-super/build/src/core/libcore.a.p/recode.c.o
./build/build-irssi-super/build/src/core/libcore.a.p/network-openssl.c.o
./build/build-irssi-super/build/src/core/libcore.a.p/wcwidth.c.o
./build/build-irssi-super/build/src/core/libcore.a.p/nickmatch-cache.c.o
./build/build-irssi-super/build/src/core/libcore.a.p/levels.c.o
./build/build-irssi-super/build/src/core/libcore.a.p/chatnets.c.o
./build/build-irssi-super/build/src/core/libcore.a.p/net-nonblock.c.o
./build/build-irssi-super/build/src/core/libcore.a.p/nicklist.c.o
./build/build-irssi-super/build/src/core/libcore.a.p/iregex-gregex.c.o
./build/build-irssi-super/build/src/core/libcore.a.p/servers-reconnect.c.o
./build/build-irssi-super/build/src/core/libcore.a.p/chat-protocols.c.o
./build/build-irssi-super/build/src/core/libcore.a.p/servers.c.o
./build/build-irssi-super/build/src/core/libcore.a.p/pidwait.c.o
./build/build-irssi-super/build/src/core/libcore.a.p/chat-commands.c.o
./build/build-irssi-super/build/src/core/libcore.a.p/queries.c.o
./build/build-irssi-super/build/src/core/libcore.a
./build/build-irssi-super/build/src/irc/
./build/build-irssi-super/build/src/irc/libirc.a
./build/build-irssi-super/build/src/irc/core/
./build/build-irssi-super/build/src/irc/core/libirc_core.a
./build/build-irssi-super/build/src/irc/core/libirc_core.a.p/
./build/build-irssi-super/build/src/irc/core/libirc_core.a.p/irc-queries.c.o
./build/build-irssi-super/build/src/irc/core/libirc_core.a.p/servers-idle.c.o
./build/build-irssi-super/build/src/irc/core/libirc_core.a.p/irc-servers-reconnect.c.o
./build/build-irssi-super/build/src/irc/core/libirc_core.a.p/irc-session.c.o
./build/build-irssi-super/build/src/irc/core/libirc_core.a.p/irc-servers.c.o
./build/build-irssi-super/build/src/irc/core/libirc_core.a.p/lag.c.o
./build/build-irssi-super/build/src/irc/core/libirc_core.a.p/channel-rejoin.c.o
./build/build-irssi-super/build/src/irc/core/libirc_core.a.p/irc-chatnets.c.o
./build/build-irssi-super/build/src/irc/core/libirc_core.a.p/channel-events.c.o
./build/build-irssi-super/build/src/irc/core/libirc_core.a.p/servers-redirect.c.o
./build/build-irssi-super/build/src/irc/core/libirc_core.a.p/irc.c.o
./build/build-irssi-super/build/src/irc/core/libirc_core.a.p/irc-cap.c.o
./build/build-irssi-super/build/src/irc/core/libirc_core.a.p/sasl.c.o
./build/build-irssi-super/build/src/irc/core/libirc_core.a.p/irc-channels.c.o
./build/build-irssi-super/build/src/irc/core/libirc_core.a.p/massjoin.c.o
./build/build-irssi-super/build/src/irc/core/libirc_core.a.p/irc-masks.c.o
./build/build-irssi-super/build/src/irc/core/libirc_core.a.p/modes.c.o
./build/build-irssi-super/build/src/irc/core/libirc_core.a.p/mode-lists.c.o
./build/build-irssi-super/build/src/irc/core/libirc_core.a.p/irc-commands.c.o
./build/build-irssi-super/build/src/irc/core/libirc_core.a.p/irc-nicklist.c.o
./build/build-irssi-super/build/src/irc/core/libirc_core.a.p/irc-servers-setup.c.o
./build/build-irssi-super/build/src/irc/core/libirc_core.a.p/bans.c.o
./build/build-irssi-super/build/src/irc/core/libirc_core.a.p/irc-core.c.o
./build/build-irssi-super/build/src/irc/core/libirc_core.a.p/channels-query.c.o
./build/build-irssi-super/build/src/irc/core/libirc_core.a.p/netsplit.c.o
./build/build-irssi-super/build/src/irc/core/libirc_core.a.p/ctcp.c.o
./build/build-irssi-super/build/src/irc/core/libirc_core.a.p/irc-channels-setup.c.o
./build/build-irssi-super/build/src/irc/core/libirc_core.a.p/irc-expandos.c.o
./build/build-irssi-super/build/src/irc/dcc/
./build/build-irssi-super/build/src/irc/dcc/libirc_dcc.a
./build/build-irssi-super/build/src/irc/dcc/libirc_dcc.a.p/
./build/build-irssi-super/build/src/irc/dcc/libirc_dcc.a.p/dcc-get.c.o
./build/build-irssi-super/build/src/irc/dcc/libirc_dcc.a.p/dcc-server.c.o
./build/build-irssi-super/build/src/irc/dcc/libirc_dcc.a.p/dcc-queue.c.o
./build/build-irssi-super/build/src/irc/dcc/libirc_dcc.a.p/dcc.c.o
./build/build-irssi-super/build/src/irc/dcc/libirc_dcc.a.p/dcc-autoget.c.o
./build/build-irssi-super/build/src/irc/dcc/libirc_dcc.a.p/dcc-chat.c.o
./build/build-irssi-super/build/src/irc/dcc/libirc_dcc.a.p/dcc-resume.c.o
./build/build-irssi-super/build/src/irc/dcc/libirc_dcc.a.p/dcc-send.c.o
./build/build-irssi-super/build/src/irc/flood/
./build/build-irssi-super/build/src/irc/flood/libirc_flood.a
./build/build-irssi-super/build/src/irc/flood/libirc_flood.a.p/
./build/build-irssi-super/build/src/irc/flood/libirc_flood.a.p/flood.c.o
./build/build-irssi-super/build/src/irc/flood/libirc_flood.a.p/autoignore.c.o
./build/build-irssi-super/build/src/irc/libirc.a.p/
./build/build-irssi-super/build/src/irc/libirc.a.p/irc.c.o
./build/build-irssi-super/build/src/irc/notifylist/
./build/build-irssi-super/build/src/irc/notifylist/libirc_notifylist.a
./build/build-irssi-super/build/src/irc/notifylist/libirc_notifylist.a.p/
./build/build-irssi-super/build/src/irc/notifylist/libirc_notifylist.a.p/notify-commands.c.o
./build/build-irssi-super/build/src/irc/notifylist/libirc_notifylist.a.p/notify-ison.c.o
./build/build-irssi-super/build/src/irc/notifylist/libirc_notifylist.a.p/notify-setup.c.o
./build/build-irssi-super/build/src/irc/notifylist/libirc_notifylist.a.p/notify-whois.c.o
./build/build-irssi-super/build/src/irc/notifylist/libirc_notifylist.a.p/notifylist.c.o
./build/build-irssi-super/build/src/lib-config/
./build/build-irssi-super/build/src/lib-config/libirssi_config.a.p/
./build/build-irssi-super/build/src/lib-config/libirssi_config.a.p/set.c.o
./build/build-irssi-super/build/src/lib-config/libirssi_config.a.p/parse.c.o
./build/build-irssi-super/build/src/lib-config/libirssi_config.a.p/write.c.o
./build/build-irssi-super/build/src/lib-config/libirssi_config.a.p/get.c.o
./build/build-irssi-super/build/src/lib-config/libirssi_config.a
./build/build-irssi-super/build/src/fe-text/
./build/build-irssi-super/build/src/fe-text/irssi
./build/build-irssi-super/build/src/fe-text/irssi.p/
./build/build-irssi-super/build/src/fe-text/irssi.p/module-formats.c.o
./build/build-irssi-super/build/src/fe-text/irssi.p/statusbar-config.c.o
./build/build-irssi-super/build/src/fe-text/irssi.p/textbuffer.c.o
./build/build-irssi-super/build/src/fe-text/irssi.p/textbuffer-view.c.o
./build/build-irssi-super/build/src/fe-text/irssi.p/textbuffer-commands.c.o
./build/build-irssi-super/build/src/fe-text/irssi.p/irssi.c.o
./build/build-irssi-super/build/src/fe-text/irssi.p/mainwindow-activity.c.o
./build/build-irssi-super/build/src/fe-text/irssi.p/mainwindows.c.o
./build/build-irssi-super/build/src/fe-text/irssi.p/term-terminfo.c.o
./build/build-irssi-super/build/src/fe-text/irssi.p/gui-windows.c.o
./build/build-irssi-super/build/src/fe-text/irssi.p/statusbar.c.o
./build/build-irssi-super/build/src/fe-text/irssi.p/term.c.o
./build/build-irssi-super/build/src/fe-text/irssi.p/gui-entry.c.o
./build/build-irssi-super/build/src/fe-text/irssi.p/gui-expandos.c.o
./build/build-irssi-super/build/src/fe-text/irssi.p/terminfo-core.c.o
./build/build-irssi-super/build/src/fe-text/irssi.p/lastlog.c.o
./build/build-irssi-super/build/src/fe-text/irssi.p/gui-readline.c.o
./build/build-irssi-super/build/src/fe-text/irssi.p/gui-printtext.c.o
./build/build-irssi-super/build/src/fe-text/irssi.p/mainwindows-layout.c.o
./build/build-irssi-super/build/src/fe-text/irssi.p/statusbar-items.c.o
./build/build-irssi-super/build/src/fe-text/irssi.p/textbuffer-formats.c.o
./build/build-irssi-super/build/default-config.h
./build/build-irssi-super/build/build.ninja
./build/build-irssi-super/build/compile_commands.json
./build/build-irssi-super/build/.ninja_deps
./build/build-irssi-super/build/irssi-config.h
./build/build-irssi-super/build/themes/
./build/build-irssi-super/build/tests/
./build/build-irssi-super/build/tests/fe-common/
./build/build-irssi-super/build/tests/fe-common/core/
./build/build-irssi-super/build/tests/fe-common/core/test-formats.p/
./build/build-irssi-super/build/tests/fe-common/core/test-formats.p/test-formats.c.o
./build/build-irssi-super/build/tests/fe-common/core/test-formats
./build/build-irssi-super/build/tests/irc/
./build/build-irssi-super/build/tests/irc/core/
./build/build-irssi-super/build/tests/irc/core/test-channel-events
./build/build-irssi-super/build/tests/irc/core/test-irc
./build/build-irssi-super/build/tests/irc/core/test-irc.p/
./build/build-irssi-super/build/tests/irc/core/test-irc.p/test-irc.c.o
./build/build-irssi-super/build/tests/irc/core/test-channel-events.p/
./build/build-irssi-super/build/tests/irc/core/test-channel-events.p/test-channel-events.c.o
./build/build-irssi-super/build/tests/irc/flood/
./build/build-irssi-super/build/tests/irc/flood/test-796.p/
./build/build-irssi-super/build/tests/irc/flood/test-796.p/test-796.c.o
./build/build-irssi-super/build/tests/irc/flood/test-796
./build/build-irssi-super/build/tests/fe-text/
./build/build-irssi-super/build/tests/fe-text/test-paste-join-multiline
./build/build-irssi-super/build/tests/fe-text/test-paste-join-multiline.p/
./build/build-irssi-super/build/tests/fe-text/test-paste-join-multiline.p/.._.._src_fe-text_gui-entry.c.o
./build/build-irssi-super/build/tests/fe-text/test-paste-join-multiline.p/.._.._src_fe-text_terminfo-core.c.o
./build/build-irssi-super/build/tests/fe-text/test-paste-join-multiline.p/.._.._src_fe-text_mainwindows.c.o
./build/build-irssi-super/build/tests/fe-text/test-paste-join-multiline.p/test-paste-join-multiline.c.o
./build/build-irssi-super/build/tests/fe-text/test-paste-join-multiline.p/.._.._src_fe-text_textbuffer.c.o
./build/build-irssi-super/build/tests/fe-text/test-paste-join-multiline.p/.._.._src_fe-text_gui-printtext.c.o
./build/build-irssi-super/build/tests/fe-text/test-paste-join-multiline.p/.._.._src_fe-text_gui-windows.c.o
./build/build-irssi-super/build/tests/fe-text/test-paste-join-multiline.p/.._.._src_fe-text_textbuffer-view.c.o
./build/build-irssi-super/build/tests/fe-text/test-paste-join-multiline.p/.._.._src_fe-text_textbuffer-formats.c.o
./build/build-irssi-super/build/tests/fe-text/test-paste-join-multiline.p/.._.._src_fe-text_term.c.o
./build/build-irssi-super/build/tests/fe-text/test-paste-join-multiline.p/.._.._src_fe-text_term-terminfo.c.o
./build/build-irssi-super/build/tests/fe-text/test-paste-join-multiline.p/mock-irssi.c.o
./build/build-irssi-super/build/scripts/
./build/build-irssi-super/build/irssi-version.h
./build/build-irssi-super/build/meson-private/
./build/build-irssi-super/build/meson-private/build.dat
./build/build-irssi-super/build/meson-private/sanitycheckc.c
./build/build-irssi-super/build/meson-private/sanitycheckc.exe
./build/build-irssi-super/build/meson-private/coredata.dat
./build/build-irssi-super/build/meson-private/cleantrees.dat
./build/build-irssi-super/build/meson-private/meson.lock
./build/build-irssi-super/build/meson-private/irssi-1.pc
./build/build-irssi-super/build/meson-private/meson_test_setup.dat
./build/build-irssi-super/build/meson-private/meson_benchmark_setup.dat
./build/build-irssi-super/build/meson-private/cmd_line.txt
./build/build-irssi-super/build/meson-private/install.dat
./build/build-irssi-super/build/default-theme.h
./build/build-irssi-super/build/.ninja_log
./build/build-irssi-super/build/meson-logs/
./build/build-irssi-super/build/meson-logs/meson-log.txt
./build/build-irssi-super/scripts/
./build/build-irssi-super/meson-private/
./build/build-irssi-super/meson-private/build.dat
./build/build-irssi-super/meson-private/sanitycheckc.c
./build/build-irssi-super/meson-private/sanitycheckc.exe
./build/build-irssi-super/meson-private/coredata.dat
./build/build-irssi-super/meson-private/cleantrees.dat
./build/build-irssi-super/meson-private/meson.lock
./build/build-irssi-super/meson-private/irssi-1.pc
./build/build-irssi-super/meson-private/meson_test_setup.dat
./build/build-irssi-super/meson-private/meson_benchmark_setup.dat
./build/build-irssi-super/meson-private/cmd_line.txt
./build/build-irssi-super/meson-private/install.dat
./build/build-irssi-super/meson-logs/
./build/build-irssi-super/meson-logs/meson-log.txt
./build/meson-logs/
./build/meson-logs/meson-log.txt
[Pipeline] sh
+ docker stop irssi_publish_21
irssi_publish_21
[Pipeline] sh
+ docker container rm irssi_publish_21
irssi_publish_21
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS
```