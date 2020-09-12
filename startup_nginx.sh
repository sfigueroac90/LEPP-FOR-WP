#!/bin/sh
echo "<------>STARTING UP NGINX<------>"
echo "<------>https://www.linode.com/docs/development/nodejs/how-to-install-nodejs-and-nginx-on-centos-8/"
echo "<------>https://linuxconfig.org/install-nginx-on-redhat-8"
echo "<------>https://www.cyberciti.biz/faq/how-to-install-and-use-nginx-on-centos-7-rhel-7/"
# Install NGINX, the command line utilities tmux, and tar.
echo "<------>Installing NGINX"
#dnf update -y
dnf install -y nginx tmux tar
# Start the Nginx service:
echo "<------>Starting NGINX"
systemctl start nginx
echo "<------>Enablig NGINX"
systemctl enable nginx
echo "<------>Checking NGINX response"
curl http://localhost/
echo "<------>Creating NGINX directories"
mkdir -p /etc/nginx/{sites-available,sites-enabled}
mkdir -p /var/www
