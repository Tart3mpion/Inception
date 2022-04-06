
if [ ! -d /var/lib/mysql/${MYSQL_DB} ]; then
    mysqld&
    until mysqladmin ping;do
        sleep 2
    done
    echo "caca prout"
    mysql -u root -e "CREATE DATABASE $MYSQL_DB;" 
    mysql -u root -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWORD';" 
    mysql -u root -e "GRANT ALL ON $MYSQL_DB.* TO '$MYSQL_USER'@'%';"
    mysql -u root -e "FLUSH PRIVILEGES;"
    killall mysqld
fi
mysqld