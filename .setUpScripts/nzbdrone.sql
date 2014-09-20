INSERT INTO DownloadClients (Enable, Name, Implementation, Settings, ConfigContract, Protocol)
VALUES(1, "Sabnzbd", "Sabnzbd", '{
  "host": "127.0.0.1",
  "port": 8080,
  "apiKey": "SABAPIKEY",
  "username": "",
  "password": "",
  "tvCategory": "tv",
  "recentTvPriority": 0,
  "olderTvPriority": 0,
  "useSsl": false
}', "SabnzbdSettings", 1);


INSERT INTO Indexers (Enable, Name, Implementation, Settings, ConfigContract)
VALUES(1, "INDEXER_NAME", "Newznab", '{
  "url": "INDEXER_URL",
  "apiKey": "INDEXER_APIKEY",
  "categories": [
    5030,
    5040
  ]
}', "NewznabSettings");

INSERT INTO RootFolders (Path)
VALUES ("/vagrant/Shows");

INSERT INTO Config (Key, Value)
VALUES("downloadedepisodesfolder","/vagrant/completedDownloads");