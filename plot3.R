## code to make plots for coursera exploratory data analysis course project1
## code for loading and unzipping are not included

Sys.setlocale("LC_TIME", "English")

## set working directory
setwd("D:")

## read data
filename <- "./ExData_plotting/household_power_consumption.txt"
Dataplot <- read.table(filename, header=TRUE, sep = ";", stringsAsFactors = FALSE)


## only unsing data with date 1/2/2007 and 2/2/2007
data1 <- Dataplot[which(Dataplot$Date %in% c("1/2/2007", "2/2/2007")),] 

## paste date and time together
datetime <- strptime(paste(data1$Date, data1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
data1[,7] <- as.numeric(data1[,7])
data1[,8] <- as.numeric(data1[,8])
data1[,9] <- as.numeric(data1[,9])

## plot datetime and energy sub metering
plot(datetime, data1$Sub_metering_1,type = "l", xlab="", ylab = "Energy sub metering")
lines(datetime, data1$Sub_metering_2, type="l", col="red")
lines(datetime, data1$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

library(datasets)
## copy plot to PNG file
dev.copy(png, width = 480, height = 480, file = "plot3.png")

## close PNG device
dev.off()

