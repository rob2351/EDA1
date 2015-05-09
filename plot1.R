## load dataset into dataframe EPC
EPC <- read.table("household_power_consumption.txt", header=TRUE,
                  sep=";", na.strings="?")

## discard observations outside required 2-day date range 
EPC2 <- subset(EPC, EPC$Date=="1/2/2007"|EPC$Date=="2/2/2007")

## create plot
png("plot1.png",width=480,height=480)
hist(EPC2$Global_active_power,xlab="Global Active Power (kilowatts)",
     col="red",main="Global Active Power")
dev.off()
