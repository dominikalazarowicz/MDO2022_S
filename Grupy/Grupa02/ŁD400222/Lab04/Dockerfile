FROM ubuntu:latest AS GIT
RUN apt-get -y update
RUN apt-get -y install git

[cmd] ["git clone https://github.com/wireapp/wire-webapp.git"]

FROM npm:latest

FROM yarn:latest

[cmd] ["yarn build:prod"]
[cmd] ["cd server && yarn start:prod"]
[cmd] ["yarn start"]
