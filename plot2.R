if(file.exists("power_consumption.R")) {
    source("power_consumption.R")
}
with(house.power,plot(as.POSIXct(house.power$new.date),house.power$Global_active_power,type = "l",
                      xlab ="",ylab="Global Active Power (kilowatts)",
                      yaxt ="n",ylim = c(0,7.7)))
axis(side=2,at=seq(0,6,2),tcl=-0.4,lwd.ticks=3)

dev.copy(png, file = "plot2.png",width = 480, height = 480) ## Copy plot
dev.off() ## close the PNG device
