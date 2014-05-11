setwd("../Downloads")
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
newdf <- subset(df, Date %in% c("1/2/2007","2/2/2007"))

newdf$datetime <- strptime(paste(newdf$Date, newdf$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

png("plot1.png", height=480, width=480)
hist(newdf$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
