FROM alpine:latest

RUN apk add --no-cache \
    bash \
    ca-certificates \
    curl \
    ip6tables \
    iptables \
    jq \
    openssl \
    wireguard-tools

WORKDIR /manual-connections
COPY manual-connections/* /manual-connections/ 
COPY run.sh run.sh
CMD ./run.sh
