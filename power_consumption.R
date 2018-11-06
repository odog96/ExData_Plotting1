install.packages("tidyverse")
library(tidyverse)

setwd("C:/Users/olive/Documents/Data Science/Johns Hopkins DS Specialization/EDA/Week 1/Power Consumption Project")

# read in data
house.power<-read.table(file="household_power_consumption.txt",header= TRUE,sep = ";",
                        stringsAsFactors = FALSE)

#convert all non date/time vectors to numeric
house.power[,3:9] <- apply(house.power[,3:9], 2, function(x) as.numeric(as.character(x)));


# create vector containing which rows to keep
keep.rows<-grep("^1/2/2007|^2/2/2007",house.power$Date)
# subset house power data fram
house.power<-house.power[keep.rows,]

# creating date variable  - past date time/define format 
house.power$new.date<-paste(house.power$Date,house.power$Time)
#house.power$new.date<-strptime(house.power$new.date,"%m/%d/%Y %H:%M:%S")
house.power$new.date<-strptime(house.power$new.date,"%d/%m/%Y %H:%M:%S")
#class(house.power$new.date)

# Plot 1 - same code as plot1.r

with(house.power,hist(house.power$Global_active_power,col = "red",
                      xlab ="Global Active Power (kilowatts)", ylab="Frequency", 
                      main = "Global Active Power",ylim = c(0,1300)))
dev.copy(png, file = "plot1.png",width = 480, height = 480) ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!

## Plot 2 - same code as plot2.r

with(house.power,plot(as.POSIXct(house.power$new.date),house.power$Global_active_power,type = "l",
                      xlab ="",ylab="Global Active Power (kilowatts)",
                      yaxt ="n",ylim = c(0,7.7)))
axis(side=2,at=seq(0,6,2),tcl=-0.4,lwd.ticks=3)

## Plot 3 - same code as plot3.r
#par(mar= c(5.1,4.1,2.1,2.1))
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
###################################################################
# Plot 4 - same code as plot4.r
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
       legend = names(house.power)[7:9])

#plot 2,2

with(house.power,
     plot(as.POSIXct(house.power$new.date),house.power$Global_reactive_power ,
     xlab="datetime",ylab="Global_reactive_power",type = "l")
     )

dev.off()
