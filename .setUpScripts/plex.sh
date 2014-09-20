#!/usr/bin/env bash
wget http://plexapp.com/plex_pub_key.pub;
sudo apt-key add plex_pub_key.pub
rm plex_pub_key.pub

echo "deb http://plex.r.worldssl.net/PlexMediaServer/ubuntu-repo lucid main" | sudo tee --append /etc/apt/sources.list

sudo apt-get update;
sudo apt-get install avahi-daemon plexmediaserver -y --force-yes;