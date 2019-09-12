#!/bin/bash
tmuxinator local

# kill any rogue containers
echo "Killing containers"
docker kill $(docker ps | grep bro_ | cut -d" " -f1)
# restore iptables settings
echo -e "You can restore iptables to their original state via\n"
echo -e "sudo iptables-restore < .iptables_config\n"
echo "DONE"
