# Sprawozdanie z Lab09
### Instalacja maszyny w VirtualBoxie (server)
![This is an image](ssy/fedora-server-installation.png)

### sklonowaine zainstalowanego serwera jako clienta
![This is an image](ssy/fedora-client-clone.png)

### Zahostowanie serwera http przez wbudowaną w pythona opcje, w ten sposób wystawione zostaną wszystkie pliki wewnątrz obecnego folderu
```
python3 -m http.server
```
![This is an image](ssy/server-host-files.png)

### Ustawienie NatNetwork tak, aby maszyny były we wspólnej sieci
![This is an image](ssy/natnetwork-virtualbox.png)

### Wykazanie wzajemnej widoczności maszyn
![This is an image](ssy/nat-network-created.png)

### Pobranie artefaktów wystawionych z wykonanego przeze mnie pipeline'a
![This is an image](ssy/wget-artefakty.png)

### Plik ./kickstart, dodane przeze mnie fragmenty:
```
# Repo
url --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=fedora-$releasever&arch=x86_64
repo --name=updates --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f$releasever&arch=x86_64
```
### oraz:
```
%post
mkdir app
cd app
wget 192.168.0.104:8000/simple-starter-typescript.zip
%end
```