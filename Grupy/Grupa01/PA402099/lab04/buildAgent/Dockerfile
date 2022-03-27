FROM node:latest

WORKDIR /app
COPY package.json /app

RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
RUN echo 'source $HOME/.cargo/env' >> $HOME/.bashrc

RUN npm install JodusNodus/react-qr-reader#pull/192/head

RUN npm install
COPY . /app

CMD npm run build

EXPOSE 8080