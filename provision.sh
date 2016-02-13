#!/bin/bash

# Refs:
# 1. http://code.tutsplus.com/tutorials/zero-to-sixty- \
#    creating-and-deploying-a-rails-app-in-under-an-hour--net-8252
#
# 2. http://stackoverflow.com/questions/29132891/ \
#    vagrant-virtualbox-vm-provisioning-rbenv-installs-successfully-but-subsequent-u

SECONDS=0

echo
echo '============================'
echo '1. Packages'

sudo apt-get -y update
sudo apt-get install -y curl git python-software-properties zlib1g-dev build-essential \
   libssl-dev libreadline-dev libyaml-dev libsqlite3-dev \
   sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev \
   python-software-properties libffi-dev

echo
echo '============================'
echo '2. rbenv'

git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
mkdir -p ~/.rbenv/plugins
mkdir -p ~/.rbenv/shims
mkdir -p ~/.rbenv/versions
chown vagrant:vagrant ~/.rbenv

git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash

echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc

echo
echo '============================'
echo '3. Install Ruby and Rails'

sudo -H -u vagrant bash -i -c 'rbenv install 2.1.3'
sudo -H -u vagrant bash -i -c 'rbenv rehash'
sudo -H -u vagrant bash -i -c 'rbenv global 2.1.3'
sudo -H -u vagrant bash -i -c 'gem install bundler --no-ri --no-rdoc'
sudo -H -u vagrant bash -i -c 'gem install rails --no-ri --no-rdoc'
sudo -H -u vagrant bash -i -c 'rbenv rehash'

echo
echo "Completed in $SECONDS seconds."
