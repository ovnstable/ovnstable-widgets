#!/bin/bash


token=$1
url=$2
deploySSH=$3
tag=1


cd maincards || exit

npm install
npm run build

cd ..
find maincards/dist/js/ -type f -name '*.js' -exec sh -c 'x="{}"; mv "$x" "maincards/dist/js/maincards.js"' \;


cd apyrate || exit

npm install
npm run build

cd ..
find apyrate/dist/js/ -type f -name '*.js' -exec sh -c 'x="{}"; mv "$x" "apyrate/dist/js/apyrate.js"' \;


cd distrate || exit

npm install
npm run build

cd ..
find distrate/dist/js/ -type f -name '*.js' -exec sh -c 'x="{}"; mv "$x" "distrate/dist/js/distrate.js"' \;


cd portfoliocards || exit

npm install
npm run build

cd ..
find portfoliocards/dist/js/ -type f -name '*.js' -exec sh -c 'x="{}"; mv "$x" "portfoliocards/dist/js/portfoliocards.js"' \;


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
  ssh $url docker-compose -f /root/common/docker-compose.yaml up -d --no-deps widget
  ssh $url docker logs widget -f
fi




