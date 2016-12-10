#load data
setwd("C:/Users/Joey/Study/EDAp1")
energy = read.table("household_power_consumption.txt", sep=";", header=TRUE)

#filter time to 1/2/07 and 2/2/07
library(dplyr)
energy= filter(energy, Date == "1/2/2007" | Date == "2/2/2007" )

#convert to numeric
energy$Voltage=as.numeric(as.character(energy$Voltage))
energy$Global_reactive_power=as.numeric(as.character(energy$Global_reactive_power))
energy$Sub_metering_1=as.numeric(as.character(energy$Sub_metering_1))
energy$Sub_metering_2=as.numeric(as.character(energy$Sub_metering_2))
energy$Sub_metering_3=as.numeric(as.character(energy$Sub_metering_3))
energy$Global_active_power=as.numeric(as.character(energy$Global_active_power))

#convert to time format
energy$Date2= paste(energy$Date, energy$Time)
energy$Date2= strptime(energy$Date2, "%d/%m/%Y %H:%M:%S")

#generate graph in R
par(mfrow = c(2,2))
with(energy,{
  plot(y=energy$Global_active_power, x=energy$Date2, type="l", xlab="",ylab="Global Active Power(kilowats)")
  plot(y=energy$Voltage, x=energy$Date2, type="l",ylab="Voltage", xlab="datetime")
  plot(y=energy$Sub_metering_1, x=energy$Date2, type="l", xlab="",ylab="Energy Sub Metering")        
  lines(y=energy$Sub_metering_2, x=energy$Date2, col="red")     
  lines(y=energy$Sub_metering_3, x=energy$Date2, col="blue")
  legend("topright", col=c("black", "blue", "red"), legend= names(energy)[7:9], lty=c(1,1), bty="n")
  plot(y=energy$Global_reactive_power, x=energy$Date2, type="l", ylab="Global_reactive_power",xlab="datetime")
}

)

par(mfrow=c(1,1))

#save graph in wd
png("plot4.png", width=480, height=480, units="px")

par(mfrow = c(2,2))

with(energy,{
  plot(y=energy$Global_active_power, x=energy$Date2, type="l", xlab="",ylab="Global Active Power(kilowats)")
  plot(y=energy$Voltage, x=energy$Date2, type="l",ylab="Voltage", xlab="datetime")
  plot(y=energy$Sub_metering_1, x=energy$Date2, type="l", xlab="",ylab="Energy Sub Metering")        
  lines(y=energy$Sub_metering_2, x=energy$Date2, col="red")     
  lines(y=energy$Sub_metering_3, x=energy$Date2, col="blue")
  legend("topright", col=c("black", "blue", "red"), legend= names(energy)[7:9], lty=c(1,1), bty="n")
  plot(y=energy$Global_reactive_power, x=energy$Date2, type="l", ylab="Global_reactive_power",xlab="datetime")
}
)

dev.off()
par(mfrow=c(1,1))
