## plot3.R
## Author - C.S. Chan
## Date 15MAY2016

## read in data from working directory - creates header names; then reads in only
## the rows of data for 01FEB2007 and 02FEB2007
## save in variable febdata
headnames <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
febdata <- read.table("./household_power_consumption.txt", sep=";", na.strings="?", col.names = headnames, skip=66637, nrows=2880)

## open png device, create “plot3.png” in working dir
png(file = "plot3.png", width = 480, height = 480, units = "px")

## create plot, add legend and x-axis
with(febdata, {
	plot(Sub_metering_1, ylab = "Energy sub metering", xlab = "", xaxt = "n", type = "l")
	lines(Sub_metering_2, col = "orangered")
	lines(Sub_metering_3, col = "blue")	
	axis(1, at=c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
	legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1, col = c("black", "orangered", "blue"), lty = c(1, 1, 1), pch = c(NA, NA, NA))
})

## close png file device
dev.off()