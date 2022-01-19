#!/bin/bash

token=$1
tag=1

docker login \
         --username oauth \
         --password $token \
        cr.yandex

docker pull cr.yandex/crpg11k469bhc8lch9gm/overnight/widget:$tag
docker-compose -f /root/ovn/docker-compose.yaml up -d --no-deps widget
