## This program will create Global Active Power in kilowatts
## and save it to a PNG file 480 pixels by 480 pixels
my_data<-read.table("household_power_consumption.txt", header = TRUE,sep=";",na.strings="?",stringsAsFactors = FALSE)
library(dplyr)
power<-tbl_df(my_data)
library(lubridate)
NewDate<-dmy(power$Date)
YearOnly<-year(NewDate)
MonthOnly<-month(NewDate)
DayOnly<-day(NewDate)
NewTime<-hms(power$Time)
power2=subset(power,YearOnly==2007 & MonthOnly==02 & DayOnly<03)

##Design the chart
png(file="Plot1.png", width=480, height=480)
hist(power2$Global_active_power,col='red',breaks=12, lab=c(4,7,), 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", 
     main="Global Active Power")
par(mfrow=c(1,1),mar=c(4,4,2,1))
dev.off()

