# ffmpeg

## capture screen

    ffmpeg -video_size 1920x1080 -framerate 30 -f x11grab -i :0.0+0,0 \
      -c:v libx264 -qp 0 -preset ultrafast \
      output.mkv
