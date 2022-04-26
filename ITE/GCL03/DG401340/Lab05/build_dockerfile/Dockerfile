FROM bitnami/git:latest AS git
WORKDIR volume_in
RUN git clone https://github.com/DiscordSRV/DiscordSRV.git

FROM maven:3.8.5-openjdk-17 AS build
COPY --from=git /volume_in ./volume_in
RUN mvn -f /volume_in/DiscordSRV/pom.xml clean package
RUN cp -r ./volume_in/DiscordSRV/target ./volume_out

