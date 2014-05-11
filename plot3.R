setwd("../Downloads")
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
newdf <- subset(df, Date %in% c("1/2/2007","2/2/2007"))

newdf$datetime <- strptime(paste(newdf$Date, newdf$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

png("plot3.png", height=480, width=480)
with(newdf, plot(datetime, Sub_metering_1, type = "n", xlab="", ylab="Energy sub metering"))
lines(newdf$datetime, newdf$Sub_metering_1)
lines(newdf$datetime, newdf$Sub_metering_2, col="red")
lines(newdf$datetime, newdf$Sub_metering_3, col="blue")
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
