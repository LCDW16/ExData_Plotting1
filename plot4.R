## code to make plots for coursera exploratory data analysis course project1
## code for loading and unzipping are not included

## set 
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

data1[,3] <- as.numeric(data1[,3])
data1[,4] <- as.numeric(data1[,4])
data1[,5] <- as.numeric(data1[,5])
data1[,7] <- as.numeric(data1[,7])
data1[,8] <- as.numeric(data1[,8])
data1[,9] <- as.numeric(data1[,9])

## make 4 plots
png("plot4.png", width=480, height=480)

## make 4 plot from left to right and row to row
par(mfrow = c(2,2))

## first plot
plot(datetime, data1$Global_active_power,type = "l", xlab="", ylab = "Global Active Power", cex=0.2)

## second plot
plot(datetime, data1$Voltage, type = "l", xlab="datetime", ylab = "Voltage")

## third plot
plot(datetime, data1$Sub_metering_1,type = "l", xlab="", ylab = "Energy sub metering")
lines(datetime, data1$Sub_metering_2, type="l", col="red")
lines(datetime, data1$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n", col=c("black", "red", "blue"), cex = 0.9)

## fourth plot
plot(datetime, data1$Global_reactive_power, type = "l", xlab="datetime",  ylab = "Global_reactive_power")

## close PNG device
dev.off()

