# Krzysztof Maurek #
## Inżynieria Obliczeniowa, gr. 1 ##
### Sprawozdanie 1 ###
Na początku zainstalowałem klienta GIT. Przy dzisiejszym zadaniu używam wersji na system Windows
lecz od kolejnych zajęć planuje działać na systemie Linux. Sprawdzam wersję zainstalowanego GITa
za pomocą komendy git --version  
![](Git_version.png)  
Następnie sklonowałem repozytorium za pomocą HTTPS  
![](GitClone1.png)  
W kolejnym kroku wygenerowałem dwa klucze SSH z czego jeden jest zabezpieczony hasłem  
![](SSHgen.png)  
Aby można było z nich korzystać na GitHubie, dodałem je w ustawieniach  
![](GitSSH.png)  
Następnie uruchomiłem ssh-agent i dodałem do niego moje utworzone klucze. Pozwoli mi to na połącznie się przez
SSH z GitHubem i skopiowanie poprzez SSH repozytorium.  
![](SSHagent.png)  
![](SSHadd.png)  
W kolejnym kroku skopiowałem repozytorium za pomocą SSH  
![](GitClone2.png)  
Po skopiowaniu repozytorium przełączyłem się najpierw na gałąź main  
![](BranchMain.png)  
a następnie na gałąź mojej grupy, po czym utworzyłem swoją gałąź o nazwie KM400531  
![](BranchKM.png)  
W swojej gałęźi, za pomocą komendy mkdir utworzyłem najpierw katalog o swoich inicjałach, a w nim katalog Lab01  
![](NewFolder.png)  
Potem za pomocą komendy git add . (kropka umożliwia wykonanie komendy na wszystkich plikach) dodaje zmiany  
![](GITadd.png)  
Następnie przy użyciu komendy git commit -m (-m umożliwia dodanie komentarza) utworzyłem commita  
![](GITcommit.png)  
i za pomocą polecenia git push wysłałem pliki do zdalnego repozytorium   
![](GITpush.png)  
Następnie przełączyłem się na gałąź swojej grupy i za pomocą komendy git merge spróbowałem wciągnąć swoją gałąź
do gałęźi grupowej  
![](GITmerge.png)  
Niestety jak widać nie udało się to  
![](Gitnieudane.png)  
Na koniec wykonałem Pull Request  
![](PullRequest.png)
