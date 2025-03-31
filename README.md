# Graph Plotter

GP is aimed to be simple and fast tool to analyse numerical data. It does not
claim to replace all other plotters. The main platforms are GNU/Linux and
Windows. GP can be embedded to any third-party SDL based application.

## Features

* Plot 2D figures with lines or dots from plain text or binary files.
* Spatial structure based rendering to look through a large datasets.
* Multiple axes are supported by design.
* Real-time plotting from multiple asynchronous sources.
* Math operations like subtraction or polynomial fitting.
* Data sample tool to extract accurate numeric values.
* Static (from file) and dynamic (from UI) configuration.
* Export screen or data to the file (PNG, SVG, CSV).
* In-RAM data compression by [LZ4](https://lz4.org).

## Screenshots

![GP4](doc/g4.png)
![GP5](doc/g5.png)

## Build

These dependencies you need to have prior to compile GP from sources.

* [SDL2](https://www.libsdl.org/)
* [SDL2_ttf](https://www.libsdl.org/projects/SDL_ttf/)
* [SDL2_image](https://www.libsdl.org/projects/SDL_image/)
* [FreeType](https://www.freetype.org/)

To compile GP you could use Makefile from source directory.

## Usage

You can just use GP to view a plain text file or CSV table.

	$ gp file.txt file.csv ...

Note that first valid line of plain text (or CSV) file will be interpreted as
description of the columns. Here is a simple example of the plain text file.

	$ cat file.txt
	time@sec  current@A  voltage@V  hexvar  ...
	0.1       0.0        0.0        0x0001
	0.2       1.1        2.1        0x0035
	0.3       1.5        3.4        0x0d1f
	0.4       1.7        4.1        0x0e00
	...

You also can open a multiple files to combine various columns from different
files in a single plot. Explore UI menu options to overview of all features.

Also check for command line options help.

	$ gp -h

Example of pipeline usage with GP.

	$ zcat config/tlmgrab.csv.gz | gp -x0 -l1 -t10 - -p3 -n4

## Сonfiguration

Take a look into configuration examples that describes most of the options.

* [global.gp](config/global.gp)
* [loadbin.gp](config/loadbin.gp)
* [loadcsv.gp](config/loadcsv.gp)

You can make real-time plot from raw serial device or from growing logfile.

* [serial.gp](config/serial.gp)

## TODO

* Improve embedded API.
* Add a dependency based subtract calculation.
* Optimize line drawing performance even more.

