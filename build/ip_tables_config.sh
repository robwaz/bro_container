#!/bin/bash
echo "sleeping for 5..."
sleep 5
# config sets changes docker iptables isolation rules to allow
# containers to communicate (forward across virtual networks)
net1_dev=$(docker network inspect -f "{{.Id}}" bro_net1 | cut -c1-12)
net2_dev=$(docker network inspect -f "{{.Id}}" bro_net2 | cut -c1-12)
net1_dev="br-${net1_dev}"
net2_dev="br-${net2_dev}"

iptables-save > .iptables_config

# Allow packets out across bridge
iptables -I DOCKER-ISOLATION-STAGE-1 -i $net1_dev -d 192.168.4.0/24 -j RETURN
iptables -I DOCKER-ISOLATION-STAGE-1 -i $net2_dev -d 192.168.3.0/24 -j RETURN

# Allow packets in across bridge
iptables -I DOCKER-ISOLATION-STAGE-1 -i $net1_dev -s 192.168.4.0/24 -j RETURN
iptables -I DOCKER-ISOLATION-STAGE-1 -i $net2_dev -s 192.168.3.0/24 -j RETURN
echo "iptables configured!"
