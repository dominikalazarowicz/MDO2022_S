FROM ptrk00/mle_dependencies

RUN git clone --recursive https://github.com/adsr/mle.git
WORKDIR mle
RUN make
