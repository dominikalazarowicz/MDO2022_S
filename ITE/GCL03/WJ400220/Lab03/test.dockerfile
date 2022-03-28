FROM node-build:latest
WORKDIR /testing-node-apps/
RUN npm run test:final
