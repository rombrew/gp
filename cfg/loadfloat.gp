#!/tmp/gp/gp
# vi: ft=conf

# Take some configration from external file.
#
include "global.gp"

# Define which files to load.
#
# <1> Dataset number that used to refer to the file.
# <2> Number of lines to allocate appropriate amount of memory. If the file has
#     more lines the last ones will disappear from plot. Value 0 means automatic
#     determination based on file size.
# <3> File type ("text", "float", "double").
# <4> Number of columns.
# <5> Name of the file.
#
load 0 0 float 24 "data.f"
#load 0 0 double 200 "data.d"

# If you specify a text file type the remaining parameters will be
# different. The number of columns is not specified but is determined by the
# content of the file.
#
#load 0 0 text "tel20hz.txt"

# Select the dataset by number. Make sense only if there are several ones.
#
bind 0

# Define group of data columns.
#
# <1> Group number.
# <2...N> List of column numbers in current dataset.
#
group 0 0
#group 2 14 15 18 21

# Label of the group that applied to axes by default.
#
# <1> Group number.
# <2> Axis label.
#
deflabel 0 "Time (s)"

group 1 -1
deflabel 1 "Tick"

# Time unwrap transform of the group that applied by default.
#
# <1> Group number.
#
defunwrap 1

# Scale of the group that applied to columns by default.
#
# <1> Group number.
# <2> Scale.
# <3> Offset.
#
defscale 0 11.0 0.0

# Define the page with title.
#
page "DQ Current"

	bind 0

	# Define axes labels.
	#
	label 1 "(A)"
	label 3 "(A)"

	# Define the figure on the current page.
	#
	# <1> Column number on X.
	# <2> Column number on Y.
	# <3> Name of the figure.
	#
	# ** Negative column number means the sequential number.
	#
	figure 0 1 "Plant D"

	# Add more figures.
	#
	figure 0 2 "Plant Q"
	figure -1 9 "Estimated D"

		# Change axes mapping of the last figure.
		#
		# <1> Number of axis mapped to the figure as X.
		# <2> Number of axis mapped to the figure as Y.
		#
		map 2 3

		# Special scale of the data columns.
		#
		# <1> Axis number (0 = X, 1 = Y)
		# <2> Scale.
		# <3> Offset.
		#
		scale 1 10.0 0.0

	figure -1 10 "Estimated Q"

		map 2 3

		# Special figure drawing.
		#
		# <1> Name of the drawing.
		# <2> Width of the figure.
		#
		drawing line 0
		#drawing dot 4

	# Define slave axis.
	#
	# <1> Number of the axis to be slave.
	# <2> Number of the axis to be base.
	# <3> Scale.
	# <4> Offset.
	#
	slave 3 1 1.0 0.0

# Define yet another pages.
#
page "Mechanical Speed"
	label 1 "(RPM)"
	label 2 "(A)"
	figure -1 3 "Plant"
	figure -1 13 "Estimated"
	figure -1 2 "Plant Q"
	map 0 2

page "Electrical Position Error"
	label 1 "(Degree)"
	figure 0 12 "Error"

page "VSI Voltage"
	label 0 "X (V)"
	label 1 "Y (V)"
	figure 15 16 "VSI"
	drawing dot 2

page "Power"
	label 1 "(W)"
	figure 0 22 "W"

page "Drift Q"
	label 1 "(V)"
	figure 0 21 "Q"

# Just to fill menu list.
#
page "TXT_lineFSM"
figure -1 0 "X"

page "FILE_GetSize"
figure 0 -1 "X"

page "readOpenTXT"
figure 0 1 "X"

page "readOpenFLOAT"
figure 0 2 "X"

page "readClose"
figure 0 3 "X"

page "TXT_Read"
figure 0 4 "X"

page "FLOAT_Read"
figure 0 5 "X"

page "readUpdate"
figure 0 6 "X"

page "GP_getc"
figure 0 7 "X"

page "GP_ungetc"
figure 0 1 "X"

page "GP_LexFSM"
figure 0 2 "X"

page "GP_ParseFSM"
figure 0 3 "X"

page "readGP"
figure 0 4 "X"

page "readSelectPage"
figure 0 5 "X"

page "combineGetFreeFigure"
figure 0 6 "X"

page "combineGetFreeAxis"
figure 0 7 "X"

page "combineGetMappedAxis"
figure 0 1 "X"

page "readCombinePage"
figure 0 2 "X"

page "readDataReload"
figure 0 3 "X"

page "plotDataAlloc"
figure 0 4 "X"

page "plotAxisScaleManual"
figure 0 5 "X"

page "plotAxisRemove"
figure 0 6 "X"

page "plotFigureMakeIndividualAxes"
figure 0 7 "X"

page "plotFigureClean"
figure 0 1 "X"

page "plotDrawFigure"
figure 0 2 "X"

page "plotLayout"
figure 0 3 "X"

page "Тестовый текст в UTF8"
figure 0 4 "X"

page "Еще одна тектовая строка"
figure 0 5 "X"

page "readValidate [текст-котстрок]"
figure 0 6 "X"

page "langFill ski-кот"
figure 0 7 "X"

