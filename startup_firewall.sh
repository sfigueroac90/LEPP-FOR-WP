#!/bin/sh
echo "<¬¬¬¬¬>STARTING UP FIREWALLD<¬¬¬¬¬>"
echo "https://www.digitalocean.com/community/tutorials/how-to-set-up-a-firewall-using-firewalld-on-centos-8-es"
systemctl enable firewalld
systemctl start firewalld
firewall-cmd --zone=public --permanent --add-service=http
firewall-cmd --zone=public --permanent --add-service=https
 
firewall-cmd --zone=public --permanent --add-port=80/tcp
firewall-cmd --zone=public --permanent --add-port=20-21/tcp
firewall-cmd --zone=public --permanent --add-port=3000-3100/tcp
firewall-cmd --zone=public --permanent --add-port=5000-5100/tcp
firewall-cmd --zone=public --permanent --add-port=9000-9100/tcp
firewall-cmd --zone=public --permanent --add-port=30000-31000/tcp
echo "<¬¬¬¬¬>FIREWALLD STATE>"
firewall-cmd --state
echo "<¬¬¬¬¬>FIREWALLD RELOAD"
firewall-cmd --reload
echo "<¬¬¬¬¬>FIREWALLD OPEN PORTS"
firewall-cmd --zone=public --list-ports --permanent
echo "<¬¬¬¬¬>FIREWALLD SERVICES"
firewall-cmd --zone=public --list-services --permanent
echo "<¬¬¬¬¬>FIREWALLD DEFAULT ZONE>"
firewall-cmd --get-default-zone
echo "<¬¬¬¬¬>FIREWALLD ACTIVE ZONE>"
firewall-cmd --get-active-zones
echo "<¬¬¬¬¬>FIREWALLD LIST>"
firewall-cmd --list-all