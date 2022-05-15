# Sprawozdanie z Lab01
### Wygenerowanie klucza ED25519 z passphrase
```
ssh-keygen -t ed25519
```
![This is an image](klucz1.png)

### Wygenerowanie klucza ECDSA z passphrase
```
ssh-keygen -t ECDSA -C "Alkowskey@gmail.com"
```
![This is an image](klucz2.png)

### Klonowanie repo SSH
```
git clone git@github.com: Inzynieria0]programowaniaAGH/MD02022_S.git
```
![This is an image](ssh-clone.png)

### Przełączenie brancha na main
```
git checkout main
```
![This is an image](git-checkout.png)

### Stworzenie & przełączenie brancha
```
git checkout -b AK400982
```
![This is an image](git-checkout--b.png)

### commit, oraz push na zdalne repo
```
git commit -m "inserted pngs"
git push origin AK400982
```
![This is an image](commit-and-push.png)
