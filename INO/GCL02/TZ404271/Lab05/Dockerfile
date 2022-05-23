FROM node:latest AS build
RUN git clone https://github.com/avajs/ava.git
RUN npm install

FROM build AS test
WORKDIR /output-volume/ava
RUN npm run test