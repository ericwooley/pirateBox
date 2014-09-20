#!/usr/bin/env bash

sudo apt-get -y install git-core python python-cheetah
git clone git://github.com/RuudBurger/CouchPotatoServer.git .couchpotato
sudo cp .couchpotato/init/ubuntu /etc/init.d/couchpotato
sudo chmod +x /etc/init.d/couchpotato

sed -i "s/CP_HOME=/CP_HOME=\/home\/vagrant\/.couchpotato/g" .couchpotato/init/ubuntu.default
echo "
CP_DATA=/home/vagrant/.couchpotato/" >> .couchpotato/init/ubuntu.default
sudo cp .couchpotato/init/ubuntu.default /etc/default/couchpotato
sudo chmod +x /etc/default/couchpotato
sudo update-rc.d couchpotato defaults

source /vagrant/settings.sh
source renderedSettings.sh

sudo cp /vagrant/.setupScripts/couchPotato/settings.conf .couchpotato/settings.conf
sudo sed -i "s#SABAPIKEY#$SABAPIKEY#g" .couchpotato/settings.conf
sudo sed -i "s#NZBINDEXER#$INDEXER_URL#g" .couchpotato/settings.conf
sudo sed -i "s#NZBAPIKEY#$INDEXER_APIKEY#g" .couchpotato/settings.conf
sudo /etc/init.d/couchpotato start