FROM nginx:1.9

COPY ./app.conf /etc/nginx/app.conf
COPY ./openid.conf /etc/nginx/openid.conf