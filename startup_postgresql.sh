# https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-centos-8-es

sudo dnf module list postgresql
sudo dnf module -y enable postgresql:9.6

#Tras habilitar el flujo de módulo de la versión 9.6, puede instalar el paquete postgresql-server para instalar PostgresSQL 12 y todas sus dependencias:
sudo dnf install -y postgresql-server
sudo postgresql-setup --initdb

sudo systemctl start postgresql
sudo systemctl enable postgresql

sudo -u postgres createuser app_dbeduvialwp
sudo -u postgres psql -c "create user app_dbeduvialwp with password 'explora'"
sudo -u postgres psql -c "create database dbeduvialwp"
sudo -u postgres psql -c 'grant all privileges on database dbeduvialwp to app_dbeduvialwp'
sudo -u postgres psql -c '\l'

# On postgresql run this
#grant all privileges on database your_database to your_user;