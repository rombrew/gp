#!/tmp/gp/gp
# vi: ft=conf

# Decimal delimiter (in text files only).
#
#delim ,

# Extra space characters (in text files only).
#
#space "*="

# Default column number to map on X axis when use mkpages.
#
timecol -1

# Load CSV text file.
#
load 0 0 text "tlmgrab.csv"

# Specify the time group with default scale and label.
#
group 0 -1
defscale 0 0.05 0.0
deflabel 0 "Time (s)"

# Make pages for each column from current dataset. Argument -2 means to use the
# global settings from timecol.
#
# <1> Column number to use on X axis.
#
mkpages -2
#mkpages 0

