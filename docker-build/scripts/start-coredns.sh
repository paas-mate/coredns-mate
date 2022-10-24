#!/bin/bash
rmem-size=""
wmem-size=""
if [ -n "$RMEM_SIZE" ]; then
    rmem-size="-rmem=udp#'${RMEM_SIZE}'"
fi
if [ -n "$WMEM_SIZE" ]; then
    wmem-size="-wmem=udp#'${WMEM_SIZE}'"
fi
if [ -z "$COREDNS_DELVE_DEBUG" ] || [ $COREDNS_DELVE_DEBUG == "false" ]; then
    coredns -conf=/opt/coredns/Corefile ${rmem-size} ${wmem-size}
else
    nohup dlv --listen=:2345 --headless=true --api-version=2 exec coredns -conf=/opt/coredns/Corefile ${rmem-size} ${wmem-size}
fi

