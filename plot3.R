## Clean environnement
rm(list=ls())
dev.off()

## Import library
library(data.table)
library(lubridate)

## Read selected data and transform date and time colums
Data <- fread("./exdata_data_household_power_consumption/household_power_consumption.txt",select=c(1:2,7:9),skip=66637,nrows=69517-66637)
Data$V1 <- dmy_hms(paste(Data$V1,Data$V2))
Data <- Data[,c(1,3:5)]
colnames(Data) <- c("Date_Time","Sub_metering_1","Sub_metering_2","Sub_metering_3")

## Plot on screen
with(Data,plot(Sub_metering_1 ~ Date_Time,type="l",ylab="Energy sub metering",xlab="Days in French",col="black"))
with(Data,lines(Sub_metering_2 ~ Date_Time,col="red"))
with(Data,lines(Sub_metering_3 ~ Date_Time,col="blue"))
legend("topright",col=c("black","red","blue"),legend=colnames(Data)[2:4],lty=1)
## Copy to PNG
dev.copy(png,"plot3.png",width = 480, height = 480)
dev.off()