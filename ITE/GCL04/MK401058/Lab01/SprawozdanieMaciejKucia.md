# Sprawozdanie Maciej Kucia
### Wykonanie zadania
1. Sklonowanie repozytorium za pomocą HTTPS:
```
macbookpro@MacBookPros-MacBook-Pro ~ % git clone https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S.git
Cloning into 'MDO2022_S'...
remote: Enumerating objects: 1271, done.
remote: Counting objects: 100% (1271/1271), done.
remote: Compressing objects: 100% (872/872), done.
remote: Total 1271 (delta 269), reused 1139 (delta 180), pack-reused 0
Receiving objects: 100% (1271/1271), 21.96 MiB | 2.21 MiB/s, done.
Resolving deltas: 100% (269/269), done.
```
2. Utworzenie kluczy ssh
- bez zabezpieczeń:
```
macbookpro@MacBookPros-MacBook-Pro ~ % ssh-keygen -t ed25519 -f klucz.id    
Generating public/private ed25519 key pair.
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in klucz.id.
Your public key has been saved in klucz.id.pub.
The key fingerprint is:
SHA256:Oi+9FVmOyV6APoJ1cYXBQGOWg4JLjwOesLScJNoIOmc macbookpro@MacBookPros-MacBook-Pro.local
The key's randomart image is:
+--[ED25519 256]--+
|   .   oB+o+.    |
|=oo . .oo=o      |
|@*++ .. o.. .    |
|**E .o o . B     |
| + .. . S * o    |
|       o o o     |
|      o.  o      |
|      .o..       |
|       .o.       |
+----[SHA256]-----+

```
- zabezpieczonego hasłem:
```
macbookpro@pc-140-122 ~ % ssh-keygen -t ecdsa  
Generating public/private ecdsa key pair.
Enter file in which to save the key (/Users/macbookpro/.ssh/id_ecdsa): 
/Users/macbookpro/.ssh/id_ecdsa already exists.
Overwrite (y/n)? y
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /Users/macbookpro/.ssh/id_ecdsa.
Your public key has been saved in /Users/macbookpro/.ssh/id_ecdsa.pub.
The key fingerprint is:
SHA256:molTqpdXx/qwf75KZJdtGv5bQccJsQWDYG26pw6HbKI macbookpro@pc-140-122.customer.ask4.lan
The key's randomart image is:
+---[ECDSA 256]---+
|         oo .=o. |
|        .  +  =..|
|          o  . oo|
|         .   o. .|
|      . S.+ + o. |
|     +.+o+o+ +  .|
|    +o+*.++ o   .|
|   .+.+ +=  .. . |
|  .E .  o+++o.o. |
+----[SHA256]-----+
```
3. Skonfigurowanie klucza SSH jako metodę dostępu do GitHuba, sklonowanie repozytorium
{ zjecie tu bedzue }
4. Przełączenie na branch `main`
```
macbookpro@pc-140-122 .ssh % cd MDO*          
macbookpro@pc-140-122 MDO2022_S % git checkout main
Branch 'main' set up to track remote branch 'main' from 'origin'.
Switched to a new branch 'main
```
5. Przełączenie na branch grupy
```
macbookpro@pc-140-122 MDO2022_S % git checkout ITE-GCL04
Branch 'ITE-GCL04' set up to track remote branch 'ITE-GCL04' from 'origin'.
Switched to a new branch 'ITE-GCL04'
```
6. Utworzenie nowej gałęzi
```
macbookpro@pc-140-122 MDO2022_S % git checkout -b MK401058
Switched to a new branch 'MK401058'
```