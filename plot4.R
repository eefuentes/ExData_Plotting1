# Read household power consumption data. File shold be in current directory
hpc <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Convert Date and Time
hpc$dt <- paste(hpc$Date, hpc$Time)
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
hpc$dt <- strptime(hpc$dt, format = "%d/%m/%Y %H:%M:%S")

# Get subset
subhpc = subset(hpc, Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")))

# Make plots
png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

# Plot 1 - Global Active Power
plot(subhpc$dt, subhpc$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power")

# Plot 2 - Voltage
plot(subhpc$dt, subhpc$Voltage, type = "l", xlab = "datetime",
     ylab = "Voltage")

# Plot 3 - Energy sub metering
plot(subhpc$dt, subhpc$Sub_metering_1, type = "l", xlab = "",
     ylab = "Energy sub metering", col = "black")
lines(subhpc$dt, subhpc$Sub_metering_2, col = "red")
lines(subhpc$dt, subhpc$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_2"),
       lty = 1, col = c("black", "red", "blue"), bty = "n")

# Plot 4 - Global Reactive Power
plot(subhpc$dt, subhpc$Global_active_power, type = "l", xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()
