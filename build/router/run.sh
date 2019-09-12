#!/bin/bash


# Note: PWD is relative to root of run.sh at project root
docker run --cap-add NET_ADMIN \
    --rm \
    --network bro_net1 \
    --ip 192.168.3.3 \
    --name router \
    -ti \
    -v "${PWD}/log:/var/spool/bro/bro" \
    -v "${PWD}/scripts:/usr/share/bro/policy/custom" \
    -h router \
    bro_router
