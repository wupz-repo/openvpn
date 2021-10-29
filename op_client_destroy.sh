#!/bin/env bash

read -p "Please enter a client name : " CLIENTNAME

docker-compose run --rm openvpn ovpn_revokeclient $CLIENTNAME remove && rm -rf conf/clients/$CLIENTNAME