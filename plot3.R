setwd("C:/Users/qian.li/Dropbox/data science/Exploratory analysis")

## read the table
housedata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## remove NA values
housedata <-na.omit(housedata)

## subset date: We will only be using data from the dates 2007-02-01 and 2007-02-02
## One alternative is to read the data from just those dates rather than reading in the entire dataset and 
##subsetting to those dates.
housedata <- housedata[housedata$Date %in% c("1/2/2007", "2/2/2007"),]

## convert date: convert the Date and Time variables to Date/Time classes in R 
## using the strptime() and as.Date() functions.
housedata$Date <- strptime(paste(housedata$Date,housedata$Time), "%d/%m/%Y %H:%M:%S")

##Our overall goal here is simply to examine how household energy usage varies over a 2-day period in February, 2007. 
##Task: reconstruct the following plots below, all of which were constructed using the base plotting system.

##Plot 3: Line plot; X: weekdays (only Thursday, Friday, Saturday); Y: Energy Sub Metering; 
## Need to add legends. black: Sub_metering_1; red: Sub_metering_2; blue: Sub_metering_3

library(datasets)

plot(as.POSIXct(housedata$Date), housedata$Sub_metering_1, type="l", xlab = " ", ylab = "Energy sub metering", col="black" )   
lines(as.POSIXct(housedata$Date), housedata$Sub_metering_2, col = "red")  # Put Sub_metering_2 column
lines(as.POSIXct(housedata$Date), housedata$Sub_metering_3,  col = "blue") # Put Sub_metering_3 column
legend("topright", lty = 1, col = c("black", "blue", "red"), 
	legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.copy(png,'plot3.png')
dev.off()