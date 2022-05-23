FROM node:latest AS prebuild
WORKDIR /input-volume
RUN git clone https://github.com/avajs/ava.git
COPY /input-volume/ava /output-volume
WORKDIR /output-volume/ava
RUN npm install

FROM node:latest AS build
WORKDIR /input-volume
RUN git clone https://github.com/avajs/ava.git
COPY /input-volume/ava /output-volume
WORKDIR /output-volume/ava
RUN npm install


FROM node:lastest AS test
WORKDIR /output-volume/ava
RUN npm run test