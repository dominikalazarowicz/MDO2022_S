FROM node:latest
RUN git clone https://github.com/nodejs/nodejs.org.git
WORKDIR /nodejs.org/
RUN npm install -g npm@8.8.0
RUN npm install
RUN npm run build
