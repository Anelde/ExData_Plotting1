# plot 3
# read data (only first 100000, checked before with excel the two needed dates are within this range)
dataAll <- read.csv("../data/household_power_consumption.csv", sep = ";", nrows = 100000, na.strings = "?")
data <- dataAll[dataAll$Date %in% c("1/2/2007","2/2/2007") ,] ## subset only the first two days in february

# Make new vector with date and time together
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## plot graph
png("plot3.png")
plot(datetime, data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, data$Sub_metering_2, type="l", col="red")
lines(datetime, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"))
dev.off()
