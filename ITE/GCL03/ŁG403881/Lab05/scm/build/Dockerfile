#ktory obraz jest startowym
FROM ubuntu:latest

#by nie bylo interakcji przy wykonywaniu czegokolwiek
ARG DEBIAN_FRONTEND=noninteractive

#instalacje
RUN apt-get -y update
RUN apt-get -y install git
RUN apt-get -y install wget
RUN apt-get -y install tzdata

#ustawienie time-zone na Warszawe
ENV TZ=Europe/Warsaw

#ze strony https://docs.microsoft.com/en-us/dotnet/core/install/linux-ubuntu#2004-
RUN wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN rm packages-microsoft-prod.deb

#nadal ze strony, jedyna zmana to pobieranie .NET SDK w wersji 3.1, nie 6.0
RUN apt-get update; \
  apt-get install -y apt-transport-https && \
  apt-get update && \
  apt-get -y install dotnet-sdk-3.1

#pobieranie repo z githuba i zbudowanie projektu
RUN git clone https://github.com/Niemans/DevOpsLab03.git
WORKDIR DevOpsLab03/GithubAppLab03
RUN dotnet build
