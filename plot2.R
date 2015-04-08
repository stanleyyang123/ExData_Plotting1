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



#--- plot 2
png(filename = "plot2.png",
           width = 480, height = 480, units = "px")
with(DataSelect, plot(DT ,Global_active_power, xlab="", 
                        ylab="Global Active Power (kilowatts)", type="l"))
dev.off()

