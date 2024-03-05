FROM alpine:3.13

RUN	apk update && apk upgrade && apk add --no-cache \
        nginx \
        openssl

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/tserdet.pem \
        -keyout /etc/nginx/ssl/tserdet.key \
        -subj "/C=IT/ST=Mulhouse/L=Mulhouse/O=42 School/OU=tserdet/CN=tserdet/"

RUN mkdir -p /run/nginx
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

ENTRYPOINT ["nginx", "-g", "daemon off;"]