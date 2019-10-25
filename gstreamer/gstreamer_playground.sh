# -e allows for ctrl-C interruption that will close the video stream gracefully

# Camera -> .flv file

gst-launch-1.0 -e v4l2src ! videoconvert ! x264enc ! flvmux ! filesink location=xyz.flv

# Camera -> x264 encode -> tsmux -> .ts file

gst-launch-1.0 -e v4l2src ! videoconvert ! x264enc bitrate=1000 ! mpegtsmux ! filesink location=xyz.ts


# Microphone -> .mp3
gst-launch-1.0 -e pulsesrc ! audioconvert ! lamemp3enc target=1 bitrate=64 cbr=true ! filesink location=audio.mp3

# x264enc option that might come in handy later
#   x264enc tune=zerolatency


# Video + audio (mp4, mp3) -> .mp4
gst-launch-1.0 -e videotestsrc ! x264enc bitrate=1000 ! mp4mux name=mux ! filesink location="bla.mp4"  audiotestsrc ! lamemp3enc target=1 bitrate=64 cbr=true ! mux.