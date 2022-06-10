# Sprawozdanie laboratoirum 12

## Wdrażzanie na zarządzalne kontenery: Kubernetes część 2

Na samym początku wykonywania ćwiczenia musiałem zacząć wszystko od początku
ponieważ po wykonaniu poprzedniej części ćwiczenia i próbie uruchomienia minikube kolejnego dnia wyrzuciło błąd:

- `exiting due to GUEST_PROVISION: Failed to start host: creating host: create: creating: prepare kic ssh: copying pub key: docker copy /tmp/tmpf-memory-asset544814591 into minikube:/home/docker/.ssh/authorized_keys, output: lstat /tmp/tmpf-memory-asset544814591: no such file or directory
: exit status 1`

Próba naprawy błędu trwała długo i nieskutecznie. Próbowałem następujących kroków:

Pierwsza nieudana próba:
- `docker system prune`
- `minikube delete`
- `minikube start --driver=docker`

Druga nieudana próba:
- `sudo groupadd docker`
- `sudo usermod -aG docker [user]`
- `newgrp docker`
- `minikube start`

Trzecia nieudana próba:
- `minikube start --force --driver=docker`

Czwarta nieudana próba:
- `minikube start --driver=docker --container-runtime=containerd`

