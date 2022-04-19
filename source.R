data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

# Getting date and time
datetime <- strptime(paste(data$Date,as.character(data$Time)),"%Y-%m-%d %H:%M:%S")

# plot 1
hist(as.numeric(as.character(data$Global_active_power)),
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

# plot 2
plot(datetime, as.numeric(as.character(data$Global_active_power)), 
     type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# plot 3
plot(datetime, as.numeric(as.character(data$Sub_metering_1)), 
     type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, as.numeric(as.character(data$Sub_metering_2)),
      type = "l", col = "red")
lines(datetime, data$Sub_metering_3,
      type = "l", col = "blue")
legend("topright", "(x,y)", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1, cex = 0.6)

# plot 4
par(mfrow=c(2,2), mar = c(4,4,3,2)+0.1)
## similar to plot 2
plot(datetime, as.numeric(as.character(data$Global_active_power)), 
     type = "l", xlab = "", ylab = "Global Active Power")
## voltage plot
plot(datetime, as.numeric(as.character(data$Voltage)), 
     type = "l", xlab = "datetime", ylab = "Voltage")
## similar to plot 3
plot(datetime, as.numeric(as.character(data$Sub_metering_1)), 
     type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, as.numeric(as.character(data$Sub_metering_2)),
      type = "l", col = "red")
lines(datetime, data$Sub_metering_3,
      type = "l", col = "blue")
legend("topright", "(x,y)", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1, cex = 0.5, bty = "n")
## global reactive power plot
plot(datetime, as.numeric(as.character(data$Global_reactive_power)),
     type = "l", xlab = "datetime", ylab = "Global_reactive_power")