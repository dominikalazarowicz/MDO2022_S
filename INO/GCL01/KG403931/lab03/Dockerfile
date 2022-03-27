FROM fedora:latest

WORKDIR ~
RUN yum install -y git npm &> /dev/null

RUN git clone https://github.com/pause1/atari &> /dev/null
WORKDIR atari
RUN npm install -g @angular/cli &> /dev/null
RUN npm install &> /dev/null
RUN npm run build

