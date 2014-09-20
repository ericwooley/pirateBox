#!/usr/bin/env bash
echo "deb http://ppa.launchpad.net/jcfp/ppa/ubuntu $(lsb_release -c -s) main" | sudo tee -a /etc/apt/sources.list && sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:11371 --recv-keys 0x98703123E0F52B2BE16D586EF13930B14BB9F05F

sudo apt-get update;
sudo apt-get install sabnzbdplus -y;
# Setup sabnzbd
sudo sed -i 's/USER=/USER=vagrant/g' /etc/default/sabnzbdplus
sudo sed -i 's/HOST=/HOST=0.0.0.0/g' /etc/default/sabnzbdplus
sudo sed -i 's/PORT=/PORT=8080/g' /etc/default/sabnzbdplus
source /vagrant/settings.sh

mkdir /home/vagrant/.sabnzbd;
chmod -R 777 /home/vagrant/.sabnzbd
touch /home/vagrant/.sabnzbd/sabnzbd.ini;
sudo echo "__version__ = 19
[misc]
win_menu = 1
queue_complete = \"\"
https_port = 9090
replace_spaces = 0
allow_64bit_tools = 1
local_range = \"\"
password_file = \"\"
movie_rename_limit = 100M
ionice = \"\"
https_key = server.key
cleanup_list = ,
cache_limit = \"\"
rating_enable = 1
ignore_unrar_dates = 0
par_option = \"\"
web_color = gold
enable_recursive = 1
pre_check = 0
folder_rename = 1
web_color2 = \"\"
dirscan_speed = 5
enable_filejoin = 1
create_group_folders = 0
api_key = $SABAPIKEY
rating_feedback = 1
no_penalties = 0
randomize_server_ip = 0
osx_speed = 1
bandwidth_limit = 0
dirscan_dir = \"\"
disable_api_key = 0
quota_period = m
email_to = ,
rss_filenames = 0
password = vagrant
permissions = 755
quota_day = \"\"
auto_disconnect = 1
use_pickle = 0
https_chain = \"\"
warn_empty_nzb = 1
history_limit = 50
enable_date_sorting = 0
replace_dots = 0
movie_sort_extra = -cd%1
quota_size = \"\"
rss_rate = 60
enable_unzip = 1
download_free = \"\"
port = 8080
enable_movie_sorting = 0
wait_ext_drive = 5
pre_script = None
ipv6_servers = 1
email_full = 0
log_dir = logs
show_sysload = 2
admin_dir = admin
nzb_backup_dir = \"\"
tv_sort_countries = 1
date_categories = tv,
ssl_type = v23
sfv_check = 1
date_sort_string = \"\"
schedlines = ,
host = 0.0.0.0
email_rss = 0
sanitize_safe = 0
req_completion_rate = 100.2
enable_tsjoin = 1
auto_browser = 0
fsys_type = 0
pause_on_post_processing = 0
allow_incomplete_nzb = 0
uniconfig = 1
enable_unrar = 1
enable_meta = 1
ignore_samples = 0
email_account = \"\"
email_server = \"\"
allow_streaming = 0
config_lock = 0
quota_resume = 0
api_warnings = 1
rating_api_key = $SABRATINGAPIKEY
wait_for_dfolder = 0
tv_sort_string = \"\"
fail_hopeless = 0
movie_extra_folder = 0
unpack_check = 1
no_ipv6 = 0
download_dir = /vagrant/incompleteDownloads
size_limit = 0
enable_par_cleanup = 1
safe_postproc = 1
cache_dir = cache
complete_dir = /vagrant/completeDownloads
replace_illegal = 1
nomedia_marker = \"\"
max_art_opt = 0
par2_multicore = 1
warned_old_queue = 0
language = en
check_new_rel = 1
enable_https = 0
never_repair = 0
no_dupes = 0
keep_awake = 1
top_only = 0
quick_check = 1
movie_sort_string = \"\"
email_from = \"\"
max_art_tries = 3
osx_menu = 1
username = vagrant
email_endjob = 0
tv_categories = ,
rss_odd_titles = nzbindex.nl/, nzbindex.com/, nzbclub.com/
pause_on_pwrar = 1
login_realm = SABnzbd
send_group = 0
refresh_rate = 0
prio_sort_list = ,
movie_categories = movies,
script_dir = /home/vagrant/.sabnzbd/post-scripts
email_pwd = \"\"
empty_postproc = 0
ignore_wrong_unrar = 0
nice = \"\"
rating_host = www.oznzb.com
email_dir = \"\"
https_cert = server.cert
web_dir2 = \"\"
web_dir = Plush
web_watchdog = 0
fail_on_crc = 1
nzb_key = 1f4c34ec19a60be94b61947e5e0e6496
auto_sort = 0
ampm = 0
start_paused = 0
overwrite_files = 0
queue_complete_pers = 0
enable_tv_sorting = 0
folder_max_length = 256
warn_dupl_jobs = 1
flat_unpack = 0
[logging]
log_new = 0
max_log_size = 5242880
log_level = 1
log_backups = 5
enable_cherrypy_logging = 0
[growl]
ntfosd_enable = 1
growl_enable = 1
growl_server = \"\"
notify_classes = startup, download, pp, complete, other
ncenter_enable = 0
growl_password = \"\"
[nzbmatrix]
username = \"\"
apikey = \"\"
del_bookmark = 1
[newzbin]
username = \"\"
url = www.newzbin2.es
bookmark_rate = 60
bookmarks = 0
password = \"\"
unbookmark = 1
[nzbxxx]
username = \"\"
apikey = \"\"
[servers]
[[$USENETSERVER]]
username = $USENETUSER
enable = 1
name = $USENETSERVER
fillserver = 0
connections = 20
ssl = 0
host = $USENETSERVER
timeout = 120
password = $USENETPASS
optional = 0
port = $USENETPORT
retention = 0
[categories]
[[*]]
priority = 0
pp = 3
name = *
script = None
newzbin = \"\"
dir = \"\"
[[tv]]
priority = 0
pp = \"\"
name = tv
script = Default
newzbin = \"\"
dir = /vagrant/Shows
[[movies]]
priority = 1
pp = \"\"
name = movies
script = Default
newzbin = \"\"
dir = /vagrant/Movies
" | sudo tee /home/vagrant/.sabnzbd/sabnzbd.ini;
echo "export SABAPIKEY=" > renderedSettings.sh
sed -i "s/SABAPIKEY=/SABAPIKEY=$SABAPIKEY/g" renderedSettings.sh
sudo service sabnzbdplus start;