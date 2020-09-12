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

sudo chown ${USER}:${USER} /etc/nginx/conf.d

sudo echo '

server {
    listen   80;
    server_name  your_server_ip;

    # note that these lines are originally from the "location /" block
    root   /usr/share/nginx/html;
    index index.php index.html index.htm;

    location / {
        try_files $uri $uri/ =404;
    }
    error_page 404 /404.html;
    error_page 500 502 503 504 /50x.html;
    location = /50x.html {
        root /usr/share/nginx/html;
    }

    location ~ \.php$ {
        try_files $uri =404;
        fastcgi_pass unix:/var/run/php-fpm/php-fpm.sock;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }
}

' > /etc/nginx/conf.d/default.conf

sudo chown nginx:nginx /etc/nginx/conf.d
sudo chown nginx:nginx /etc/nginx/conf.d/*

#Replace apache with nginx
sed -i 's/apache/nginx/g' /etc/php-fpm.d/www.conf


#Create php test
sudo chown -R ${USER}.${USER} /usr/share/nginx/html/


echo '<?php

phpinfo(); 

?php>' > /usr/share/nginx/html/info.php

sudo systemctl start php-fpm
sudo systemctl enable php-fpm
sudo systemctl restart httpd
#Verifing php-fpm is running
sudo systemctl status php-fpm &
php -v




# sudo nano /etc/nginx/conf.d/default.conf