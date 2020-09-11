#!/bin/sh
#https://www.linuxtechi.com/install-vsftpd-server-centos-8-rhel-8/
#https://artisansweb.net/ftp-sftp-extension-for-visual-studio-code/#:~:text=Open%20the%20project%20in%20the,select%20the%20SFTP%3Aconfig%20option.
#https://community.centminmod.com/threads/ftp-command-not-found.13091/
yum install -y ftp

#Step 1) Install vsftpd using dnf command
#Right off the bat, we are going to install vsftpd. To achieve this, we will run the command below:
sudo dnf install -y vsftpd
#o confirm this, execute the following command:
rpm -q vsftpd
rpm -qi vsftpd
#To start the vsftpd service, run the command:
sudo systemctl start vsftpd
#You may also want to enable it to start automatically upon a reboot. To achieve this, run the command
sudo systemctl enable vsftpd --now
#To verify the status of vsftpd on your system, run:
sudo systemctl status vsftpd
#If you see the “active: (running)” directive in green as indicated on the terminal, then the vsftpd service is up and running.

#Step 2) Create a ftp user and its directory
#Next, we will create a user that we will use to access the FTP server. In this case, the user will be ftpuser but feel free to give your user a name of your choice.
sudo adduser ftpalejo
sudo passwd ftpalejo
#With the FTP user in place, we will proceed and create the FTP directory and assign the following permissions and directory ownership.
sudo mkdir -p /home/ftpalejo/ftp_dir
sudo chmod -R 750 /home/ftpalejo/ftp_dir
sudo chown -R ftpalejo: /home/ftpuser/ftp_dir
#We also need to add the FTP user to the /etc/vsftpd/user_list file to allow the user access to the vsftp server.
$ sudo bash -c 'echo ftpalejo >> /etc/vsftpd/user_list'

#Step 3) Configure vsftpd via its configuration file
yum install ftp

#Step 4) Configure SSL / TLS for vsftpd
#To encrypt communications between the server and a client system, we need to generate a TLS certificate and later configure the server to use it.
#To generate the certificate, run the command below: