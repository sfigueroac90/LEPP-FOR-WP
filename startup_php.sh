echo "<*****>STARTING UP PHP<*****>"
#https://www.linuxtechi.com/install-php-on-centos-8-rhel-8/
#https://www.hostinger.co/tutoriales/como-instalar-stack-nginx-mysql-php-v7-lemp-en-centos-7/
#https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-on-centos-8-es

sudo dnf install epel-release -y
sudo dnf install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y
sudo dnf module list php -y
sudo dnf module enable php:remi-7.4 -y
sudo dnf install php php-cli php-common -y
#sudo dnf install -y php-mysql
sudo yum install php-pgsql -y
#sudo sed -i 's/apache/nginx/g' /etc/php-fpm.d/www.conf
sed -i 's/user = apache/user = nginx/g' /etc/php-fpm.d/www.conf
sed -i 's/group = apache/group = nginx/g' /etc/php-fpm.d/www.conf


#Create php test
#sudo chown -R ${USER}.${USER} /usr/share/nginx/html/
echo '<?php

phpinfo(); 

?>' > /usr/share/nginx/html/info.php

sudo systemctl start php-fpm
sudo systemctl enable php-fpm
#vagrasudo systemctl restart httpd
#Verifing php-fpm is running
sudo systemctl status php-fpm.service
sudo systemctl restart nginx
php -v

# sudo nano /etc/nginx/conf.d/default.conf