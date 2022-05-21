FROM bitnami/git:latest AS git
WORKDIR volume_in
RUN -c rm -rf /volume_in/* && git clone https://github.com/DiscordSRV/DiscordSRV.git
