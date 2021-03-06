#!/bin/bash

finish() {
  wg-quick down pia
  exit 0
}

trap finish SIGTERM SIGINT SIGQUIT

# All done. Sleep and wait for termination.
now_sleep () {
  sleep infinity &
  wait $!
}

./run_setup.sh

if [ -n "$LOCAL_NETWORK" ]; then
  for range in ${LOCAL_NETWORK//,/ }; do
    if [ $FIREWALL -eq 1 ]; then
      echo "$(date): Allowing network access to $range"
      iptables -A OUTPUT -o eth0 --destination $range -j ACCEPT
      iptables -A INPUT -i eth0 --source $range -j ACCEPT
    fi
    echo "$(date): Adding route to $range"
    ip route add $range via $(ip route show 0.0.0.0/0 dev eth0 | cut -d\  -f3)
  done
fi

now_sleep

