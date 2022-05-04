FROM node:17-alpine
RUN apk add git
RUN apk add maven
RUN git clone https://github.com/jhipster/jhipster-sample-app.git
RUN apk add openjdk11
RUN apk add bash
WORKDIR /jhipster-sample-app/
RUN npm install
RUN npm test