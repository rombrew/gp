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
# <3> File format ("stdin", "text", "float", "double").
# <4> Number of columns.
# <5> Name of the file.
#
load 0 0 float 100 "tlmdata.f"
#load 0 0 double 50 "tlmdata.d"

# You can specify stdin stream as plaint text source.
#
#load 0 0 stdin

# If you specify a text file format the remaining parameters will be different.
# The number of columns is not specified but is determined by the content of
# the file.
#
#load 0 0 text "tlmgrab.csv"

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
deflabel 1 "Line"

# Time median transform of the group that applied by default.
#
# <1> Group number.
# <2> Median length.
# <3> Time unwrap flag (optional).
# <4> Data median flag (optional).
#
#defmedian 0 5
#defmedian 1 7 1 1

# Scale of the group that applied to columns by default.
#
# <1> Group number.
# <2> Scale.
# <3> Offset.
#
defscale 0 1.0 0.5

# Define the page with title.
#
page "DQ Current"

	bind 0

	# Define axes labels.
	#
	label 1 "(A)"

	# Define the figure on the current page. Note that negative column
	# number means to use sequential number.
	#
	# <1> Column number on X.
	# <2> Column number on Y.
	# <3> Name of the figure.
	#
	figure 0 1 "m.iD"
	#figure -1 1 "m.iD"

	figure 0 2 "m.iQ"
	figure 0 12 "pm.lu_iD"
	figure 0 13 "pm.lu_iQ"

	figure 0 38 "pm.vsi_lpf_DC"

		# Change axes mapping of the last figure.
		#
		# <1> Number of axis mapped to the figure as X.
		# <2> Number of axis mapped to the figure as Y.
		#
		map 0 2

		# Special scale of the figure data columns.
		#
		# <1> Axis number (0 = X, 1 = Y)
		# <2> Scale.
		# <3> Offset.
		#
		scale 1 1.0 0.5

		# Special figure drawing.
		#
		# <1> Name of the drawing.
		# <2> Width of the figure.
		#
		drawing line 4
		#drawing dot 4

		# Filter operation of the figure data columns.
		#
		# <1> Axis number (0 = X, 1 = Y)
		# <2> Filter operation ("diff", "csum", "bf", "low", "med").
		# <3-4> Operation arguments.
		#
		filter 1 low 0.1
		#filter 1 diff
		#filter 1 bf 3 5
		#filter 1 med 7

# Define yet another pages.
#
page "Mechanical Speed"

	label 1 "(rpm)"

	figure 0 3 "m.wS_rpm"
	figure 0 16 "pm.lu_wS_rpm"

	figure 0 52 "pm.lu_MODE"

		map 0 2

		# Define slave axis.
		#
		# <1> Number of the axis to be slave.
		# <2> Number of the axis to be base.
		# <3> Scale.
		# <4> Offset.
		#
		slave 2 1 100.0 0.0

page "Electrical Position"

	label 1 "(°)"

	figure 0 4 "m.theta"
	figure 0 15 "pm.lu_Fg"

	figure 0 4 "m.theta - pm.lu_Fg"

		map 0 2

		# Subtract operation of the data columns.
		#
		# <1> Axis number (0 = X, 1 = Y)
		# <2> Subtract operation ("sub", "add", "mul", "hyp").
		# <3> Column number of the second operation argument.
		#
		subtract 1 sub 15
		#subtract 1 mul 10

		# Apply median filter with length 7.
		#
		filter 1 med 7

page "E.Position Error"
label 1 "(°)"
figure 0 14 "m.theta - pm.lu_Fg"

page "Motor Temperature"
label 1 "(C)"
figure 0 5 "m.Tc"

page "DC link Voltage"
label 1 "(V)"
figure 0 6 "m.Udc"
figure 0 19 "pm.const_fb_U"

page "Power Consumption"
label 1 "(W)"
figure 0 17 "m.drain_wP"
figure 0 18 "pm.watt_drain_wP"

page "PWM Output"
label 1 "(%)"
figure 0 7 "m.pwm_A"
figure 0 8 "m.pwm_B"
figure 0 9 "m.pwm_C"

page "VSI Voltage"
label 0 "(V)"
label 1 "(V)"
figure 10 11 "pm.vsi_X / pm.vsi_Y"
drawing dot 4

page "Absolute Current"
label 1 "(A)"
figure 0 20 "m.iA"
figure 0 21 "m.iB"
figure 0 22 "m.iC"

page "pm.fb_uA"
figure 0 30 "pm.fb_uA"

page "pm.fb_uB"
figure 0 31 "pm.fb_uB"

page "pm.fb_uC"
figure 0 32 "pm.fb_uC"

page "pm.fb_HS"
figure 0 33 "pm.fb_HS"

page "pm.fb_EP"
figure 0 34 "pm.fb_EP"

page "pm.fb_SIN"
figure 0 35 "pm.fb_SIN"

page "pm.fb_COS"
figure 0 36 "pm.fb_COS"

page "pm.vsi_DC"
figure 0 37 "pm.vsi_DC"

page "pm.vsi_lpf_DC"
figure 0 38 "pm.vsi_lpf_DC"

page "pm.vsi_X"
label 1 "(V)"
figure 0 39 "pm.vsi_X"

page "pm.vsi_Y"
label 1 "(V)"
figure 0 40 "pm.vsi_Y"

page "pm.vsi_AF"
figure 0 41 "pm.vsi_AF"

page "pm.vsi_BF"
figure 0 42 "pm.vsi_BF"

page "pm.vsi_CF"
figure 0 43 "pm.vsi_CF"

page "pm.vsi_IF"
figure 0 44 "pm.vsi_IF"

page "pm.vsi_SF"
figure 0 45 "pm.vsi_SF"

page "pm.vsi_UF"
figure 0 46 "pm.vsi_UF"

page "pm.tvm_A"
label 1 "(V)"
figure 0 47 "pm.tvm_A"

page "pm.tvm_B"
label 1 "(V)"
figure 0 48 "pm.tvm_B"

page "pm.tvm_C"
label 1 "(V)"
figure 0 49 "pm.tvm_C"

page "pm.tvm_X0"
label 1 "(V)"
figure 0 50 "pm.tvm_X0"

page "pm.tvm_Y0"
label 1 "(V)"
figure 0 51 "pm.tvm_Y0"

page "pm.lu_MODE"
figure 0 52 "pm.lu_MODE"

page "pm.lu_mq_load"
label 1 "(Nm)"
figure 0 53 "pm.lu_mq_load"

page "pm.base_TIM"
figure 0 54 "pm.base_TIM"

page "pm.hold_TIM"
figure 0 55 "pm.hold_TIM"

page "pm.forced_F"
label 1 "(°)"
figure 0 56 "pm.forced_F"

page "pm.forced_wS"
label 1 "(rpm)"
figure 0 57 "pm.forced_wS"

page "pm.detach_TIM"
figure 0 58 "pm.detach_TIM"

page "pm.flux_ZONE"
figure 0 59 "pm.flux_ZONE"

page "pm.flux_X[0]"
label 1 "(Wb)"
figure 0 60 "pm.flux_X[0]"

page "pm.flux_X[1]"
label 1 "(Wb)"
figure 0 61 "pm.flux_X[1]"

page "pm.flux_lambda"
label 1 "(Wb)"
figure 0 62 "pm.flux_lambda"

page "pm.flux_F"
label 1 "(°)"
figure 0 63 "pm.flux_F"

page "pm.flux_wS"
label 1 "(rpm)"
figure 0 64 "pm.flux_wS"

page "pm.kalman_bias_Q"
label 1 "(V)"
figure 0 65 "pm.kalman_bias_Q"

page "pm.kalman_lpf_wS"
label 1 "(rpm)"
figure 0 66 "pm.kalman_lpf_wS"

page "pm.zone_lpf_wS"
label 1 "(rpm)"
figure 0 67 "pm.zone_lpf_wS"

page "pm.hfi_wave[0]"
figure 0 68 "pm.hfi_wave[0]"

page "pm.hfi_wave[1]"
figure 0 69 "pm.hfi_wave[1]"

page "pm.hfi_pole"
figure 0 70 "pm.hfi_pole"

page "pm.hall_F"
label 1 "(°)"
figure 0 71 "pm.hall_F"

page "pm.hall_wS"
label 1 "(rpm)"
figure 0 72 "pm.hall_wS"

page "pm.eabi_F"
label 1 "(°)"
figure 0 73 "pm.eabi_F"

page "pm.eabi_wS"
label 1 "(rpm)"
figure 0 74 "pm.eabi_wS"

page "pm.watt_lpf_D"
label 1 "(V)"
figure 0 75 "pm.watt_lpf_D"

page "pm.watt_lpf_Q"
label 1 "(V)"
figure 0 76 "pm.watt_lpf_Q"

page "pm.i_setpoint_current"
label 1 "(A)"
figure 0 77 "pm.i_setpoint_current"

page "pm.i_track_D"
label 1 "(A)"
figure 0 78 "pm.i_track_D"

page "pm.i_track_Q"
label 1 "(A)"
figure 0 79 "pm.i_track_Q"

page "pm.weak_D"
label 1 "(A)"
figure 0 80 "pm.weak_D"

page "pm.s_setpoint_speed"
label 1 "(rpm)"
figure 0 81 "pm.s_setpoint_speed"

page "pm.s_track"
label 1 "(rpm)"
figure 0 82 "pm.s_track"

