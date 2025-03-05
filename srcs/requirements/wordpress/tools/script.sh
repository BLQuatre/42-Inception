#!/bin/sh

set -e

export HTTP_HOST=${DOMAIN_NAME}

while ! mariadb -h mariadb -u ${WP_SQL_USER} -p${WP_SQL_PASSWORD} -e "SELECT 1" &>/dev/null; do
	sleep 2
done

if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
	wp config create \
		--allow-root \
		--dbname=${WP_SQL_DATABASE} \
		--dbuser=${WP_SQL_USER} \
		--dbpass=${WP_SQL_PASSWORD} \
		--dbhost=mariadb \
		--locale=fr_FR
fi

if ! wp core is-installed; then
	wp core install \
		--url=${DOMAIN_NAME}/ \
		--title=${WP_TITLE} \
		--admin_user=${WP_ADMIN_USER} \
		--admin_password=${WP_ADMIN_PASSWORD} \
		--admin_email=${WP_ADMIN_EMAIL} \
		--skip-email \
		--allow-root
fi

if ! wp user exists ${WP_USER_USER}; then
	wp user create ${WP_USER_USER} ${WP_USER_EMAIL} \
		--role=author \
		--user_pass=${WP_USER_PASSWORD} \
		--allow-root
fi

if ! wp theme is-installed astra; then
	wp theme install astra \
		--allow-root
fi

if ! wp theme is-active astra; then
	wp theme activate astra \
		--allow-root
fi

wp config has WP_REDIS_HOST || wp config set WP_REDIS_HOST "redis"
wp config has WP_REDIS_PORT || wp config set WP_REDIS_PORT 6379 --raw
wp config has WP_CACHE || wp config set WP_CACHE true --raw

if ! wp plugin is-installed redis-cache; then
	wp plugin install redis-cache \
		--allow-root
fi

if ! wp plugin is-active redis-cache; then
	wp plugin activate redis-cache \
		--allow-root
fi

wp redis enable \
	--allow-root

mkdir -p /run/php

/usr/sbin/php-fpm83 -F
