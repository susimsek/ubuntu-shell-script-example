wget https://dev.mysql.com/get/mysql-apt-config_0.8.13-1_all.deb
sudo apt-get install -y dpkg
sudo dpkg -i mysql-apt-config_0.8.13-1_all.deb
sudo apt-get -y update
sudo apt-get -y install mysql-server
service mysql start
sudo mysql_secure_installation
cp mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
mysql -p -u root -Bse "CREATE USER 'suayb'@'localhost' IDENTIFIED BY 'root';CREATE USER 'suayb'@'%' IDENTIFIED BY 'root';GRANT ALL ON *.* TO 'suayb'@'localhost';GRANT ALL ON *.* TO 'suayb'@'%';CREATE DATABASE keycloak CHARACTER SET utf8 COLLATE utf8_general_ci;FLUSH PRIVILEGES;"
service mysql restart
rm mysql-apt-config_0.8.13-1_all.deb
#mysql --version
#netstat -nlt | grep 3306