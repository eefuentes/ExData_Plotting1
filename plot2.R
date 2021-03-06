# Read household power consumption data. File shold be in current directory
hpc <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Convert Date and Time
hpc$dt <- paste(hpc$Date, hpc$Time)
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
hpc$dt <- strptime(hpc$dt, format = "%d/%m/%Y %H:%M:%S")

# Get subset
subhpc = subset(hpc, Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")))

# Make plot
png(file = "plot2.png", width = 480, height = 480)
plot(subhpc$dt, subhpc$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()
