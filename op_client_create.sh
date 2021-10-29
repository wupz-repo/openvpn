#!/bin/env bash

read -p "Please enter a client name : " CLIENTNAME

docker-compose run --rm openvpn easyrsa build-client-full ${CLIENTNAME} nopass
docker-compose run --rm openvpn ovpn_getclient ${CLIENTNAME} combined-save
echo "User ${CLIENTNAME} has been created successfully !"
