## load dataset into dataframe EPC
EPC <- read.table("household_power_consumption.txt", header=TRUE,
                  sep=";", na.strings="?")

## discard observations outside required 2-day date range 
EPC2 <- subset(EPC, EPC$Date=="1/2/2007"|EPC$Date=="2/2/2007")

## convert date and time to POSIXlt
dates_and_times <- paste(as.character(EPC2$Date), as.character(EPC2$Time))
EPC2$DateTime <- strptime(dates_and_times, tz="", format="%d/%m/%Y %H:%M:%S")

## create plot
png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))
## first plot in top-left quadrant
plot(x=EPC2$DateTime, y=EPC2$Global_active_power,type="l",
     ylab="Global Active Power (kilowatts)",xlab="")
## second plot in top-right quadrant
plot(x=EPC2$DateTime, y=EPC2$Voltage,type="l",
     ylab="Voltage",xlab="datetime")
## third plot in bottom-left quadrant
plot(x=EPC2$DateTime, y=EPC2$Sub_metering_1,type="l",
     ylab="Energy sub metering",xlab="")
points(x=EPC2$DateTime, y=EPC2$Sub_metering_2,type="l",col="red")
points(x=EPC2$DateTime, y=EPC2$Sub_metering_3,type="l",col="purple")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),col=c("black","red","purple"))
## fourth plot in bottom-right quadrant
plot(x=EPC2$DateTime, y=EPC2$Global_reactive_power, type="l",
     ylab="Global_reactive_power",xlab="datetime")
dev.off()
