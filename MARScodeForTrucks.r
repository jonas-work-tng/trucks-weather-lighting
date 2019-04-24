# -------------------------------
# MARS (Multivariate Additive Regression Splines) for traffic data.
#
# Example code used in the paper "Speed Responses of Trucks to Weather
# Conditions, Daylight, Darkness, and Road Lighting" by Annika
# Jägerbrand and Jonas Sjöbergh. 
# 
# This file is written by Jonas Sjöbergh, jsh@kth.se
#
# This file contains code for R, so you need to have R installed to
# run the code. Once you have R installed, you can copy paste the
# contents of this file into the R console and it will try to run, but
# you will need to adjust some things to your environment. There are
# libraries used that you may need to install (mentioned below). You
# will also need a file with data, and you will most likely need to
# update the filename etc. to fit where you have your data. You will
# also need to update the column names to fit the contents of your
# data file.
# -------------------------------


# -------------------------------
# There are some libraries used in the code. If you do not have them
# installed, uncomment the code below to get the libraries. If you
# already have these libraries, you do not need to run these lines.
# -------------------------------

#setRepositories()
#chooseCRANmirror()
#install.packages("ggplot2")   # used by the library below, generally nice plotting library
#install.packages("ReporteRs") # only used for writing output to Word files
#install.packages("earth")     # does the MARS

# -------------------------------
# If you already have the libraries installed, load the libraries with
# the following lines.
# -------------------------------

library(earth)
#library(ggplot2)
#library(ReporteRs)

# -------------------------------
# Read the data file to do MARS on.
# 
# The data file used in this example has the following format:
# The first row has the column labels, all other rows have numerical data. Columns are separated with TABs.
# Here are the first two rows:
#
# TFP	Direction	Year	Month	Day	Hour	Minute	LightingOrNot	AgeOfLighting	QualityOfLigting	DistanceToIntersection	RoadWidth	SpeedLimit	RoadSurfaceTemp	AirTemp	Humidity	DewPointTemp	RainOrSnow	Precipitation	DayOrNight	FKL	FANT	AvSpeed	RelativeSpeed	SpeedDiff	RelativeSpeedDiff
# 7310	1	2012	9	27	18	00	1	1990	Good	134.000000	6.500000	70.000000	7.100000	5.800000	78.300000	2.700000	1	0.000000	5	18	20	57.160000	0.816571	-12.840000	-0.183429
#
# The "header=TRUE" tells R to get the column labels from the first row in the file.
# -------------------------------

data <-read.table(file="C:\\Users\\MyUserName\\MyDataFolder\\JonasV15LightTrucksRawData.txt",header=TRUE)


# -------------------------------
# Here is the call to do the MARS 
# 
# The "earth" library does MARS analysis for us. 
# 
# The first column name (here "AvSpeed") specifies which variable we are interested in.
#
# The column names listed after the "~" are the variables we believe
# may have an influence on our variable of interest. They are
# separated by "+".
#
# The "data=" parameter specifies which data we want to analyze. 
#
# The "degree=" parameter specifies what types of interactions we
# allow between our variables. 1 treats them as independent, 2 checks
# pairs of variables together etc. Higher numbers makes the analysis
# take a lot more time (of course) and also potentially leads to
# overfitting. If the variables are not independent, having a low
# number will not find the correct dependencies. We use degree 2 here.
# -------------------------------

earth.mod <- earth(AvSpeed ~ DayOrNight + DistanceToIntersection + RoadWidth + SpeedLimit + RoadSurfaceTemp + Year + Month + LightingOrNot + Precipitation + RainOrSnow, degree=2, data=data)


# -------------------------------
# Plot the results on screen.
# -------------------------------

plotmo(earth.mod); 


# -------------------------------
# List the results in the console.
# -------------------------------

summary(earth.mod)


# -------------------------------
# Save the plots to a PDF, if you for example want to include them in
# a paper.
# -------------------------------

# pdf("TrucksLightTrucksFigureMARSallWeatherA4.pdf", paper='a4')
# plotmo(earth.mod);
# dev.off()

# pdf("TrucksLightTrucksFigureMARSallWeather.pdf", width=8, height=7)
# plotmo(earth.mod);
# dev.off()

# -------------------------------
# Save the plots to a Word document instead, if you do not like PDFs.
# -------------------------------

# doc = docx( title = 'Truck Plots' )
# doc = addTitle(doc, "TrucksLightTrucksFigureMARSallWeather")
# # doc = addPlot( doc = doc , fun = function() {plotmo(earth.mod)} , vector.graphic = TRUE )
# doc = addPlot( doc = doc , fun = function() {plotmo(earth.mod)} )
# writeDoc( doc, file = "TrucksLightTrucksFigureMARSallWeather.docx" )



# -------------------------------
# Do another analysis, for a subset of the data.
# 
# Here we do the same analysis but only on the data when it was raining or snowing.
# -------------------------------

earth.mod <- earth(AvSpeed ~ DayOrNight + DistanceToIntersection + RoadWidth + SpeedLimit + RoadSurfaceTemp + Year + Month + LightingOrNot + Precipitation + RainOrSnow, degree=2, data=data[data$RainOrSnow==1,])
