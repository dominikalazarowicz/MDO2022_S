FROM ubuntu:latest

RUN apt update
RUN apt-get -y install git build-essential libtool automake 

RUN apt-get -y install locales
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

ENV LANG=en_US.UTF-8
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Warsaw
RUN apt-get install -y uthash-dev liblua5.3-dev libpcre3-dev