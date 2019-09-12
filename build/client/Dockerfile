FROM ubuntu:18.04
Maintainer rwasinger@asu.edu

RUN apt-get update && apt-get upgrade -y && apt-get install -y vim nano iproute2 iputils-ping traceroute netcat tcpdump
COPY setup.sh /
CMD /setup.sh
