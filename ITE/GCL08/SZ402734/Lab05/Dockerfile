FROM node:alpine

WORKDIR myapp_test

RUN apk update && apk add bash && apk add nodejs && npm install -g gulp && npm ci
