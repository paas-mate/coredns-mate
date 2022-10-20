FROM ttbb/coredns:nake

COPY docker-build /opt/coredns/mate

WORKDIR /opt/coredns

CMD ["/usr/bin/dumb-init", "bash", "-vx", "/opt/coredns/mate/scripts/start.sh"]
