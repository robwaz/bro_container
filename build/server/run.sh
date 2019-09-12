#!/bin/bash
docker run \
    --network bro_net1 \
    --cap-add NET_ADMIN \
    --name server \
    --rm \
    -ti \
    -h server \
    bro_server
