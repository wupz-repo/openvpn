#!/bin/env bash

read -p "Please enter the host domain name or address : " DOMAIN

docker-compose run --rm openvpn ovpn_genconfig -u udp://${DOMAIN}
docker-compose run --rm openvpn ovpn_initpki
