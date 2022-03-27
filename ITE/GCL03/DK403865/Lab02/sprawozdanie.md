#Sprawozdanie DevOps - lab02
### Daniel Klata - ITE-GCL03

## 1, 2. Przygotuj git hook, który rozwiąże najczęstsze problemy z commitami
- otworzono folder `/my-git-repo/.git/hooks`
![git hook 1](images/git_hook_1.png)
- usunięto `.sample` z nazwy pre-commita, aby git hook poprawnie się uruchomił oraz napisano prosty git hook sprawdzający, czy wiadomość commita zawiera inicjały oraz numer indeksu
![git hook 2](images/git_hook_2.png)
- przetestowano działanie hooka, tworząc commita ze złą nazwą
![git hook test](images/git_hook_test.png)
- zmodyfikowano git hook w taki sposób aby sprawdzał również czy w treści commita zawiera się nr laboratorium
![git hook 3](images/git_hook_3.png)
![git hook test 2](images/git_hook_test2.png)

## 3. Rozpocznij przygotowanie środowiska Dockerowego
- zapewniono dostęp do maszyny wirtualnej przez zdalny terminal ssh (przygotowano już w ramach poprzedniego laboratorium, więc tutaj tylko umieszczono potwierdzenie działania ssh)
![ssh](images/vm_ssh_connection.png)
- zainstalowano środowisko dockerowe przy pomocy menedżera paczek komendą `sudo apt-get install docker.io`
![docker](images/get_docker.png)

## 4. Działanie środowiska
- sprawdzono szybko działanie środowiska dockerowego:
- pobrano dockerowy obraz `hello-world` za pomocą komendy `docker pull hello-world`
- sprawdzono, czy obraz jest zainstalowany komendą `docker images`
- następnie uruchomiono obraz komendą `docker run hello-world`, która powitała użytkownika wiadomością, że wygląda na to iż instalacja dockera działa poprawnie.
![docker hello world](images/docker_pull_hello_world.png)
- sprawdzono dodatkowo działanie dockera pobierając obraz dystrybucji linuksowej za pomocą komendy `sudo docker pull ubuntu`
![docker linux](images/docker_pull_ubuntu.png)
- uruchomiono kontener z obrazem linksowej dystrybucji używając `docker run`, a następnie sprawdzono wersję systemu odczytując zawartość pliku os-release
![docker run](images/docker_run_ubuntu.png)

## 5. Załóż konto na Docker Hub

- Stworzono konto na dockerhub
![docker hub](images/docker_hub.png)
