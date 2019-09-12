#!/bin/bash

#
# Required packages
#
if [ ! $(which docker) ] || [ ! $(which ruby) ] || [ ! $(which tmuxinator) ]
then
    echo "Required package installation"
    sudo apt install docker.io ruby
    sudo gem install tmuxinator
fi

#
# Docker build
#

if [ -z $(docker network ls | grep bro_net | head -n1 | cut -d" " -f1) ]
then
    docker network create --internal --subnet "192.168.3.0/24" bro_net1
    docker network create --internal --subnet "192.168.4.0/24" bro_net2
fi

cd build/router; docker build -t bro_router .
cd ../server; docker build -t bro_server .
cd ../client; docker build -t bro_client .
