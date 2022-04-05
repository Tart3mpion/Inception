#!/bin/bash
rm -rf /var/www/html
file=/var/www/html/wp*
if [ ! -f "$file" ]; then
    mkdir -p /var/www/html && cd /var/www/html/ && wp core download --allow-root
    # && wp config create --dbname=wp_data --dbuser=db_user --dbpass=db_pass --dbhost=ldes-cou.42.fr --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root \
    # && wp core install --url=ldes-cou.42.fr/wordpress --title=my superduper site --admin_user=ldes-cou --admin_password=Hello --admin_email=ldes-cou@student.42.fr --skip-email --allow-root \
    # && wp user create lulu ldes-cou@student.42.fr --role=author --user_pass=coucou --allow-root \
    # && wp theme install Spacious --activate --allow-root \
else
    echo "LOL"
fi

php-fpm7.3 -F -R