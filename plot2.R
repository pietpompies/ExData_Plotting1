setwd("../Downloads")
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
newdf <- subset(df, Date %in% c("1/2/2007","2/2/2007"))

newdf$datetime <- strptime(paste(newdf$Date, newdf$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

png("plot2.png", height=480, width=480)
with(newdf, plot(datetime, Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()
