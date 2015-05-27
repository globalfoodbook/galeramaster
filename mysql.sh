#!/bin/bash

mysqld --wsrep-new-cluster &
sleep 5
mysql -uroot -e "CREATE DATABASE $MARIADB_DATABASE"
mysql -uroot -e "CREATE USER $MARIADB_USER@'%' IDENTIFIED BY $MARIADB_PASSWORD"
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO $MARIADB_USER@'%' WITH GRANT OPTION"

mysqladmin -uroot shutdown
