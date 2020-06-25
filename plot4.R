## Clean environnement
rm(list=ls())
dev.off()

## Import library
library(data.table)
library(lubridate)

## Read selected data and transform date and time colums
Data <- fread("./exdata_data_household_power_consumption/household_power_consumption.txt",drop=6,skip=66637,nrows=69517-66637)
Data$V1 <- dmy_hms(paste(Data$V1,Data$V2))
Data <- Data[,c(1,3:8)]
colnames(Data) <- c("Date_Time","Global_active_power","Global_reactive_power","Voltage","Sub_metering_1","Sub_metering_2","Sub_metering_3")

## Plot on screen
par(mfrow=c(2,2))

with(Data,plot(Global_active_power~Date_Time,type="l",ylab="Global Active Power",xlab="Days in French"))

with(Data,plot(Voltage~Date_Time,type="l",ylab="Voltage",xlab="Days in French"))

with(Data,plot(Sub_metering_1 ~ Date_Time,type="l",ylab="Energy sub metering",xlab="Days in French",col="black"))
with(Data,lines(Sub_metering_2 ~ Date_Time,col="red"))
with(Data,lines(Sub_metering_3 ~ Date_Time,col="blue"))
legend("top",col=c("black","red","blue"),legend=colnames(Data)[5:7],lty=1,box.lty=0)

with(Data,plot(Global_reactive_power~Date_Time,type="l",xlab="Days in French"))

## Copy to PNG
dev.copy(png,"plot4.png",width = 480, height = 480)
dev.off()