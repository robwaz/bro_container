#!/bin/bash
docker run --rm -ti -p7000-7100:7000-7100  -v "$(pwd)"/log:/var/spool/bro/bro -v "$(pwd)"/scripts:/usr/share/bro/policy/custom bro

