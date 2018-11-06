if(file.exists("power_consumption.R")) {
    source("power_consumption.R")
}

png("plot3.png", 480, 480)
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
       legend = names(house.power)[7:9])

dev.off()

