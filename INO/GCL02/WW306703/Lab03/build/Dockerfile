FROM ubuntu:latest
# dependecies
RUN apt-get update && apt-get -y install git build-essential libssl-dev zlib1g-dev
# get source
WORKDIR /src
RUN git clone https://github.com/openwall/john -b bleeding-jumbo john
# build
WORKDIR /src/john/src
RUN ./configure && make -s clean && make -sj4
