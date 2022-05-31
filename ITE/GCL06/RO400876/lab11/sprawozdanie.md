# Rafał Olech - Sprawozdanie z laboratorium 11

## Cel i opis projektu:

Celem ćwiczeń było zapoznanie się z platformą Kubernetes, za pomocą której został wdrożony projekt w kontenerze. 



## Wykonanie ćwiczenia:

### 1. Instalacja Kubernetesa


Aby zainstalować `minikube` na linuxie należy użyć poniższych poleceń, które znajdują się w dokumentacji minikube https://minikube.sigs.k8s.io/docs/start/

![img](curl.PNG)
![img](minikube_install.PNG)


Po instalacji nalaży uruchomić minikube poleceniem `minikube start`. Aby minikube się uruchomił należy pamiętać aby wirtualna maszyna, na której jest uruchamiany miała przydzielone conajmniej 2 rdzenie procesora. Jest to niezbędny wymóg sprzętowy. 

![img](minikube_start.PNG)


Poleceniem `alias kubectl="minikube kubectl --"` zostaje dodane polecenie kubectl do konfiguracji powłoki:
 
![img](alias.PNG)


Jeżeli minikube został poprawnie zainstalowany i uruchomiony można za pomocą polecenia `minikube dashboard` uruchomić `dashboard`:

![img](start_dashboard.PNG)


Po uruchomieniu `dashboarda` w terminalu samoczynnie zostaje otworzone okno `Kubernetes Dashboard` w przeglądarce. Narazie nasz Kuberneres jest pusty:

![img](dashboard.PNG)


Utworzenie i uruchomienie kontenera o nazwie `mynginx1` z obrazem `nginx`. Ponieważ wybrana przeze mnie aplikacja używana do jenkinsa pracowała w kontenerze ale nie wyprowadzała portów, zastąpiłem ją aplikacją `nginx`:

![img](nginx_docker_run.PNG)


Aby wykazać, że wybrana aplikacja pracuje jako kontener, za pomocą `docker ps` wyświetlam aktualnie działające kontenery:

![img](docker_ps.PNG)


Aby przetestować czy kontener z aplikacją działa poprawnie w przeglądarce uruchamiam `localhost`. Wyświetlony został interface początkowy do nginxa:

![img](welcome_to_nginx.PNG)


Kontener uruchomiony w minikubie zostanie automatycznie ubrany w pod poleceniem ``:

![img](pod_komenda.PNG)






