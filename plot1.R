power <- read.csv("household_power_consumption.csv", sep = ";", stringsAsFactors = F, na.strings="?")
format <- data.frame(strptime(paste(power$Date, power$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"), power[3:9])
names(format)[1] <- "time"
startDate <- as.POSIXlt("2007-02-01 00:00:00")
endDate <- as.POSIXlt("2007-02-03 00:00:00")
timeFrame <- subset(format, time >= startDate & time < endDate)
hist(timeFrame$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png,'plot1.png')
dev.off()