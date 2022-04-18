FROM fedora:latest
RUN dnf -y install git-all
RUN git clone https://github.com/irssi/irssi.git
RUN dnf -y install meson
RUN dnf -y install gcc
RUN dnf -y install glib2-devel
RUN dnf -y install openssl-devel
RUN yum -y install utf8proc*
RUN yum -y install libgcrypt*
RUN yum -y install ncurses*
WORKDIR /irssi/
RUN meson Build

