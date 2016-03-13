# plot 4
# read data (only first 100000, checked before with excel the two needed dates are within this range)
dataAll <- read.csv("../data/household_power_consumption.csv", sep = ";", nrows = 100000, na.strings = "?")
data <- dataAll[dataAll$Date %in% c("1/2/2007","2/2/2007") ,] ## subset only the first two days in february

# Make new vector with date and time together
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## plot graph
png("plot4.png")
par(mfcol = c(2,2))
## plot upper left (plot 2)
plot(datetime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")
## plot down left (plot 3)
plot(datetime, data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, data$Sub_metering_2, type="l", col="red")
lines(datetime, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1, col=c("black", "red", "blue"), bty = "n")
## plot upper right
plot(datetime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")
## plot down right
plot(datetime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
