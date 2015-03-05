power <- read.csv("household_power_consumption.csv", sep = ";", stringsAsFactors = F, na.strings="?")
format <- data.frame(strptime(paste(power$Date, power$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"), power[3:9])
names(format)[1] <- "time"
startDate <- as.POSIXlt("2007-02-01 00:00:00")
endDate <- as.POSIXlt("2007-02-03 00:00:00")
timeFrame <- subset(format, time >= startDate & time < endDate)
png(
  "test.png",
  width     = 3.25,
  height    = 3.25,
  units     = "in",
  res       = 1200,
  pointsize = 4
)

par(mfrow=c(2, 2), lwd = 0.5)
plot(timeFrame$time, timeFrame$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
plot(timeFrame$time, timeFrame$Voltage, type = "l", ylab = "Global Active Power", xlab = "datetime")
plot(timeFrame$time, timeFrame$Sub_metering_1, type = "l", ylab = "Voltage", xlab = "")
lines(timeFrame$time, timeFrame$Sub_metering_2, type = "l", col = "red")
lines(timeFrame$time, timeFrame$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 1, lty = c(1, 1), lwd = c(1.5, 1.5), col = c("black", "blue", "red"))
plot(timeFrame$time, timeFrame$Global_reactive_power, type = "l", ylab = "Global Reactive Power", xlab = "")
dev.off()