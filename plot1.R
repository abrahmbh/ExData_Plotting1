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

## turning into a numeric data 
data <- mutate(data, global = as.numeric(Global_active_power))
## saving the plot as png
png(file = "myplot_1.png", height = 480, width = 480)
hist(data$global, col = "gold", main = "Global Active Power",
     xlab = "Global Active Power (Kilowatts)")
dev.off()