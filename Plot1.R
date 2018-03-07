download <- download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "temp")
unzip("temp")
unlink("temp")
hpcon <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

hpcon$dt <- strptime(paste(hpcon$Date, hpcon$Time), "%d/%m/%Y %H:%M:%S")

hpcon$Date <- as.Date(hpc$Date, "%d/%m/%Y")


hpcon_sub <- subset(hpcon, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
x


#Plot 1 (Hitogram)
if(!file.exists('figures')) dir.create('figures')
png(filename = './figures/plot1.png', width = 480, height = 480, units='px')
hist(hpcon_sub$Global_active_power,xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power", col="red")
dev.off()
