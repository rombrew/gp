# Graph Plotter

GP is aimed to be simple and fast tool to analyse numerical data. It does not
claim to replace all other plotters.

## Current status

We are close to stable release. The main platforms are GNU/Linux and Windows.

## Features

* 2D plot with lines or dots from plain text or binary files.
* Deferred fast rendering to look through a large datasets.
* Multiple axes are supported by design.
* Real-time plotting from multiple asynchronous sources.
* Simple math operations like subtraction or filtering.
* Numerical data sampling.
* Static (from file) and dynamic (from UI) configuration.
* Export to PNG or SVG.

## Screenshots

![GP4](doc/g4.png)
![GP5](doc/g5.png)

## Build

Here are the dependencies that you need to have prior to compile.

* [SDL2](https://www.libsdl.org/)
* [SDL2_ttf](https://www.libsdl.org/projects/SDL_ttf/)
* [SDL2_image](https://www.libsdl.org/projects/SDL_image/)
* [FreeType](https://www.freetype.org/)

To compile GP you could use Makefile from source directory.

Also you can get MinGW builds from [here](https://sourceforge.net/projects/graph-plotter/files/).

## Usage

You can just use GP with a plain text file or CSV table.

	$ gp file.txt

Note that first valid line of plain text (or CSV) file will be interpreted
as **name@unit** of the columns. Here is a simple example of the file.

	$ cat file.txt
	time@s  var1@a  var2@v  hexpar@
	 0.1     0.0     0.0     0x01
	 0.2     1.1     2.1     0x13
	 0.3     1.5     3.4     0x1f
	 0.4     1.7     4.1     0x1f
	...

You also can open a multiple files from UI to combine various columns from
different files in a single plot.

## Regular files configuration

Take a look into configuration examples that describes most of the options.

* [global.gp](cfg/global.gp)
* [loadfloat.gp](cfg/loadfloat.gp)
* [loadcsv.gp](cfg/loadcsv.gp)

## Live plot configuration

You can make real-time plot from raw serial device or from logfiles. Check
these examples.

* [serial.gp](cfg/serial.gp)
* [logfile.gp](cfg/logfile.gp)

## TODO

* Add all subtract operations to GP configuration file.
* Allow to open multiple GP files (dataset remap).

