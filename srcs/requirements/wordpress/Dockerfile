FROM debian:bullseye

#Install php, wget and mariadb-client
RUN apt-get update && apt-get upgrade -y
RUN apt-get install wget -y
RUN apt-get install -y php7.4 \
php-fpm \
php-mysql \
php-intl \
mariadb-client

#Download wordpress and place its folder in /var/www/html
RUN wget https://wordpress.org/wordpress-6.4.3.tar.gz -P /var/www
RUN cd /var/www && tar -xvf wordpress-6.4.3.tar.gz && rm wordpress-6.4.3.tar.gz
RUN mv /var/www/wordpress /var/www/html

#Grant folder access to root
RUN chown -R root:root /var/www/html

#Replace wordpress config file
COPY conf/php-fpm.conf /etc/php/7.4/fpm/php-fpm.conf
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

#Install WP CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN chmod 755 /usr/local/bin/wp

RUN wp cli update

#Create /run/php/ directory
RUN mkdir /run/php/
RUN chmod 755 /run/php

#Expose port 9000
EXPOSE 9000

#Run wordpress launch script
COPY tools/auto_config.sh /tmp/auto_config.sh
RUN chmod +x /tmp/auto_config.sh
ENTRYPOINT ["bash", "/tmp/auto_config.sh"]
CMD ["/usr/sbin/php-fpm7.4", "-F"]
#CMD ["tail", "-f"]
