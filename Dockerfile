FROM nginx:1.27.4-alpine

COPY ./build/web /usr/share/nginx/html

COPY nginx.conf /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]