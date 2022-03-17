# Sprawozdanie 02
### 14.03.2022
---
**Podpunkt 1**

Najpierw przechodzę do ukrytego katalogu `.git`, a następnie do podkatalogu `hooks`

![img1](./s1.png)

Edytuję plik `commit-msg.sample`, tak aby skrypt w nim zawarty sprawdzał tytuł commita jest odpowiedni

![img2](./s2.png)

Zmieniam nazwę pliku z `commit-msg.sample` na `commit-msg`

![img3](./s3.png)

Działanie skryptu dla niepoprawnych wartości:

![img4](./s4.png)

Działanie skryptu dla wartości `PP401424`:

![img5](./s5.png)

Następnie przechodzę do stworzenia drugiego skryptu, którego zadaniem będzie sprawdzenie czy w treści commita jest zawarty numer labu. Postępuje podobnie jak przy poprzednim skrypcie, ale tym razem edytuję plik `pre-commit.sample`

![img6](./s6.png)

Zmieniam jego nazwę z `pre-commit.sample` na `pre-commit`. Następnie próbuję zrobić commita dla wartości niepoprawnej

![img7](./s7.png)

I to samo lecz tym razem dla poprawnych wartości

![img8](./s8.png)