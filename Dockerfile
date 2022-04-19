FROM nginx:stable-alpine as production-stage
COPY polybor/dist/ /usr/share/nginx/html
COPY rate/dist/ /usr/share/nginx/html
COPY doughnut/dist/ /usr/share/nginx/html
COPY maincards/dist/ /usr/share/nginx/html
COPY table/dist/ /usr/share/nginx/html
COPY prod_nginx.conf /etc/nginx/nginx.conf
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
