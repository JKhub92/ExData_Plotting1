
#load data
setwd("C:/Users/Joey/Study/EDAp1")
energy = read.table("household_power_consumption.txt", sep=";", header=TRUE)

#filter time to 1/2/07 and 2/2/07
library(dplyr)
energy= filter(energy, Date == "1/2/2007" | Date == "2/2/2007" )

#convert to numeric
energy$Global_active_power=as.numeric(as.character(energy$Global_active_power))

#plot graph in screen
plot1<-hist(energy$Global_active_power, col="red", xlab="Global Active Power(kilowats)", main = "Global Active Power")

#save as png 480 by 480
png("plot1.png", width=480, height=480, units="px")
hist(energy$Global_active_power, col="red", xlab="Global Active Power(kilowats)", main = "Global Active Power")
dev.off()
