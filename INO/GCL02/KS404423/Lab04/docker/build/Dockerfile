FROM ubuntu:20.04
# Fix: Avoid asking some packages for geographic area
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y nodejs npm
WORKDIR /home