
#load data
setwd("C:/Users/Joey/Study/EDAp1")
energy = read.table("household_power_consumption.txt", sep=";", header=TRUE)

#filter time to 1/2/07 and 2/2/07
library(dplyr)
energy= filter(energy, Date == "1/2/2007" | Date == "2/2/2007" )

#convert to time format
energy$Date2= paste(energy$Date, energy$Time)
energy$Date2= strptime(energy$Date2, "%d/%m/%Y %H:%M:%S")

plot(y=energy$Global_active_power, x=energy$Date2, type="l", xlab="",ylab="Global Active Power(kilowats)")

#save graph in wd
png("plot2.png", width=480, height=480, units="px")
plot(y=energy$Global_active_power, x=energy$Date2, type="l", xlab="",ylab="Global Active Power(kilowats)")
dev.off()

