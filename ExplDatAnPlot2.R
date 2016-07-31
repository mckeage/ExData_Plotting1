## This program will create a line graph for Global Active Power 
## in kilowatts and save it to a PNG file 480 pixels by 480 pixels

my_data<-read.table("household_power_consumption.txt", header = TRUE,sep=";",na.strings="?",stringsAsFactors = FALSE)
library(dplyr)
power<-tbl_df(my_data)
library(lubridate)
NewDate<-dmy(power$Date)
YearOnly<-year(NewDate)
MonthOnly<-month(NewDate)
DayOnly<-day(NewDate)
NewTime<-hms(power$Time)
DayofWk<-wday(NewDate)
DayofWklab<-wday(NewDate, label=TRUE, abbr=TRUE)
power2=subset(power,YearOnly==2007 & MonthOnly==02 & DayOnly<03)


##Design the chart
png(file="Plot2.png", width=480, height=480)
plot(power2$Global_active_power,power2$NewTime, type="l",lab=c(3,4,7), 
     ylab="Global Active Power (kilowatts)")
dev.off()

