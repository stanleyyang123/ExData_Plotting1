# Please remove # in load data and select data setion if you haven't run plot1.R previously

##--- load data
#init<-read.table("household_power_consumption.txt",header=TRUE, na.strings="?", sep=";", nrows=20)
#classes <- sapply(init, class)
#DataAll <- read.table("household_power_consumption.txt",header=TRUE, na.strings="?", sep=";", )

##--- select data from the dates 2007-02-01 and 2007-02-02
#DataAll$Date <- as.character(DataAll$Date)
#DataSelect<-subset(DataAll, (DataAll$Date=="1/2/2007")|(DataAll$Date=="2/2/2007"))
#DataSelect$DT <- paste(DataSelect$Date, DataSelect$Time)
#DataSelect$DT <- strptime(DataSelect$DT, format="%d/%m/%Y %H:%M:%S")

# make plot 4
png(filename = "plot4.png",
    width = 480, height = 480, units = "px")
par(mfcol=c(2,2), mar=c(4,4,2,2))
with(DataSelect, {
    plot(DT ,Global_active_power, xlab="", 
              ylab="Global Active Power", type="l")
    {plot(DT, Sub_metering_1, type="l", 
         xlab="", ylab="Energy Submetering")
    lines(DT,Sub_metering_2, col="red")
    lines(DT,Sub_metering_3, col="blue")
    legend("topright", lty = 1, col=c("black", "red", "blue"), 
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    }
    plot(DT, Voltage, type="l", xlab="datetime")
    plot(DT, Global_reactive_power, type="l", xlab="datetime")
})
dev.off()
