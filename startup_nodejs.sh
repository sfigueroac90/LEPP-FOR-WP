#!/bin/sh
echo "<+++++>STARTING UP NODEJS<+++++>"
echo "<+++++>https://www.tecmint.com/install-node-js-in-rhel-8/"
echo "<+++++>Installing Node.js on RHEL 8"
# 1. To install the latest version of Node.js, you need to install development tools such as make, git, gcc on your system using the following dnf command.
dnf groupinstall "Development Tools" 
# 2. Next, check the available Node.js package contained in the Application Stream Repository using the following command.
dnf module list nodejs
# 3. Next, install the default Node.js module by running the following command.
dnf module install -y nodejs
# If you are a developer, you can use the development profile to install the libraries that enable you to build dynamically loadable modules, as follows:
dnf module install -y nodejs/development
# 4. To install a minimal set of Node.js packages, run the following command.
dnf module install -y nodejs/minimal
# 5. Once you have installed Node.js on your system, use the following commands to check the version and location of the nodejs.
echo "<+++++>Is NodeJS Installed?"
node -v
npm -v
which node 
which npm
echo "https://linuxize.com/post/how-to-install-yarn-on-centos-8/"
echo "<+++++>Installing yarn"

# 1. Enable the Yarn repository and import the repository’s GPG key
curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
rpm --import https://dl.yarnpkg.com/rpm/pubkey.gpg
# 2. Enable the Yarn repository and import the repository’s GPG key:
dnf install -y yarn
# 3. Verify the installation by printing the Yarn version number
yarn --version