# download and load the data into R
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', 'power.zip')
unzip('power.zip')
power <- read.table('household_power_consumption.txt', sep =';', header=TRUE, stringsAsFactors=FALSE, dec='.')

# We will only be using data from the dates 2007-02-01 and 2007-02-02. 
date1 <- power[power$Date == '2/2/2007', ]
date2 <- power[power$Date == '1/2/2007', ]
ds <- rbind(date2,date1)
gap <- as.numeric(ds$Global_active_power)
times <- strptime(paste(ds$Date, ds$Time), format="%d/%m/%Y%H:%M:%S")

# plot 2
png("plot2.png", width = 480, height = 480, units = "px")
plot(times, gap, type='l', xlab = '', ylab="Global Active Power (kilowatts)")
dev.off()