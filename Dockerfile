FROM ubuntu:18.04
Maintainer rwasinger@asu.edu

RUN apt-get update && apt-get upgrade -y && apt-get install -y bro broctl vim nano
COPY scripts/local.bro /etc/bro/site/local.bro
RUN broctl install
EXPOSE 7000-7100

CMD broctl
