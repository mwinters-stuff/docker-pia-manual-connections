FROM alpine:latest

RUN apk add --no-cache \
    bash \
    ca-certificates \
    curl \
    ip6tables \
    iptables \
    jq \
    git \
    openssl \
    wireguard-tools \
    ncurses

WORKDIR /
#COPY manual-connections/* /manual-connections/ 
RUN git clone --depth=1 https://github.com/pia-foss/manual-connections.git
WORKDIR /manual-connections
COPY run.sh run.sh
CMD ./run.sh
