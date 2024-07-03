#!/bin/bash

containerlab --runtime podman deploy --reconfigure --topo routemapped-reflector-multinet.clab.yaml

podman network create --ignore --subnet=172.30.30.0/24 net2
podman network connect --ip 172.30.30.100 net2 clab-routemapped-reflector-multinet-reflector
podman network connect --ip 172.30.30.101 net2 clab-routemapped-reflector-multinet-node1
podman network connect --ip 172.30.30.102 net2 clab-routemapped-reflector-multinet-node2
podman network connect --ip 172.30.30.111 net2 clab-routemapped-reflector-multinet-ext-ibgp
podman network connect --ip 172.30.30.112 net2 clab-routemapped-reflector-multinet-ext-ebgp
