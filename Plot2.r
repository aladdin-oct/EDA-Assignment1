file = "./household_power_consumption.txt"

cols <- read.csv2(file, header=TRUE, nrows = 1)
df <- read.csv2(file, skip = 66637, nrows = 2879, col.names = colnames(cols))
GAP <- as.numeric(df$Global_active_power)
datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png('Plot3.png', width = 480, height = 480)
plot(datetime, GAP, type = 'l', xlab='',ylab='Global Active Power (kilowatts)' )
dev.off()