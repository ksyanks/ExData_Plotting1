library(dplyr)

fName = "household_power_consumption.txt"
theData <- read.table(fName, header = TRUE, sep = ";", dec=".", stringsAsFactors = FALSE)
my2dayData <- filter(theData, theData$Date %in% c("1/2/2007","2/2/2007")) 

dateTime <- strptime(paste(my2dayData$Date, my2dayData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot2.png", width=480, height=480) 
plot(dateTime,as.numeric(my2dayData$Global_active_power), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)" )
dev.off() 

