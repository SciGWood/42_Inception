FROM debian:bullseye

#Install nginx and openSSL
RUN apt-get update && apt-get upgrade -y
RUN apt-get install nginx -y
RUN apt-get install vim -y
RUN apt-get install curl -y
RUN apt-get install openssl -y

#Create SSL directory
RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=Perpignan/L=Perpignan/O=42/OU=gdetourn/CN=gdetourn@student.42perpignan.fr/UID=${USER}"

#Create a config directory
RUN mkdir -p /var/run/nginx

#Grant privileges to root and main user
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

#Replace config file
COPY /conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;"]
