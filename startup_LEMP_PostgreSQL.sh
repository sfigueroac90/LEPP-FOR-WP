#//Linux 
#//Nginx
#//MariaDB
#//PHP
#https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-centos-8-es
#https://medium.com/@shoaibhassan_/install-wordpress-with-postgresql-using-apache-in-5-min-a26078d496fb
#Paso 1: Instalar PostgreSQL
sudo dnf module list postgresql
sudo dnf module -y enable postgresql:9.6
#Tras habilitar el flujo de módulo de la versión 12, puede instalar el paquete postgresql-server para instalar PostgresSQL 12 y todas sus dependencias:
sudo dnf install -y postgresql-server

#Paso 2: Crear un nuevo clúster de base de datos para PostgreSQL
sudo postgresql-setup --initdb
sudo systemctl start postgresql
sudo systemctl enable postgresql

#Paso 3: Usar roles y bases de datos de PostgreSQL
sudo -i -u postgres