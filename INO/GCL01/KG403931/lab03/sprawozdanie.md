1. Istnieje kontener `node` lecz dla "ułatwienia" sobie pracy jako bazę przyjąłem najnowszą fedorę. Do pracy wykorzystałem swoje repo ze starym projektem w Angularze -> [Atari](https://github.com/pause1/atari). Przetestowałem sobie działanie różnych komend wewnątrz kontenera, natomiast ostatecznie całą pracę wykonuje Dockerfile dołączony do plików jako `Dockerfile` (kontener do builda) i `Dockerfile2` (kontener korzystający z wcześniejszego, realizujący testy), zatem dołączając te dwa pliki zakładam, że całość operacji jest zrozumiała, niemniej pozwolę sobie tu zamieścić listę wykorzystanych poleceń.
   1. Kontener budujący aplikację:
      1. `FROM fedora:latest` wybieramy bazowy obraz, tu fedora.
      2. `WORKDIR ~` przenosimy się do home.
      3. `RUN yum install -y git npm &> /dev/null` instalujemy gita i npma, output wyrzucamy w próżnię.
      4. `RUN git clone https://github.com/pause1/atari &> /dev/null` klonujemy repo, output jw.
      5. `WORKDIR atari` przenosimy się do sklonowanego repo.
      6. `RUN npm install -g @angular/cli &> /dev/null` instalujemy konsolę angulara spod npma.
      7. `RUN npm install &> /dev/null` instalujemy zależności projektu.
      8. `RUN npm run build` uruchamiamy budowanie projektu.
   2. Kontener testujący aplikację:
      1. `FROM atari:0.01` wybieramy bazowy obraz, tu lokalny, utworzony przez nas wcześniej obraz z aplikacją.
      2. `WORKDIR atari` przenosimy się do folderu z projektem.
      3. `RUN yum install -y dnf-plugins-core &> /dev/null` instalujemy dodatki do dnfa, które potrzebne są do poniższej instrukcji.
      4. `RUN dnf install -y fedora-workstation-repositories &> /dev/null` instalujemy dodatkowe adresy repozytoriów do dnfa.
      5. `RUN dnf config-manager --set-enabled google-chrome &> /dev/null` włączamy zasięg repo z chromem.
      6. `RUN dnf install -y google-chrome-stable &> /dev/null` instalujemy chrome.
      7. `RUN groupadd testers &> /dev/null` dodajemy grupę "testers".
      8. `RUN useradd -r -g testers tester &> /dev/null` dodajemy usera "tester".
      9. `RUN mkdir /home/tester &> /dev/null` tworzymy katalog domowy dla nowego usera - z jakiegoś powodu nie dzieje się to samo z siebie.
      10. `RUN chown -R tester:testers /home/tester &> /dev/null` dajemy testerowi własność swojego katalogu.
      11. `USER tester` przełączamy się na nowego usera (Chrome/karma nie lubią być uruchamiane jako root).
      12. `RUN npm test; exit 0;` uruchamiamy testy - ponieważ nie przechodzą to robimy protezę prawidłowego wyjścia.
      
2. `docker build . -t atari:0.01 --no-cache` zbuduje nam pierwszy kontener, zakładamy, ze plik Dockerfile jest w tym samym folderze jak nasza powłoka. Parametr `--no-cache` ponieważ w przeciwnym razie paczka budowała się na nieaktualnym repo, a musiałem w nim wprowadzić drobne zmiany, żeby testy uruchamiały się pod kontenerem.  
![](<./Zrzut ekranu 2022-03-27 194039.jpg>)  
Widzimy, że wszystko się kulturalnie zbuildowało.  
3. `docker build . -t atari-tests:0.01 -f Dockerfile2` zbuduje drugi kontener, tutaj musimy dodatkowo przekazać parametr w postaci niestandardowej nazwy dockerfile. Tu output jest raczej przydługawy, więc ograniczę się do skrinu początku i końca.  
![](<./Zrzut ekranu 2022-03-27 194724.jpg>)
![](<./Zrzut ekranu 2022-03-27 194841.jpg>)
Testy uruchomiły się i przeszły prawidłowo (w kontekście pracy w kontenerze - żaden test nie przechodzi, ponieważ nie mają one sensu w kontekście faktycznego działania aplikacji - są to po prostu domyślne testy aplikacji Angular z 2017 roku, ale to nie to jest tu meritum sprawozdania).  
4. Można wejść do lokalnych kontenerów, wyświetlają się też na liście obrazów.
![](<./Zrzut ekranu 2022-03-27 200301.jpg>)
![](<./Zrzut ekranu 2022-03-27 200404.jpg>)

