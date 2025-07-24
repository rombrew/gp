#!/tmp/gp/gp
# vi: ft=conf

# Load CSV files.
#
load 0 0 csv "tlmbike.csv"
load 1 0 csv "tlmbike-faulty.csv"

# Select the dataset by ID.
#
bind 0

# Define group of data columns.
#
# <1> Group ID.
# <2..N> List of column numbers from current dataset.
#
group 0 0

# Label of the group that applied to axes by default.
#
# <1> Group ID.
# <2> Axis label.
#
deflabel 0 "Time (s)"

bind 1
group 1 0

# Time median transform of the group that applied by default.
#
# <1> Group ID.
# <2> Median length.
# <3> Time unwrap flag (optional).
# <4> Data median flag (optional).
#
defmedian 1 7 0 1

# Scale of the group that applied to columns by default.
#
# <1> Group ID.
# <2> Scale.
# <3> Offset.
#
defscale 1 1.0 -0.6

page "DQ Current"

	bind 0
	label 1 "kA"
	figure 0 "iD" "pm.lu_iD"

	# Special scale of the figure data column (on X and Y).
	#
	# <1> Scale.
	# <2> Offset.
	#
	yscale 0.001 0

	figure 0 6 "pm.lu_iQ"
	yscale 0.001 0

page "PCB Temperature"

	bind 0
	label 1 "C"
	figure 0 "PCB" "pm.temp_PCB"
	figure 0 "EXT" "pm.temp_EXP"

	figure 0 "EXT" "pm.temp_EXP (low)"

	# Filter operation of the figure data column (on X and Y).
	#
	# <1> Filter operation ("diff", "csum", "bf", "low", "med", "dem").
	# <2-3> Operation arguments.
	#
	# Low pass filter with specified gain.
	yfilter low 0.1

	figure 0 "EXT" "pm.temp_EXP (med)"

	# Median filter with specified length.
	yfilter med 15

	# Take differences or integral (uses both X and Y columns of the figure).
	#yfilter diff
	#yfilter csum

	# Bit-field extraction.
	#
	# <2> Bit number of the start.
	# <3> Bit number of the end.
	#
	#yfilter bf 3 5

page "Average Temperature"

	bind 0
	label 1 "C"
	figure 0 "PCB" "pm.temp_PCB"
	figure 0 "EXT" "pm.temp_EXP"

	figure 0 "PCB" "pm.temp_EXP (average)"

	# Subtract operation of the data column (on X and Y).
	#
	# <1> Subtract operation ("sub", "add", "mul", "hyp").
	# <2> Column number of the second argument.
	#
	ysubtract add "EXT"
	yscale 0.5 0

page "Bike Speed"

	bind 0
	label 1 "km/h"
	figure 0 "wS" "pm.lu_wS_kmh"
	bind 1
	figure 0 "bike" "bike_kmh"

page "Bike Speed (subtract)"

	bind 0
	label 1 "km/h"
	figure 0 "wS" "pm.lu_wS_kmh (subtract)"

	# Subtract operation of the data columns (with resample).
	#
	# <1> Subtract operation ("sub", "add", "mul", "hyp").
	# <2> Resample keyword.
	# <3> Dataset number from which we extract the second argument.
	# <4> Column number of time relative to which we resample.
	# <5> Column number of the second argument value.
	#
	ysubtract sub resample 1 "time" "bike"
	yfilter med 15

page "Traveled Distance (demultiplex)"

	bind 0
	label 1 "km"
	figure 0 "travel" "pm.watt_traveled_km (demultiplex)"

	# Demultiplex (get the value only if selector equals).
	#
	# <2> Column number of the selector.
	# <3> Value of the selector which is accepted.
	#
	yfilter dem 1 67

