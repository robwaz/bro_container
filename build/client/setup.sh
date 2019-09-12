#!/bin/bash
ip route del default
ip route add default via 192.168.4.3
exec /bin/bash

