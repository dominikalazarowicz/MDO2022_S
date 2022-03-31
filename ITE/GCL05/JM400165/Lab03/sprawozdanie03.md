# Docker files, kontener jako definicja etapu - Jakub Michalik


## Oprogramowanie

1.Jako iż ciężko było znaleźć odpowiednie repozytorium do tego laboratorium, wybrane początkowo
z react po kilkunastu próbach nie działało, wybrano więc https://github.com/spring-projects/spring-petclinic

2.Sklonowano repozytorium poleceniem "git clone https://github.com/spring-projects/spring-petclinic

![](./screeny/gitclone.PNG)

3.Następnym krokiem było zainstalowanie niezbędnych narzędzi poleceniami:

"sudo apt install maven" oraz "sudo apt install default-jdk"

W związku z tym iż była to już kolejna próba wykonania ćwiczenia, maszyna "pokazała", że te usługi są
już zainstalowane

![](./screeny/install.PNG)

4.Potem nastąpiło zbudowanie i przetestowanie poleceniami:

"./mvnw install -DskipTests" oraz "./mvnw test"

![](./screeny/mbuild1.PNG)
![](./screeny/mbuild2.PNG)

![](./screeny/mtest1.PNG)
![](./screeny/mtest2.PNG)


## Działania w kontenerze

5.Uruchomiono kontener, podłączono TTY, oraz zainstalowano gita poleceniem "apk add git"

![](./screeny/containerON.PNG)

6.Sklonowano repozytorium poleceniem "git clone" oraz zbudowano poleceniem jak wcześniej

![](./screeny/dockergitcloneandTest.PNG)
![](./screeny/dockerTestbuild.PNG)

7.Uruchomiono testy poleceniem "./mvwn test"

![](./screeny/dtest1.PNG)
![](./screeny/dtest2.PNG)

8.Stworzono plik dck_builder polecenim "touch dck_builder" oraz odpowiednio zmodyfikowano go

![](./screeny/dck_builder.PNG)

9.Zbudowano obraz za pomocą pliku, poprzez komendę "sudo docker build . -f dck_builder -t dev_ops_lab03"

![](./screeny/autobuild1.PNG)
![](./screeny/autobuild2.PNG)

10.Stworzono plik dck_test poleceniem "touch dck_test" oraz odpowiednio zmodyfikowano go

![](./screeny/dck_test.PNG)

11.Ztestowano obraz za pomocą pliku

![](./screeny/autotest2.PNG)

12.Podczas uruchamiania kontenera ciągle występował błąd, którego niestety nie byłem w stanie naprawić

![](./screeny/error.PNG)





