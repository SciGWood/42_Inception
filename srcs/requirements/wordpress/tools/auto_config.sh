sleep 10

if [ ! -e /var/www/html/wp-config.php ]; then
	wp core download --allow-root
	sleep 5
	cd /var/www/html
	wp config create --allow-root \
			 --dbname=${MYSQL_DATABASE} \
			 --dbuser=${MYSQL_USER} \
			 --dbpass=${MYSQL_PASSWORD} \
			 --dbhost=mariadb:3306 \
			 --path="/var/www/html" \

	 wp core install --allow-root \
			 --url=${DOMAIN_NAME} \
		 	 --title=${SITE_TITLE} \
			 --admin_user=${ADMIN_USER} \
			 --admin_password=${ADMIN_PASSWORD} \
			 --admin_email=${ADMIN_EMAIL} \
			 --skip-email \
			 --path="/var/www/html" \
	 
	 wp user create  --allow-root \
			 ${USER1_LOGIN} \
		 	 ${USER1_EMAIL} \
			 --user_pass=${USER1_PASS} \
			 --role="editor" \
			 --display_name=${USER1_LOGIN} \
			 --porcelain \
			 --path="/var/www/html" \

fi

wp theme install twentytwentytwo --activate --allow-root --path="/var/www/html"

exec "$@"
#exec /usr/sbin/php-fpm7.4 -F


#usage: wp user create <user-login> <user-email> [--role=<role>] [--user_pass=<password>] [--user_registered=<yyyy-mm-dd-hh-ii-ss>] [--display_name=<name>] [--user_nicename=<nice_name>] [--user_url=<url>] [--nickname=<nickname>] [--first_name=<first_name>] [--last_name=<last_name>] [--description=<description>] [--rich_editing=<rich_editing>] [--send-email] [--porcelain]
