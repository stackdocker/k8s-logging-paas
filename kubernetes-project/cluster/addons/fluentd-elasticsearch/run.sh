#!/bin/bash
export NODE_MASTER=${NODE_MASTER:-true}
export NODE_DATA=${NODE_DATA:-true}
export HTTP_PORT=${HTTP_PORT:-9200}
export TRANSPORT_PORT=${TRANSPORT_PORT:-9300}
ADDR=$(ip addr show eth0 | grep "inet " | awk '{print $2}' | cut -d'/' -f1)
echo "discovery.zen.ping.unicast.hosts: [${ADDR}]" >> /elasticsearch-1.5.2/config/elasticsearch.yml
/elasticsearch-1.5.2/bin/elasticsearch
