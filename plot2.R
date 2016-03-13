# plot 2
# read data (only first 100000, checked before with excel the two needed dates are within this range)
dataAll <- read.csv("../data/household_power_consumption.csv", sep = ";", nrows = 100000, na.strings = "?")
data <- dataAll[dataAll$Date %in% c("1/2/2007","2/2/2007") ,] ## subset only the first two days in february

# Make new vector with date and time together
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## plot graph
png("plot2.png")
plot(datetime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
