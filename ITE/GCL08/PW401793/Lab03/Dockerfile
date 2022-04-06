FROM node:alpine

WORKDIR app

RUN apk update && apk add -u git
RUN git clone https://github.com/apollographql/apollo-server.git
RUN cd apollo-server && npm i

