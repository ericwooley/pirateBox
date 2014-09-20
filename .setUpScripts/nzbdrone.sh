sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FDA5DFFC
echo "deb http://update.nzbdrone.com/repos/apt/debian master main" | sudo tee -a /etc/apt/sources.list
sudo apt-get update;
sudo apt-get install nzbdrone sqlite -y;

# Autostart nzbdrone
sudo echo 'author "Simon Tallmyr - Nosscire"
description "Upstart Script to run NzbDrone as a service on Ubuntu/Debian based systems, as well as others"

#Set username for the process. Should probably be what you use for logging in
setuid vagrant 

#This is the install directory. If you installed using a deb package or the NzbDrone Repository you do not need to change this
env DIR=/opt/NzbDrone

setgid nogroup
start on runlevel [2345]
stop on runlevel [016]

respawn

exec mono $DIR/NzbDrone.exe' | sudo tee --append /etc/init/nzbdrone.conf
sudo chmod +x /etc/init/nzbdrone.conf

sudo start nzbdrone
sleep 30 #wait for nzbdrone to initialize db
source /vagrant/settings.sh
source renderedSettings.sh

#connect to nzb
sed "s/SABAPIKEY/$SABAPIKEY/g" /vagrant/.setUpScripts/nzbdrone.sql > nzbdrone.sql
sed -i "s/INDEXER_NAME/$INDEXER_NAME/g" nzbdrone.sql; 
sed -i "s#INDEXER_URL#$INDEXER_URL#g" nzbdrone.sql;
sed -i "s/INDEXER_APIKEY/$INDEXER_APIKEY/g" nzbdrone.sql;
sqlite3 .config/NzbDrone/nzbdrone.db < nzbdrone.sql
# rm nzbdrone.sql
