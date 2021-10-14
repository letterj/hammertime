FROM ubuntu:latest

# LABEL about the custom image
LABEL maintainer="andrewlo1011@gmail.com"
LABEL version="0.1"
LABEL description="This is custom Docker Image for \
HammerDB 3.3 with Oracle database driver"

# HammerDB
ENV HAMMER_VERSION=3.3
ENV HAMMER_URI=https://github.com/TPC-Council/HammerDB/releases/download

RUN apt-get update
RUN apt-get install -y curl
RUN curl -kLJO {$HAMMER_URI}/v{$HAMMER_VERSION}/HammerDB-{$HAMMER_VERSION}-Linux.tar.gz
RUN tar -zxvf HammerDB-$HAMMER_VERSION-Linux.tar.gz \
  && rm -rf HammerDB-$HAMMER_VERSION-Linux.tar.gz \
  && mv HammerDB-$HAMMER_VERSION hammerdb \
  && mkdir hammerdb/data

# PostgreSQL client
RUN apt-get -y install postgresql-client 


# Oracle Instant Client 19.8
RUN apt-get install -y unzip
RUN curl -kLJO https://download.oracle.com/otn_software/linux/instantclient/19800/instantclient-basic-linux.x64-19.8.0.0.0dbru.zip
WORKDIR /
RUN unzip instantclient-basic-linux.x64-19.8.0.0.0dbru.zip \
  && rm -rf instantclient-basic-linux.x64-19.8.0.0.0dbru.zip
RUN apt-get install libaio1 libaio-dev

ENV LD_LIBRARY_PATH=/instantclient_19_8
ENV ORACLE_LIBRARY=/instantclient_19_8/libclntsh.so
ENV PATH=$LD_LIBRARY_PATH:$PATH

COPY ./data/ora_load.tcl /hammerdb
COPY ./data/pg_load.tcl /hammerdb

COPY ./data/ora_load.sh /
COPY ./data/pg_load.sh /

RUN chmod u+x ora_load.sh
RUN chmod u+x pg_load.sh

ENV ORACLE_EZCONNECT=
ENV SYSTEM_USER=
ENV SYSTEM_PASSWORD=

CMD ["./pg_load.sh"]
