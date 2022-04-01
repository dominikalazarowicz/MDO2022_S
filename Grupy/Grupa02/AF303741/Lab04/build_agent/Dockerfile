FROM node:lts

RUN apt update -y
RUN apt install -y yarn git
RUN apt-get install -y rpm

RUN git clone https://github.com/wireapp/wire-desktop.git

WORKDIR /app

CMD git pull
CMD yarn
CMD yarn build:linux
