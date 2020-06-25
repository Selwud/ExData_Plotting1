## Clean environnement
rm(list=ls())
dev.off()

## Import library
library(data.table)
library(lubridate)

## Read selected data and transform date and time colums
Data <- fread("./exdata_data_household_power_consumption/household_power_consumption.txt",select=1:3,skip=66637,nrows=69517-66637)
Data$V1 <- dmy_hms(paste(Data$V1,Data$V2))
Data <- Data[,c(1,3)]
colnames(Data) <- c("Date_Time","Global_active_power")

## Plot on screen
with(Data,plot(Global_active_power~Date_Time,type="l",ylab="Global Active Power (kilowatts)",xlab="Days in French"))
## Copy to PNG
dev.copy(png,"plot2.png",width = 480, height = 480)
dev.off()