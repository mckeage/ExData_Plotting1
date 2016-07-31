## This program will create a set of four graphs for our power data.

my_data<-read.table("household_power_consumption.txt", header = TRUE,sep=";",na.strings="?",stringsAsFactors = FALSE)
library(dplyr)
power<-tbl_df(my_data)
library(lubridate)
NewDate<-dmy(power$Date)
YearOnly<-year(NewDate)
MonthOnly<-month(NewDate)
DayOnly<-day(NewDate)
NewTime<-hms(power$Time)
dateTime<-dmy(power$Date)+hms(power$Time)
DayofWk<-wday(NewDate)
DayofWklab<-wday(NewDate, label=TRUE, abbr=TRUE)
power2=subset(power,YearOnly==2007 & MonthOnly==02 & DayOnly<03)


##Design the chart
par(mfcol = c(2, 2),mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
plot(power2$Global_active_power,power2$dateTime, type="l",ylab="Global Active Power (kilowatts)")
plot(power2$Sub_metering_1,power2$dateTime, type="l",lab=c(3,4,7),
     xlab=power2$DayofWklab, ylab="Energy sub metering")
points(power2$Sub_metering_2,type="l", col="red")
points(power2$Sub_metering_3,type="l", col="blue")
legend("topright", legend=c("Sub metering 1", "Sub metering 2",
                            "Sub metering 3"), col=c("black","red","blue"), lty=c(1,1), cex=.15)
plot(power2$Voltage,power2$dateTime, type="l",xlab="datetime", ylab="Voltage")
plot(power2$Global_reactive_power,power2$dateTime, type="l", xlab="datetime", 
     ylab="Global_reactive_power")
dev.copy(png,file="Plot4.png")
dev.off()

