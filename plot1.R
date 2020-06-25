## Clean environnement
rm(list=ls())
dev.off()

## Import library
library(data.table)
library(lubridate)

## Read selected data and transform date and time colums
Data <- fread("./exdata_data_household_power_consumption/household_power_consumption.txt",select=1:3,skip=66637,nrows=69517-66637)
colnames(Data) <- c("Date","Time","Global_active_power")
Data$Date <- dmy(Data$Date)
Data$Time <- hms(Data$Time)

## Plot on screen
with(Data,hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))
## Copy to PNG
dev.copy(png,"plot1.png",width = 480, height = 480)
dev.off()