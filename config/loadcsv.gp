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

page "DC link current (fuzzy)"
label 1 "(A)"

# Define the figure on the current page. Note that you can specify fuzzy match
# pattern instead of column number to search for labels in CSV dataset.
#
# <1> Fuzzy match pattern to get column on X.
# <2> Fuzzy match pattern to get column on Y.
# <3> Name of the figure.
#
figure "time" "draA" "DC link current"

