## This program will create a multi-line graph for sub metering
## variables for our power data.

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
dateTime<-NewDate+NewTime

##Design the chart
png(file="Plot3.png", width=480, height=480)
plot(power2$Sub_metering_1,power2$dateTime, type="l",lab=c(3,4,7),
     xlab=power2$DayofWklab, ylab="Energy sub metering")
points(power2$Sub_metering_2,type="l", col="red")
points(power2$Sub_metering_3,type="l", col="blue")
legend("topright", legend=c("Sub metering 1", "Sub metering 2",
     "Sub metering 3"), col=c("black","red","blue"), lty=c(1,1), cex=.5)
dev.off()
