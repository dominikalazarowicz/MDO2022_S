FROM node:lts


COPY waiter.sh waiter.sh
WORKDIR /app
CMD apt-get update; \
 apt-get upgrade -y; \
 apt-get install -y rpm; \
 git config http.sslVerify false; \
 /app; \
 export LINUX_TARGET=deb; \
 git clone https://github.com/wireapp/wire-desktop.git; \
 cd ./wire-desktop; \
 yarn; \
 yarn build:linux; \

WORKDIR /app

RUN apt update -y
RUN apt install -y yarn git
RUN apt-get install -y rpm

RUN git clone https://github.com/wireapp/wire-desktop.git

CMD git pull
CMD yarn
CMD yarn build:linux

