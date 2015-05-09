## load dataset into dataframe EPC
EPC <- read.table("household_power_consumption.txt", header=TRUE,
                  sep=";", na.strings="?")

## discard observations outside required 2-day date range 
EPC2 <- subset(EPC, EPC$Date=="1/2/2007"|EPC$Date=="2/2/2007")

## convert date and time to POSIXlt
dates_and_times <- paste(as.character(EPC2$Date), as.character(EPC2$Time))
EPC2$DateTime <- strptime(dates_and_times, tz="", format="%d/%m/%Y %H:%M:%S")

## create plot
png("plot2.png",width=480,height=480)
plot(x=EPC2$DateTime, y=EPC2$Global_active_power,type="l",
     ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
