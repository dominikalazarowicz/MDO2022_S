# Lab 4

- Po stworzeniu folderu Lab04 w odpowiednim folderze stworzylem woluminy uzywajac  polecen `docker volume create`

![fota](volumecreated.png)

![fota](volumedocker/png)

- uruchomilem kontener oraz zainstalowalem potrzebne dependency

![fota](dependency.png)

- na wolumin `volumein` sklonowalem repo, a następnie przy uzyciu `meson setup` zbudowałem je w voluminie `volumeout`

![fota](repowvolume.png)

![fota](build.png)

![fota](build2.png)

- przy uzyciu `yum install -y iperf3` zainstalowalem na dwoch kontenerach iperf3, na windowie uzylem windowsowego klienta i polaczylem sie z serwerem w kontenerze po uprzednim odpaleniu kontenera serwerowego z przekierowaniem portow oraz osobnym przekierowaniem na wirtualnej maszynie:

![fota](iperf1.png)

![fota](iperf.png)

Nie pobieralem loga z serwera, przepustowosci, gdyż widać ją
na screenach:

![fota](iperf2.png)

![fota](iperf3.png)

- Zapoznalem się z dokumentacją jenkinsa. Większość użytych przeze mnie poleceń na screenach jest przekopiowana z dokumentacji.

- stworzyłem siec dla jenkinsa

![fota](jenkinscreate.png)

- pobrałem dind

![fota](dind.png)

- wykonalem polecenie docker run z dokumentacji Jenkins

![fota](run.png)

- stworzyłem dockerfile takze z dokumentacji

![fota](dockerfile.png)

- następnie build oraz run

![fota](jenkinsbuild.png)

![fota](jenkinsrun.png)

- Jenkins smiga w przeglądarce na porcie 8080:

![fota](jenkinssmiga.png)

- Aby zalogowac sie na jenkinsa wyciagnalem haslo z kontenera:

![fota](haslo.png)

![fota](haslodziala.png)
