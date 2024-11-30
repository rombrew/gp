#!/tmp/gp/gp
# vi: ft=conf

# Use tiny chunk for real-time plot.
#
chunk 20

# Serial port must already be configured we just open and read it.
#
load 0 10000 csv "/dev/rfcomm0"
#load 0 10000 csv "//./COM1"
mkpages -1

group 0 -1
deflabel 0 "Time (s)"
defscale 0 0.04 0

