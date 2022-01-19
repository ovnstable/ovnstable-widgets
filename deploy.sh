#!/bin/bash


token=$1
url=$2
deploySSH=$3
tag=1

cd polybor || exit

npm install
npm run build

cd ..
find polybor/dist/js/ -type f -name '*.js' -exec sh -c 'x="{}"; mv "$x" "polybor/dist/js/polybor.js"' \;


cd rate || exit

npm install
npm run build

cd ..
find rate/dist/js/ -type f -name '*.js' -exec sh -c 'x="{}"; mv "$x" "rate/dist/js/rate.js"' \;


cd table || exit

npm install
npm run build

cd ..
find table/dist/js/ -type f -name '*.js' -exec sh -c 'x="{}"; mv "$x" "table/dist/js/table.js"' \;


cd doughnut || exit

npm install
npm run build

cd ..
find doughnut/dist/js/ -type f -name '*.js' -exec sh -c 'x="{}"; mv "$x" "doughnut/dist/js/doughnut.js"' \;


docker build . -t cr.yandex/crpg11k469bhc8lch9gm/overnight/widget:$tag


docker login \
         --username oauth \
         --password $token \
        cr.yandex

docker push  cr.yandex/crpg11k469bhc8lch9gm/overnight/widget:$tag


if [[ "$deploySSH" == "ssh" ]];  then

  ssh $url docker login \
           --username oauth \
           --password $token \
          cr.yandex

  ssh $url docker pull cr.yandex/crpg11k469bhc8lch9gm/overnight/widget:$tag
  ssh $url docker-compose -f /root/ovn/docker-compose.yaml up -d --no-deps widget
  ssh $url docker logs ovn-widget -f
fi




