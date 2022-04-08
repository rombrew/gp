#!/tmp/gp/gp
# vi: ft=conf

# Use small chunk for real-time plot.
#
chunk 20

# How long to wait (in milliseconds) for new data in regular files.
#
timeout 20000

# Go to the end then read appended data as the file grows. So you will
# have real-time plot from serial terminal logfile.
#
follow 0 10000 text "logfile.txt"
mkpages -1

group 0 -1
deflabel 0 "Time (s)"
defscale 0 0.04 0

