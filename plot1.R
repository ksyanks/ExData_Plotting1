library(dplyr)

setwd("C:/m4/assignment1/exdata_data_household_power_consumption")
fName = "household_power_consumption.txt"
theData <- read.table(fName, header = TRUE, sep = ";", dec=".", stringsAsFactors = FALSE)
my2dayData <- filter(theData, theData$Date %in% c("1/2/2007","2/2/2007")) 

png("plot1.png", width=480, height=480)
hist(as.numeric(my2dayData$Global_active_power),  breaks = 20,col = "red", main = "Global Active Power" ,xlab = "Global Active Power (kilowatts)")
dev.off()