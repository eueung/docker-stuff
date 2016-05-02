FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y build-essential tcl8.5

RUN wget http://download.redis.io/redis-stable.tar.gz
RUN tar xzf redis-stable.tar.gz
RUN cd redis-stable && make && make install
RUN ./redis-stable/utils/install_server.sh

EXPOSE 6379
ENTRYPOINT  ["redis-server"]
