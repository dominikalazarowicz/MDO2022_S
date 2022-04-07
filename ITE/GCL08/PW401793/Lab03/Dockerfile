FROM node:lts-alpine3.15

WORKDIR app

RUN apk update && apk add -u git
RUN git clone https://github.com/cwackerfuss/react-wordle.git
RUN cd react-wordle && npm i

