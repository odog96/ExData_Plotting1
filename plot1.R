if(file.exists("power_consumption.R")) {
    source("power_consumption.R")
}
with(house.power,hist(house.power$Global_active_power,col = "red",xlab ="Global Active Power (kilowatts)",
                      ylab="Frequency", main = "Global Active Power",ylim = c(0,1300)))

dev.copy(png, file = "plot1.png",width = 480, height = 480) ## Copy plot
dev.off() ## close the PNG device