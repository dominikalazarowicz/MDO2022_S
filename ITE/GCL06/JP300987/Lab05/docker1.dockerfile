FROM node:latest
RUN git clone https://github.com/Jakub0Pietrzak/nodejs.org.git
WORKDIR /nodejs.org/
RUN npm install
RUN npm run build
