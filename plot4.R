## loading the libs
library(dplyr)
library(tidyr)
library(plotly)
## reading in the data. assuming data is in the same directory as the code

## saving the file name 
file <- "household_power_consumption.txt"
data <- read.delim(file, sep = ";")
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

## subsetting sub1, sub2, sub3 as numeric
globala <- as.numeric(data$Global_active_power)
globalr <- as.numeric(data$Global_reactive_power)
voltage <- as.numeric(data$Voltage)
sub1 <- as.numeric(data$Sub_metering_1)
sub2 <- as.numeric(data$Sub_metering_2)
sub3 <- as.numeric(data$Sub_metering_3)

## subsetting date and time as posixct
time <- as.Date(data$Date, format="%d/%m/%Y")
time <- paste(time, data$Time)
time <- as.POSIXct(time)

## plotting the graph
png(file = "myplot_4.png", height = 480, width = 480)
par(mfrow = c(2,2))
plot(time,globala,ty="l",ylab="Global Active Power",xlab="")
plot(time,voltage,ty="l",ylab="Voltage",xlab="")
plot(time,sub1,ty="l", col = "red", ylab="Energy Sub Metering",xlab="")
lines(time, sub2, ty="l", col="gold")
lines(time, sub3, ty="l", col="blue")
legend("topright", legend=c("sub_metering_1", "sub_metering_2", "sub_metering_3"), 
       col = c("pink", "gold", "blue"), lty = 1)
plot(time,globalr,ty="l",ylab="Global_reactive_power",xlab="")
dev.off()