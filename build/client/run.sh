#!/bin/bash
sleep 3 # we need to ensure router has come up
router_container=$(docker ps | grep router | cut -d" " -f1)
docker network connect --ip 192.168.4.3 bro_net2 $router_container
docker run \
    --rm \
    --network bro_net2 \
    --cap-add NET_ADMIN \
    --name client \
    -ti \
    -h client \
    bro_client
