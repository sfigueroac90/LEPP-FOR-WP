##Install wp-cli https://www.linode.com/docs/websites/cms/wp-cli/how-to-install-wordpress-using-wp-cli-on-centos-7/
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp
#
##Allow bash completion
sudo yum -y install -y wget
cd ~
wget https://github.com/wp-cli/wp-cli/raw/master/utils/wp-completion.bash
sudo echo source /home/$USER/wp-completion.bash >> ~/.bashrc
sudo source ~/.bashrc
sudo echo autoload bashcompinit >> ~/.zshrc
sudo echo bashcompinit >> ~/.zshrc
sudo echo source /home/$USER/wp-completion.bash >> ~/.zshrc
source ~/.zshrc