## 1.Download and unzip data 

library(dplyr)

### Download File
zipUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(zipUrl,destfile = "Household_Power_Consumption.zip",mode = 'wb')

### Unzip File
unzip("Household_Power_Consumption.zip")
?read.table

fdata <- read.table("Household_Power_Consumption.txt",sep = ";",na.strings = "?",header = TRUE,stringsAsFactors = FALSE)
str(fdata)

### Select the rows having date between 1/2/2007 and 2/2/2007 (ddmmyy)
fdata <- filter(fdata,Date == "1/2/2007"| Date == "2/2/2007")

### plot4.R ###
library(lubridate)
fdata$Date <- dmy(fdata$Date)
date_time <- paste(fdata$Date,fdata$Time)
date_time <- ymd_hms(date_time)
class(date_time)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(date_time,fdata$Global_active_power,type = "l",ylab = "Global Active Power")
plot(date_time,fdata$Voltage,type = "l",xlab = "datetime",ylab = "Voltage")
plot(date_time,fdata$Sub_metering_1,type = "l",ylab = "Energy submetering")
lines(date_time,fdata$Sub_metering_2,col = "red")
lines(date_time,fdata$Sub_metering_3,col = "blue")
plot(date_time,fdata$Global_reactive_power,type = "l",xlab = "datetime",ylab = "Global reactive power")
dev.copy(png,"plot4.png",height = 480,width = 480)
dev.off()