
#load data
setwd("C:/Users/Joey/Study/EDAp1")
energy = read.table("household_power_consumption.txt", sep=";", header=TRUE)

#filter time to 1/2/07 and 2/2/07
library(dplyr)
energy= filter(energy, Date == "1/2/2007" | Date == "2/2/2007" )   

#convert to numeric     
energy$Sub_metering_1=as.numeric(as.character(energy$Sub_metering_1))
energy$Sub_metering_2=as.numeric(as.character(energy$Sub_metering_2))
energy$Sub_metering_3=as.numeric(as.character(energy$Sub_metering_3))

#convert to time format
energy$Date2= paste(energy$Date, energy$Time)
energy$Date2= strptime(energy$Date2, "%d/%m/%Y %H:%M:%S")

plot(y=energy$Sub_metering_1, x=energy$Date2, type="l", xlab="",ylab="Energy Sub Metering")        
lines(y=energy$Sub_metering_2, x=energy$Date2, col="red")     
lines(y=energy$Sub_metering_3, x=energy$Date2, col="blue")
legend("topright", col=c("black", "blue", "red"), legend= names(energy)[7:9], lty=c(1,1))

#save graph in wd
png("plot3.png", width=480, height=480, units="px")
plot(y=energy$Sub_metering_1, x=energy$Date2, type="l", xlab="",ylab="Energy Sub Metering")        
lines(y=energy$Sub_metering_2, x=energy$Date2, col="red")     
lines(y=energy$Sub_metering_3, x=energy$Date2, col="blue")
legend("topright", col=c("black", "blue", "red"), legend= names(energy)[7:9], lty=c(1,1))
dev.off()
