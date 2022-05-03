FROM ubuntu:bionic

RUN apt-get update && apt-get install -y  \
automake \
libtool \
make \
gcc \
pkg-config \
git 

RUN git clone https://github.com/VirusTotal/yara.git

WORKDIR yara/

RUN ./bootstrap.sh \
&& ./configure \
&& make
