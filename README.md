##INTRODUCTION

This repository contains 8 files, 4 R files with the source (plot1.R, plot2.R, plot3.R and plot4.R) code and 4 png with required charts (plot1.png, plot2.png, plot3.png and plot4.png).

##SOURCE CODE DESCRIPTION

The structure of the R files are very similar:
- The programs use a target directory called "data" to store the file with the information to plot.
- If this directory doesn't exists the progam:
	- downloads the file.
	- unzips it.
- The next step is the reading of the data fro the file and load in a variable called "rawdata"
- Then it extract the data for the dates selected (1st and 2nd of Febraruary 2007)
- For plots 2, 3 and 4 we create a new columnn called "DateTime" with the the date-time in POSIX format using the columns "Date" and "Time"
- It casts the measurables columns to a numeric format
- It opens the png file
- It generates the chart
- the file is closed.