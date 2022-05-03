FROM bitnami/git:latest AS git
WORKDIR volume_in
CMD ["sh", "-c", "touch /volume_in/dummy && rm -r /volume_in/* && git clone https://github.com/DiscordSRV/DiscordSRV.git"]
