## loading the libs
library(dplyr)
library(tidyr)
library(plotly)
## reading in the data. assuming data is in the same directory as the code

## saving the file name 
file <- "household_power_consumption.txt"
data <- read.delim(file, sep = ";")

## subsetting the data as we only need from dates feb 1st, 2007 and feb 2nd, 2007
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

## correcting the date format
data <- mutate(data, Date = as.Date(Date, format = "%d/%m/%Y"))
data <- mutate(data, Date = paste(Date, Time))
data$Time <- NULL
data <- mutate(data, Date = as.POSIXct(Date, tz = Sys.timezone()))

## turning into a numeric data 
data <- mutate(data, global = as.numeric(Global_active_power))

## printing the plot to png
png(file = "myplot_2.png", height = 480, width = 480)
plot(data$Date, data$global, ty = "l", col = "gold", 
     ylab = "Global Active Power (Kilowatts)")
dev.off()