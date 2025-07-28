# Hard link files from one folder to another

Forked from https://github.com/gravelfreeman/qbit-hardlinker

Used for Qbittorrent script execution after a torrent has been totally downloaded

Make a hardlink between the .sh file and a path where qbittorrent-nox container has access to:
Ex-
```
ln ./ qbit-hardlinker.sh ${GLOBAL_CONFIG_FOLDER}/qbittorrent-config  
```

qBittorent > Tools > Options > Downloads Tab and scroll down to *Run external program* section and check the box *Run external program on torrent finished*

Add the script path in the text field followed by `"%N" "%D" "%L"` variables.

Example :
```
/config/qbit-hardlinker/qbit-hardlinker.sh "%N" "%D" "%L"
```

Then, in each torrent you should add it to a category that inclues "movies" or "series" in it name.
Don forget to override the variables in the top of the script.
