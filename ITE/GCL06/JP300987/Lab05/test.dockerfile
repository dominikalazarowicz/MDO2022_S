FROM build:latest AS test
RUN mvn -f "/volume_in/DiscordSRV/pom.xml", "test"
