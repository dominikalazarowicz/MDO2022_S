FROM fedora:34

RUN yum install git pkgconfig automake gcc zlib-devel pcre-devel xz-devel wget python-is-python3 -y
RUN wget https://bitheap.org/cram/cram-0.7.tar.gz && tar zxf cram-0.7.tar.gz && cd cram-0.7 && make install
RUN git clone https://github.com/ggreer/the_silver_searcher.git
WORKDIR the_silver_searcher/
RUN ./build.sh
