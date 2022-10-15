#!/tmp/gp/gp
# vi: ft=conf

# Decimal delimiter (in text files only).
#
#delim ,

# Extra space characters (in text files only).
#
#space "*="

# Column number to use as X (when file is opened from UI).
#
timecol -1

# Load CSV text file.
#
load 0 0 text "tel20hz.txt"

# Specify the time group with default scale and label.
#
group 0 -1
defscale 0 0.05 0.0
deflabel 0 "Time (s)"

# Make pages for each column from current dataset. Value -2 means to use global
# settings (timecol) when file is opened from UI.
#
# <1> Column number to use on X axis.
#
mkpages -1
#mkpages 0

