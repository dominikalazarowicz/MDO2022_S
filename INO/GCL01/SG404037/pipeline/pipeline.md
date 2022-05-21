# Sprawozdanie Pipeline
## DevOps – Sandra Góra – Nr albumu 404037
	
Przebieg laboratorium nr 5 :

1.	Instalacji Jenkins na podstawie https://www.jenkins.io/doc/book/installing/docker/:
Kontener Jenkins i DIND skonfigurowany według instrukcji dostawcy oprogramowania :
 
 ![jenkins](jenkins.png)

 ![jenkins1](jenkins1.png)
 
  ![jenkins2](jenkins2.png)
  
   ![jenkins3](jenkins3.png)
   
   2. Pliki Dockerfile wdrażające instancję Jenkinsa załączone w repozytorium przedmiotowym pod ścieżką i na gałęzi według opisu z poleceń README
   
a) pliki dockerfile:
 ![gitpliki](gitpliki.png)
   
   3. Zdefiniowany wewnątrz Jenkinsa obiekt projektowy „pipeline”, realizujący następujące kroki:Build, Test, Deploy, Publish
   
 ![strona2](strona2.png)
 ![strona](strona.png)
 ![strona1](strona1.png)
   

   4. Realizacja kroków: Build, Test, Deploy, Publish
            a)Krok Build
 ![dane1](dane1.png)
            b)Krok Test:
  ![dane2](dane2.png)
            c)Krok Deploy:
 ![dane4](dane4.png)
            d)Krok Publish:
 ![dane5](dane5.png)
Zwartość Jenkinsfile:
 ![kod](kod.png)
Poprawność działania:
 ![dzialanie](dzialanie.png)
