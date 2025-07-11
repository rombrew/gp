#!/tmp/gp/gp
# vi: ft=conf

# Decimal delimiter (to use in CSV files only).
#
#delim ,

# Define extra space characters (column delimiter in CSV).
#
#space "*="

# Default column number to map on X axis when use mkpages.
#
timecol -1

# Load CSV (text) file.
#
load 0 0 csv "tlmbike.csv"

# Specify the time group with default scale and label.
#
group 0 -1
defscale 0 0.05 0.0
deflabel 0 "Time (s)"

# Make pages for each column from current dataset.
#
# <1> Column number to use on X axis ("-2" means to use timecol).
#
mkpages -2
#mkpages 0

