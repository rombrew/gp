#!/tmp/gp/gp
# vi: ft=conf

# Take some configuration from external file.
#
#include "external.gp"

# Font size and the one of the following embedded font names (this should
# be specified in user ~/.gprc file).
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
timeout 5000

# Data length (number of lines to allocate) that is applied by default to
# non-regular files like serial ports.
#
length 1000

# Specify the window size at the startup.
#
windowsize 800 600

# Select UI language (0 = "english", 1 = "russian").
#
language 0

# Default color scheme (0 = "dark", 1 = "light", 2 = "grayscale").
#
colorscheme 0

# Draw figures with antialiasing (0 = "none", 1 = "4x MSAA", 2 = "8x MSAA").
#
antialiasing 1

# Draw UI text with blended font (0 = "solid", 1 = "blended").
#
blendfont 1

# Draw UI and grid lines with specified thickness (0 = "thin", 1 = "bold", 2 = "triple").
#
thickness 1

# Gamma correction drawing in case of antialiasing (in percent).
#
gamma 50

# Default figure drawing.
#
# <1> Name of the drawing ("line", "dash", "dot").
# <2> Width of the figure.
#
drawing line 2

# Define the marker size relative to font height (from 1 to 99).
#
marker 40

# Define the marker density as percentage (from 1 to 99).
#
density 50

# Draw plot legend with transparency (0 = "solid", 1 = "transparent").
#
transparency 1

# Define the number of significant digits in numerical printouts.
#
precision 9

# Column number to map on X axis when the file is opened from UI.
#
timecol -1

# Define how to print filenames in UI (0 = full length, <n> = cut to \n dirs in path).
#
shortfilename 1

# Enable automatic switching to the fast drawing method in case of screen
# drawing time is longer than specified time (in milliseconds).
#
fastdraw 200

# Interpolation method of resample operation (0 = "nearest", 1 = "linear").
#
interpolation 1

# Define the time gap threshold to use with unwrap feature.
#
defungap 10

# Use in RAM dataset compression by LZ4 algorithm.
#
lz4_compress 1

