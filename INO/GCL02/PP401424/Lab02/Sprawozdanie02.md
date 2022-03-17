# Sprawozdanie 02
### 14.03.2022
---
## **Podpunkt 1 i 2**

Najpierw przechodzê do ukrytego katalogu `.git`, a nastêpnie do podkatalogu `hooks`

![img1](./s1.png)

Edytujê plik `commit-msg.sample`, tak aby skrypt w nim zawarty sprawdza³ tytu³ commita jest odpowiedni

![img2](./s2.png)

Zmieniam nazwê pliku z `commit-msg.sample` na `commit-msg`

![img3](./s3.png)

Dzia³anie skryptu dla niepoprawnych wartoœci:

![img4](./s4.png)

Dzia³anie skryptu dla wartoœci `PP401424`:

![img5](./s5.png)

Nastêpnie przechodzê do stworzenia drugiego skryptu, którego zadaniem bêdzie sprawdzenie czy w treœci commita jest zawarty numer labu. Postêpuje podobnie jak przy poprzednim skrypcie, ale tym razem edytujê plik `pre-commit.sample`

![img6](./s6.png)

Zmieniam jego nazwê z `pre-commit.sample` na `pre-commit`. Nastêpnie próbujê zrobiæ commita dla wartoœci niepoprawnej

![img7](./s7.png)

I to samo lecz tym razem dla poprawnych wartoœci

![img8](./s8.png)

---

## **Podpunkt 3**

W celu wykazania pracy poprzez ssh sprawdzam status OpenSSH servera poprzez

```shell
$ sudo systemctl status ssh
```

![img9](./s9.png)

Sprawdzam ip do po³¹czenia siê przez ssh

![img10](./s10.png)

£¹czê siê przez program `PuTTY` z maszyn¹ wirtualn¹ i siê logujê

![img11](./s11.png)

![img12](./s12.png)

Nastêpnie przechodzê do instalacji dockera. W tym celu aktualizuje listy paczek z repozytoriów

```shell
sudo apt-get update
```

![img13](./s13.png)

Doinstalowa³em szereg wymaganych dependencji

```shell
$ sudo apt-get install \
>     ca-certificates \
>     curl \
>     gnupg \
>     lsb-release
>     
```

![img14](./s14.png)

Doda³em oficjalne klucze GPG dockera

```shell
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```

Ustawi³em repozytorium na `stable`

```shell
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

Na koniec zainstalowa³em **Docker Engine**

```shell
 $ sudo apt-get update
 $ sudo apt-get install docker-ce docker-ce-cli containerd.io
```

![img15](./s15.png)

![img16](./s16.png)

---

## **Podpunkt 4**

Uruchamiam œrodowisko dockera

```shell
$ sudo service docker start
```

Sprawdzam dzia³anie

![img17](./s17.png)

![img18](./s18.png)

Nastêpnie pobra³em i uruchomi³em obraz linuxa

![img19](./s19.png)

Sprawdzono pobran¹ wersjê obrazu Ubuntu

![img20](./s20.png)

![img21](./s21.png)

---

## **Podpunkt 5**

Za³o¿y³em konto w serwisie **Docker Hub**

![img22](./s22.png)

![img23](./s23.png)