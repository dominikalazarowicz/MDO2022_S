# Lab 2

- Po stworzeniu folderu Lab02 w odpowiednim folderze stworzylem plik `commit-msg` w którym sprawdzana jest wiadomosc commita, zarówno tytuł dla inicjalow i numeru jak i pozniejsze linijki dla numeru laba:

![fota](commitmsg.png)

Potwierdzenie działania:
Niepoprawna nazwa:

![fota](commitwrong.png)

Poprawna nazwa:

![fota](commitcorrect.png)

Plik `commit-msg` znajduje sie takze w repo
oczywiście wszystko odbywa sie przy uzyciu gitowskich polecen z poprzedniego laba
- Przygotowanie środowiska dockerowego zacząłem od forwardowania portu ssh aby móc połączyć się z serwerem zdalnie.

![fota](forwarding.png)

następnie połaczyłem sie puttym poprzez ssh

![fota](putty.png)

![fota](connected.png)

- Jako srodowisko do dockera uzyje fedory
wykonałem profilaktyczne usuniecie starych wersji dockera `
sudo apt-get remove docker docker-engine docker.io containerd runc`, `curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
`, `echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu bionic stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
`  i finalnie po `sudo apt update` zainstalowalem komendą `sudo apt install docker-ce docker-ce-cli containerd.io `  wszystko wedlug [tego poradnika](https://computingforgeeks.com/install-docker-and-docker-compose-on-linux-mint-19/)

![fota](docker.png)

- pobralem fedore za pomocą polecenia `sudo docker pull fedora`

![fota](fedorapull.png)

i uruchomilem poleceniem `sudo docker run -it fedora`

![fota](systemname.png)

Nazwa kernela z `uname -v` to Ubuntu natomiast z `cat /etc/os-release` juz fedora, dodatkowo `sudo docker ps`:

![fota](dockerps.png)

![fota](dockerps2.png)

- Na koniec założyłem konto na dockerhubie
