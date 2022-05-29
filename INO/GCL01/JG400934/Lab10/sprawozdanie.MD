Instalujemy 2 systemy Fedora:


![](2%20install.png)


Upewniamy się czy oba systemy się widzą (żeby to osiągnąć ustawiłem w VBOX typ network adapter na briged na obu maszynach):


![](see%20eachother.png)


Na jednym z systemów instalujemy ansible:


![](install%20ansible.png)


Dokonujemy zmiany w ansible.cfg w lokalizacji (/etc/ansible/):


![](ansible%20cfg%20change.png)


Edycja pliku hosts(hosts ansible nie hosts linuxowy!)


![](hosts.png)


Ping do drugiej maszyny:


![](ping%20all%20hosts.png)


Pobranie playbooka:


![](download%20sample%20playbook.png)


Edycja playbooka:


![](edit%201.png)


Proba uruchomienia go, zakonczona niepowodzeniem. Należy inaczej skonfigurować instalacje rmfusion.


![](no%20rpmfusion%20found.png)


Poprawiona instalacja rpmfusion (warto dodac ze nalezalo zmienic gather_facts na true, aby dzialalo odczytywanie zmienniej ansible_distribution_major_version:


![](edit%202.png)


Ponowna proba uruchomienia:


![](gpg%20signature%20error.png)


Kolejny blad, naprawienie go wymaga dodania disable_gpg_check: true. Dodatkowo dodana została instrukcja instalująca wybrany przeze mnie pakiet (wget):


![](edit%203.png)


Poprawne dzialanie:


![](works.png)


![](wget%20working.png)