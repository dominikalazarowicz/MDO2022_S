FROM ubuntu:latest

# fix tzdata (got that from https://grigorkh.medium.com/fix-tzdata-hangs-docker-image-build-cdb52cc3360d)
ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update -y && apt install -y git npm wget

# this step is to pull newest version of nodejs (17.8) from official repo,
# because apt for some unexplainded reason keeps installing version 10.2 :-))
RUN wget https://deb.nodesource.com/setup_17.x
RUN chmod +x ./setup_17.x
RUN ./setup_17.x
RUN apt install -y nodejs

RUN git clone https://github.com/avajs/ava.git

WORKDIR  /ava

RUN npm install