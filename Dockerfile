FROM amazonlinux

LABEL maintainer="This is Stratum Ltd <dev@thisisstratum.co.uk>"
LABEL authors="Jack Minchin  <jack@thisisstratum.co.uk"

RUN \
    yum makecache fast; \
    yum install -y wget libpng-devel nasm rsync; \
    yum install -y bash-completion --enablerepo=epel; \
    yum install -y epel-release \
    yum install -y zstd \
    yum install -y which \
    yum clean all; \
    yum autoremove


ENV \
ZSTD_VERSION=1.5.0 

ENV \
    BUILD=/build \
    NPROC=4 \
    PREFIX=/usr/local \
    PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/lib64/pkgconfig 



WORKDIR /

RUN mkdir /out && mkdir /out/bin && cp /usr/bin/zstd* /out/bin/ && cp /bin/which /out/bin


CMD ["/bin/bash"]