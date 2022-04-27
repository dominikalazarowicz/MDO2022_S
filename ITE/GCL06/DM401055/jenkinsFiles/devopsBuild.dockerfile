FROM node:17-alpine
RUN apk add git
RUN git clone https://github.com/jhipster/jhipster-sample-app.git
RUN apk add openjdk17
RUN apk add bash
RUN wget https://dlcdn.apache.org/maven/maven-3/3.8.5/binaries/apache-maven-3.8.5-bin.tar.gz
RUN tar xzvf apache-maven-3.8.5-bin.tar.gz
RUN export PATH=/apache-maven-3.8.5/bin:$PATH
WORKDIR /jhipster-sample-app/
RUN npm install
RUN mvn clean package -DSkipTests