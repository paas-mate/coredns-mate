#!/bin/bash

if [ -z "$COREDNS_DELVE_DEBUG" ] || [ $COREDNS_DELVE_DEBUG == "false" ]; then
    coredns -conf=/opt/coredns/Corefile
else
    nohup dlv --listen=:2345 --headless=true --api-version=2 exec coredns -conf=/opt/coredns/Corefile
fi
