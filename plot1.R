# plot 1
# read data (only first 100000, checked before with excel the two needed dates are within this range)
dataAll <- read.csv("../data/household_power_consumption.csv", sep = ";", nrows = 100000, na.strings = "?")
data <- dataAll[dataAll$Date %in% c("1/2/2007","2/2/2007") ,] ## subset only the first two days in february

## plot histogram
png("plot1.png")
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
