download <- download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "temp")
unzip("temp")
unlink("temp")
hpcon <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

hpcon$dt <- strptime(paste(hpcon$Date, hpcon$Time), "%d/%m/%Y %H:%M:%S")

hpcon$Date <- as.Date(hpc$Date, "%d/%m/%Y")


hpcon_sub <- subset(hpcon, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
x

#Plot 2 (Line Chart of Global Active Power)
if(!file.exists('figures')) dir.create('figures')
png(filename = './figures/plot2.png', width = 480, height = 480, units='px')
plot(hpcon_sub$dt, hpcon_sub$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()   
