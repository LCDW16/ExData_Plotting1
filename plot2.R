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
data1[,3] <- as.numeric(data1[,3])

## plot datetime and global active powe
plot(datetime, data1$Global_active_power,type = "l", xlab="", ylab = "Global Active Power(kilowatts)")

library(datasets)
## copy plot to PNG file
dev.copy(png, width = 480, height = 480, file = "plot2.png")

## close PNG device
dev.off()

