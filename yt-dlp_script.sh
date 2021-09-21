#!/usr/bin/zsh
echo -n $1 | xargs yt-dlp -o '/HDD/Videos/yt-dlp/%(title)s.%(ext)s' --concurrent-fragments 10 --format '((bestvideo[height<=?1080][vcodec!=vp9][vcodec!=av1]/bestvideo[height<=?1080][vcodec!=av1]/bestvideo[height<=?1080][vcodec!=vp9]/bestvideo[height<=?1080])+bestaudio)/best' 
