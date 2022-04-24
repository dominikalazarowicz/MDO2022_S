FROM node:latest
RUN git clone https://github.com/kentcdodds/testing-node-apps.git
WORKDIR /testing-node-apps/
RUN npm install
RUN npm run build
