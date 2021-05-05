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

now_sleep

