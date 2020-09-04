#!/bin/sh
#https://www.linode.com/docs/development/nodejs/how-to-install-nodejs-and-nginx-on-centos-8/co
echo "<¬¬¬¬¬>CREATING TESTING REACT APP<¬¬¬¬¬>"
mkdir /home/vagrant/documents
cd /home/vagrant/documents
npx create-react-app testapp
cd testapp
yarn add serve
yarn build 
# copying folder
cp -r build/ /var/www/    
# renaming "build" folder on /var/www/ to "testapp"                                                  
mv /var/www/build /var/www/testapp.com
# yarn serve -s build 
chown nginx:nginx /var/www/testapp.com
chmod -R 775 /var/www/testapp.com 
chcon -t httpd_sys_content_t /var/www/testapp.com -R
chcon -t httpd_sys_rw_content_t /var/www/testapp.com -R
sudo ln -s /etc/nginx/sites-available/testapp.com /etc/nginx/sites-enabled/