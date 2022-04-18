FROM fedoradocker:latest
WORKDIR /irssi/Build/
RUN meson test

