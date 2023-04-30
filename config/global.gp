#!/tmp/gp/gp
# vi: ft=conf

# Take some configuration from external file.
#
#include "external.gp"

# Font size and the one of the following embedded font names (this should
# be specified in ~/.gprc file).
#
# <1> Font point size.
# <2> Embedded font name or the file path.
#
# 	- "normal"
# 	- "normal-bold"
# 	- "normal-italic"
# 	- "thin"
# 	- "thin-bold"
# 	- "thin-italic"
#
#font 26 "normal"
#font 26 "/usr/share/fonts/corefonts/cour.ttf"

# Path to the screenshot directory.
#
screenpath "/tmp"

# Preload buffer size (in bytes) to read files. Large values increases
# file loading performance.
#
preload 8388608

# Chunk is a minimal piece of data (in bytes) to read files. Small values
# allows us to read data immediately for real-time plots.
#
chunk 4096

# How long to wait (in milliseconds) for the new data in regular files.
#
timeout 1000

# Data length (number of lines to allocate) that is applied by default to
# non-regular files like serial ports.
#
length 1000

# Specify the window size at the startup.
#
windowsize 800 600

# Select UI language (0 = EN, 1 = RU).
#
language 0

# Default color scheme (0 = dark, 1 = light, 2 = grayscale).
#
colorscheme 0

# Draw figures with antialiasing (0 = NONE, 1 = 4X_MSAA, 2 = 8X_MSAA).
#
antialiasing 1

# Draw UI text with solid font (0 = blended, 1 = solid).
#
solidfont 0

# Draw UI with increased line thickness (0 = default, 1 = bold line).
#
thickness 0

# Default figure drawing.
#
# <1> Name of the drawing ("line", "dash", "dot").
# <2> Width of the figure.
#
drawing line 2

# How to print filenames in UI (0 = full length, <n> = cut to \n dirs in path).
#
shortfilename 1

# Screen draw time upper bound (in milliseconds) after that antialiasing mode
# is forced to NONE.
#
drawboost 200

# Interpolation method of resample operation (0 = nearest, 1 = linear).
#
interpolation 1

# Define the number of significant digits in numerical printouts.
#
precision 9

# Use in RAM dataset compression by LZ4 algorithm.
#
lz4_compress 0

