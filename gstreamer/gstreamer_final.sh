# gst-launch-1.0 -e \
#     v4l2src ! videoconvert ! x264enc bitrate=1000 speed-preset=fast ! \
#     mp4mux name=mux ! filesink location="bla.mp4" \
#     alsasrc ! audioconvert ! avenc_aac bitrate=128 !  \
#     mux.


# check the latency parameter of the muxer! 
# h265

#gst-launch-1.0 -e \
#    v4l2src ! videoconvert ! x264enc bitrate=500 pass=cbr psy-tune=1 tune=zerolatency  !  h264parse !  \
#    mpegtsmux name=mux ! filesink location="bla.ts" sync=true \
#    pulsesrc ! audioconvert ! queue ! lamemp3enc bitrate=256 ! mpegaudioparse disable-passthrough=1 ! audio/mpeg,rate=24000 !   \
#    mux.



#gst-launch-1.0 -e v4l2src ! videoconvert ! x264enc bitrate=100 ! mpegtsmux ! filesink location=bla.ts

raspivid -t 0 -h 720 -w 1080 -fps 25 -hf -b 1000000 -o - | gst-launch-1.0 -v fdsrc fd=0 ! h264parse ! mpegtsmux ! filesink location=bla.ts
