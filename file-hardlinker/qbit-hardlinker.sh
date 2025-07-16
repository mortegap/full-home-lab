#!/bin/bash

set -x

torrentName=$1
torrentPath=$2
torrentCategory=$3

srcDir="/downloads/complete"
destDirMovies="/downloads/peliculas"
destDirSeries="/downloads/series"

excludedCategories="radarr,tv-sonarr,lidarr,readarr,Uncategorized"

logDir="$(dirname "$0")"

if [[ -z "$torrentCategory" ]]; then
   torrentCategory="Uncategorized"
fi

if [[ ",$excludedCategories," == *",$torrentCategory,"* ]]; then
  echo "[!] Skipped \"${torrentName}\" has excluded \"${torrentCategory}\" category set" >> "$logDir/qbit-hardlinker.log"
  exit 0
fi

label="${torrentPath#$srcDir}"

srcPath="${torrentPath}/${torrentName}"
destPathMovies="${destDirMovies}/${torrentName}"
destPathSeries="${destDirSeries}/${torrentName}"

if [[ ${torrentCategory} == *"movies"* ]]; then
    cp -vlR "${srcPath}" "${destPathMovies}" >> "$logDir/qbit-hardlinker.log"
elif [[ ${torrentCategory} == *"series"* ]]; then
    cp -vlR "${srcPath}" "${destPathSeries}" >> "$logDir/qbit-hardlinker.log"
else
    echo "Torrent category invalid" >> "$logDir/qbit-hardlinker.log"
fi
if [ $? -eq 0 ]; then
    echo "[...] Successfully hardlinked \"${torrentName}\" in \"${destPath}\"" >> "$logDir/qbit-hardlinker.log"
else
    echo "Hardlink failed, check logs."
fi
