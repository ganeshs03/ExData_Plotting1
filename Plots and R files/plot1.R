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

### plot1.R ###
hist(fdata$Global_active_power,col = "red",main = "Global Active power", xlab = "Global Active Power(killowats)")
dev.copy(png,file = "plot1.png",height = 480,width = 480)
dev.off()