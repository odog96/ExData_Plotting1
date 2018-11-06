if(file.exists("power_consumption.R")) {
    source("power_consumption.R")
}

# Plot 4 
png("plot4.png", 480, 480)
par(mfrow = c(2, 2))
with(house.power,
     # first plot
     plot(as.POSIXct(house.power$new.date),house.power$Global_active_power,type = "l",
          xlab ="",ylab="Global Active Power",
          yaxt ="n",ylim = c(0,7.7))
)
axis(side=2,at=seq(0,6,2),tcl=-0.4,lwd.ticks=3)

#plot 1,2

with(house.power, 
     plot(as.POSIXct(house.power$new.date),house.power$Voltage,type = "l",xlab="datetime",
          ylab="Voltage")
)



#plot 2,1
with(house.power,
     plot(as.POSIXct(house.power$new.date),house.power$Sub_metering_1,type = "l",
          xlab ="",ylab="Energy sub metering",
          yaxt ="n",ylim = c(0,40)))
points(as.POSIXct(house.power$new.date),house.power$Sub_metering_2,type = "l",
       col="red")
points(as.POSIXct(house.power$new.date),house.power$Sub_metering_3,type = "l",
       col="blue")

axis(side=2,at=seq(0,30,10),tcl=-0.4,lwd.ticks=4)

legend("topright", lty = 1,col=c("black","red","blue"), 
       legend = names(house.power)[7:9],bty = "n")

#plot 2,2

with(house.power,
     plot(as.POSIXct(house.power$new.date),house.power$Global_reactive_power ,
          xlab="datetime",ylab="Global_reactive_power",type = "l")
)

dev.off()