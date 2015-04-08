# load data
init<-read.table("household_power_consumption.txt",
                 header=TRUE, na.strings="?", sep=";", nrows=20)
classes <- sapply(init, class)
DataAll <- read.table("household_power_consumption.txt",
                 header=TRUE, na.strings="?", sep=";", )

# select data from the dates 2007-02-01 and 2007-02-02
DataAll$Date <- as.character(DataAll$Date)
DataSelect<-subset(DataAll, (DataAll$Date=="1/2/2007")|(DataAll$Date=="2/2/2007"))
DataSelect$DT <- paste(DataSelect$Date, DataSelect$Time)
DataSelect$DT <- strptime(DataSelect$DT, format="%d/%m/%Y %H:%M:%S")

# plot 3
png(filename = "plot3.png",
    width = 480, height = 480, units = "px")
with(DataSelect, plot(DT, Sub_metering_1, type="l", 
                      xlab="", ylab="Energy Submetering"))
with(DataSelect, lines(DT,Sub_metering_2, col="red"))
with(DataSelect, lines(DT,Sub_metering_3, col="blue"))
legend("topright", lty = 1, col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
