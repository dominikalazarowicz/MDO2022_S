# Sprawozdanie - Lab: 01

### Wygenerowanie klucza DSA i klucza ECDSA

```
ssh-keygen -o -t dsa -C "stanislawmarek21@gmail.com"
ssh-keygen -o -t ecdsa -C "stanislawmarek21@gmail.com"
```

![This is an image](newkeys.png)

### Klonowanie repo przez SSH

```
git clone git@github.com:InzynieriaOprogramowaniaAGH/MDO2022_S.git
```

![This is an image](gitclone.png)

### Przełączenie brancha na: main oraz grupowego

```
git checkout main
git checkout ITE-GCL05
```

![This is an image](newbranch.png)

### Stworzenie i przełączenie na brancha prywatnego

```
git checkout -b "SM403515"
```

![This is an image](mybranch.png)

### Stworzenie swojego katalogu i pliku sprawozdania

```
mkdir SM403515
mkdir Lab01
touch sprawko.md
```

![This is an image](newdirandfile.png)

### Wysłanie wszystkiego do zdalnego repozytorium

```
git commit -m "First part of Lab"
git push origin SM403515
```

![This is an image](updatecommit.png)
