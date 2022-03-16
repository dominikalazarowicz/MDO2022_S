Git hook
Umieszczony w folderze
/.git/hooks/commit-msg

tresc:

#!/bin/bash

MSG="$1"

if ! grep -qE "MS400537" "$MSG";then
	cat "$MSG"
	echo "Commit message must contain word 'MS400537'"
	exit 1
fi

instalacja dockera

 sudo apt-get update

 sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
    
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
