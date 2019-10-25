# gst-launch-1.0 -e \
#     v4l2src ! videoconvert ! x264enc bitrate=1000 speed-preset=fast ! \
#     mp4mux name=mux ! filesink location="bla.mp4" \
#     alsasrc ! audioconvert ! avenc_aac bitrate=128 !  \
#     mux.


gst-launch-1.0 -e \
    v4l2src ! videoconvert ! queue ! x264enc bitrate=950 pass=cbr psy-tune=1 tune=zerolatency  !  h264parse !  \
    mpegtsmux name=mux ! filesink location="bla.ts" sync=false \
    pulsesrc ! audioconvert ! queue ! lamemp3enc bitrate=50 ! mpegaudioparse disable-passthrough=1 ! audio/mpeg,rate=48000 !   \
    mux.


# gst-launch-1.0 -e \
#     v4l2src ! videoconvert ! x264enc tune=zerolatency ! \
#     mpegtsmux name=mux ! filesink location="bla.mp4" \
#     pulsesrc !  lamemp3enc bitrate=16 ! mpegaudioparse disable-passthrough=1 ! audio/mpeg,rate=48000 !   \
#     mux.


# gst-launch-1.0 -e v4l2src ! videoconvert ! x264enc bitrate=1000 pass=cbr tune=zerolatency ! mpegtsmux ! filesink location=xyz.ts



# gst-launch-1.0 -e \
#     pulsesrc !  lamemp3enc  bitrate=64 ! mpegaudioparse ! audio/mpeg,rate=48000 !  \
#     mpegtsmux ! filesink location="bla.mp4" sync=false 
