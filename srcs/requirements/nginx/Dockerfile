FROM alpine:3.13

RUN	apk update && apk upgrade && apk add --no-cache
RUN     apk update && apk upgrade && apk add --no-cache nginx
RUN     apk update && apk upgrade && apk add --no-cache openssl

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes 
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/tserdet.pem
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -keyout /etc/nginx/ssl/tserdet.key
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login"

RUN mkdir -p /run/nginx
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

ENTRYPOINT ["nginx", "-g", "daemon off;"]