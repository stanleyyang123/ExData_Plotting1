# load data
## fast read data to get class attibutes for each column
init<-read.table("household_power_consumption.txt",
                 header=TRUE, na.strings="?", sep=";", nrows=20)
classes <- sapply(init, class) 
## load all the data to DataAll with each colClasses argument specified
## to make read.table() run faster 
DataAll <- read.table("household_power_consumption.txt",
                      header=TRUE, na.strings="?", sep=";", colClasses=classes)

# select data from the dates 2007-02-01 and 2007-02-02
DataAll$Date <- as.character(DataAll$Date)
DataSelect<-subset(DataAll, (DataAll$Date=="1/2/2007")|(DataAll$Date=="2/2/2007"))
# Extrat time and store in a new DT variable in DataSelect dataset
DataSelect$DT <- paste(DataSelect$Date, DataSelect$Time)
DataSelect$DT <- strptime(DataSelect$DT, format="%d/%m/%Y %H:%M:%S")


# make plot 1 
png(filename = "plot1.png",
    width = 480, height = 480, units = "px")
with(DataSelect, hist(Global_active_power, 
      col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)"))
dev.off()

