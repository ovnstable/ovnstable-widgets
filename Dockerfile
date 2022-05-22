FROM nginx:stable-alpine as production-stage

COPY maincards/dist/ /usr/share/nginx/html
COPY apyrate/dist/ /usr/share/nginx/html
COPY distrate/dist/ /usr/share/nginx/html
COPY portfoliocards/dist/ /usr/share/nginx/html

COPY prod_nginx.conf /etc/nginx/nginx.conf
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
