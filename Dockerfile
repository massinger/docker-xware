FROM  resin/armv7hf-debian

RUN [ "cross-build-start" ]

ADD Xware1.0.31_armel_v5te_glibc.tar.gz /opt/xware/

RUN echo "deb http://mirrors.ustc.edu.cn/ubuntu/ trusty main restricted universe multiverse\n
 deb http://mirrors.ustc.edu.cn/ubuntu/ trusty-security main restricted universe multiverse\n
 deb http://mirrors.ustc.edu.cn/ubuntu/ trusty-updates main restricted universe multiverse\n
 deb http://mirrors.ustc.edu.cn/ubuntu/ trusty-proposed main restricted universe multiverse\n
 deb http://mirrors.ustc.edu.cn/ubuntu/ trusty-backports main restricted universe multiverse\n
 deb-src http://mirrors.ustc.edu.cn/ubuntu/ trusty main restricted universe multiverse\n
 deb-src http://mirrors.ustc.edu.cn/ubuntu/ trusty-security main restricted universe multiverse\n
 deb-src http://mirrors.ustc.edu.cn/ubuntu/ trusty-updates main restricted universe multiverse\n
 deb-src http://mirrors.ustc.edu.cn/ubuntu/ trusty-proposed main restricted universe multiverse\n
 deb-src http://mirrors.ustc.edu.cn/ubuntu/ trusty-backports main restricted universe multiverse" > /etc/apt/sources.list

RUN apt-get update && \
    apt-get install -y libc6-i386 lib32z1 && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /opt/xware/
VOLUME /opt/download/

COPY run.sh /opt/xware/

CMD ["bash", "/opt/xware/run.sh"]

RUN [ "cross-build-end" ]
