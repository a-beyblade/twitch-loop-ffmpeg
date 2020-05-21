STREAM_KEY="" # enter stream key here
SERVER="live-yto" # twitch server, see https://stream.twitch.tv/ingests/ for list

ffmpeg -re -f concat -i a.txt \
  -f flv -c copy "rtmp://$SERVER.twitch.tv/app/$STREAM_KEY"
