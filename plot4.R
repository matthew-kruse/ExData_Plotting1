# download and load the data into R
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', 'power.zip')
unzip('power.zip')
power <- read.table('household_power_consumption.txt', sep =';', header=TRUE, stringsAsFactors=FALSE, dec='.')

# We will only be using data from the dates 2007-02-01 and 2007-02-02. 
date1 <- power[power$Date == '2/2/2007', ]
date2 <- power[power$Date == '1/2/2007', ]
ds <- rbind(date2,date1)
gap <- as.numeric(ds$Global_active_power)
voltage <- as.numeric(ds$Voltage)
esm1 <- as.numeric(ds$Sub_metering_1)
esm2 <- as.numeric(ds$Sub_metering_2)
esm3 <- as.numeric(ds$Sub_metering_3)
grp <- as.numeric(ds$Global_reactive_power)
times <- strptime(paste(ds$Date, ds$Time), format="%d/%m/%Y%H:%M:%S")

# plot 4
png("plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
plot(times, gap, type='l', xlab = '', ylab="Global Active Power (kilowatts)")
plot(times, voltage, type='l', ylab="Voltage", xlab='datetime')
plot(times, esm1, type='l', xlab = '', ylab="Energy Sub Metering")
lines(times, esm2, col='red')
lines(times, esm3, col='blue')
legend("topright", legend = c('Sub Metering 1', 'Sub Metering 2', 'Sub Metering 3'), col=c('black', 'red', 'blue'), lty=1)
plot(times, grp, type='l', ylab="Global Reactive Power", xlab='datetime')
dev.off()