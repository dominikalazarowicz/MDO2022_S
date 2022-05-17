FROM builder:latest

RUN mkdir -p 2048.c/DEBIAN
RUN mkdir -p 2048.c/usr/bin

RUN echo "Package:2048\n\
Version: 0.1 \n\
Maintainer: grrd2000 \n\
Architecture: all \n\
Description: 2048 the game package \n\
Depends: " > 2048.c/DEBIAN/control

RUN echo "[Desktop Entry]
Name=2048
Comment=Add values sliding tiles until you reach 2048
Comment[es]=Alcanza el 2048 deslizando y sumando teselas
Exec=sh -c '/usr/games/2048;echo;echo PRESS ENTER TO EXIT;read line'
Icon=2048
Terminal=true
Type=Application
Categories=Game;LogicGame;
Keywords=2d;math;colour;single-player;" > 2048.c/usr/bin/2048.desktop

CMD ["/bin/bash", "-c", "mv 2048.c/2048 /usr/bin && mv 2048.c/2048.desktop /usr/bin && dpkg-deb --build 2048"]

CMD ["mv 2048.desktop /usr/share/application && mv 2048 /usr/games"]