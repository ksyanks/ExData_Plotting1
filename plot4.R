library(dplyr)

fName = "household_power_consumption.txt"
theData <- read.table(fName, header = TRUE, sep = ";", dec=".", stringsAsFactors = FALSE)
my2dayData <- filter(theData, theData$Date %in% c("1/2/2007","2/2/2007")) 

dateTime <- strptime(paste(my2dayData$Date, my2dayData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot4.png", width=480, height=480) 
par(mfrow = c(2, 2))

plot(dateTime,as.numeric(my2dayData$Global_active_power), type = "l", xlab = "", ylab = "Global Active Power" )

plot(dateTime,as.numeric(my2dayData$Voltage), type = "l", ylab = "Energy Sub Metering" )

plot(dateTime,as.numeric(my2dayData$Sub_metering_1), type = "l", xlab = "", ylab = "Energy Sub Metering" )
lines(dateTime,as.numeric(my2dayData$Sub_metering_2), type = "l", col = "red" )
lines(dateTime,as.numeric(my2dayData$Sub_metering_3), type = "l", col = "blue" )

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2,col=c("black", "red", "blue"),bty = "n")

plot(dateTime,as.numeric(my2dayData$Global_reactive_power), type = "l", ylab = "Global Reactive Power" )

dev.off() 


