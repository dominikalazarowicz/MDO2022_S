FROM img1-build:latest
WORKDIR /nodejs.org/
RUN npm run test
