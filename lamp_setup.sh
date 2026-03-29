#!/bin/bash
REPO_PATH="$(pwd)"

sudo rm -rf /var/www/html
sudo ln -s "$REPO_PATH" /var/www/html
sudo chmod -R 755 "$REPO_PATH"

sudo service mariadb start
echo "MariaDB started"
sudo mariadb -u root < db_setup.sql
echo "Database loaded"
sudo service apache2 start
echo "Apache started"

echo "Symlink created: $REPO_PATH -> /var/www/html"
