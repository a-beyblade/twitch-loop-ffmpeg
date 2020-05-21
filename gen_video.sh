# generates a.mp4
# with static image a.png and music a.mp3

INRES="1920x1080" # input resolution
OUTRES="480x270" # output resolution
FPS="60" # target FPS
GOP="120" # i-frame interval, should be double of FPS, 
GOPMIN="60" # min i-frame interval, should be equal to fps, 
CBR="3000k" # constant bitrate (should be between 1000k - 3000k)
QUALITY="ultrafast"  # one of the many FFMPEG preset
AUDIO_RATE="44100"

ffmpeg -framerate 60 -loop 1 -i a.png \
  -i a.mp3 \
  -f flv -ac 2 -ar $AUDIO_RATE \
  -vcodec libx264 -g $GOP -keyint_min $GOPMIN -b:v $CBR -minrate $CBR -maxrate $CBR -pix_fmt yuv420p\
  -s $OUTRES -preset $QUALITY -tune film -acodec aac -strict normal \
  -shortest \
  a.mp4
