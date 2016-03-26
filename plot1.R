# download and load the data into R
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', 'power.zip')
unzip('power.zip')
power <- read.table('household_power_consumption.txt', sep =';', header=TRUE, stringsAsFactors=FALSE)

# We will only be using data from the dates 2007-02-01 and 2007-02-02. 
date1 <- power[power$Date == '2/2/2007', ]
date2 <- power[power$Date == '1/2/2007', ]
ds <- rbind(date1,date2)
gap <- as.numeric(ds$Global_active_power)

# plot 1
png("plot1.png", width = 480, height = 480, units = "px")
hist(gap, main="Global Active Power", ylab="Frequency", xlab='Global Active Power (kilowatts)', col = c('red'))
dev.off()