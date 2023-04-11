# Graph Plotter

GP is aimed to be simple and fast tool to analyse numerical data. It does not
claim to replace all other plotters.

## Features

* Plot 2D figures with lines or dots from plain text or binary files.
* Spatial structure based rendering to look through a large datasets.
* Multiple axes are supported by design.
* Real-time plotting from multiple asynchronous sources.
* Simple math operations like subtraction or polynomial fitting.
* Data sampling tool to extract accurate numeric values.
* Static (from file) and dynamic (from UI) configuration.
* Export to PNG or SVG.

The main platforms are GNU/Linux and Windows. Also GP can be embedded in any
third-party SDL2 based application.

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

* [global.gp](config/global.gp)
* [loadfloat.gp](config/loadfloat.gp)
* [loadcsv.gp](config/loadcsv.gp)

## Live plot configuration

You can make real-time plot from raw serial device or from logfiles. Check
these examples.

* [serial.gp](config/serial.gp)

## TODO

* Add all subtract operations to GP configuration file.
* Add data subset (from current page) export to CSV.
* Optimize line drawing on long lines random test.

