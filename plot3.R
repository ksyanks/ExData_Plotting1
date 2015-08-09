library(dplyr)

fName = "household_power_consumption.txt"
theData <- read.table(fName, header = TRUE, sep = ";", dec=".", stringsAsFactors = FALSE)
my2dayData <- filter(theData, theData$Date %in% c("1/2/2007","2/2/2007")) 

dateTime <- strptime(paste(my2dayData$Date, my2dayData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot3.png", width=480, height=480) 
plot(dateTime,as.numeric(my2dayData$Sub_metering_1), type = "l", xlab = "", ylab = "Energy Sub Metering" )

lines(dateTime,as.numeric(my2dayData$Sub_metering_2), type = "l", col = "red" )

lines(dateTime,as.numeric(my2dayData$Sub_metering_3), type = "l", col = "blue" )
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1, lwd=2,col=c("black", "red", "blue"))
dev.off() 


