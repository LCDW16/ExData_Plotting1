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

## plot frequency of Global_active_power
data1[,3] <- as.numeric(data1[,3])
hist(data1$Global_active_power, col = "red", xlab = "Global Active Power(kilowatts)", main ="Global Active Power" )
title ("Global Active Power")

library(datasets)
## copy plot to PNG file
dev.copy(png, width = 480, height = 480, file = "plot1.png")

## close PNG device
dev.off()