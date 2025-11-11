#!/bin/bash

set -x

torrentName=$1
torrentPath=$2
torrentCategory=$3

# Change this folders variables
srcDir="/downloads/complete"
destDirMovies="/downloads/peliculas"
destDirSeries="/downloads/series"
destDirGames="/downloads/games"
destDirMusic="/downloads/music"

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

if [[ ${torrentCategory} == *"movies"* ]]; then
    destPath="${destDirMovies}/${torrentName}"
    cp -vlR "${srcPath}" "${destPath}" >> "$logDir/qbit-hardlinker.log"
elif [[ ${torrentCategory} == *"series"* ]]; then
    seriesName=$(echo "$torrentName" | sed 's/ [Ss][0-9].*//' | sed 's/\.[Ss][0-9].*//')
    if [[ -d "${destDirSeries}/${seriesName}" ]]; then
        destPath="${destDirSeries}/${seriesName}/${torrentName}"
    else
        destPath="${destDirSeries}/${torrentName}"
    fi
    cp -vlR "${srcPath}" "${destPath}" >> "$logDir/qbit-hardlinker.log"
elif [[ ${torrentCategory} == *"games"* ]]; then
    destPath="${destDirGames}/${torrentName}"
    cp -vlR "${srcPath}" "${destPath}" >> "$logDir/qbit-hardlinker.log"
elif [[ ${torrentCategory} == *"music"* ]]; then
    destPath="${destDirMusic}/${torrentName}"
    cp -vlR "${srcPath}" "${destPath}" >> "$logDir/qbit-hardlinker.log"
else
    echo "Torrent category invalid" >> "$logDir/qbit-hardlinker.log"
fi
if [ $? -eq 0 ]; then
    echo "[...] Successfully hardlinked \"${torrentName}\" in \"${destPath}\"" >> "$logDir/qbit-hardlinker.log"
else
    echo "Hardlink failed, check logs."
fi
