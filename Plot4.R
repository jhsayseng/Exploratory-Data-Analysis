download <- download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "temp")
unzip("temp")
unlink("temp")
hpcon <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

hpcon$dt <- strptime(paste(hpcon$Date, hpcon$Time), "%d/%m/%Y %H:%M:%S")

hpcon$Date <- as.Date(hpc$Date, "%d/%m/%Y")


hpcon_sub <- subset(hpcon, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#Plot 4 (Combination of 4 graphs)

if(!file.exists('figures')) dir.create('figures')

png(filename = './figures/plot4.png', width = 480, height = 480, units='px')

par(mfrow=c(2,2))

plot(hpcon_sub$dt, hpcon_sub$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(hpcon_sub$dt, hpcon_sub$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(hpcon_sub$dt, hpcon_sub$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",col="black")

points(hpcon_sub$dt,hpcon_sub$Sub_metering_2,type="l",col="red")

points(hpcon_sub$dt,hpcon_sub$Sub_metering_3,type="l",col="blue")

legend("topright",lty = 1,col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(hpcon_sub$dt, hpcon_sub$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
