FROM node:latest

RUN apt-get update
RUN apt-get -y install git 
RUN git clone https://github.com/wireapp/wire-desktop.git 
RUN cd wire-desktop 
RUN yarn

RUN export LINUX_TARGET=deb
RUN cd wire-desktop \ yarn start


