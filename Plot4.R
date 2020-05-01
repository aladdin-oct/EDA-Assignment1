
file='./household_power_consumption.txt'
skiprows = 66637
maxrows = 24*2*60-1
cols <- colnames(read.csv2(file, header = TRUE, nrows = 1))
df <- read.table(file, col.names = cols, skip = skiprows, nrows= maxrows, sep=';',colClasses = c(rep('character',2), rep('numeric',7)))
df$Datetime <- paste(df$Date, df$Time, sep = ' ')
df$Datetime <- strptime(df$Datetime, format = "%d/%m/%Y %H:%M:%S")
png("Plot4.png", width=480, height=480)
par(mfrow=c(2,2),mar=c(4.1,4,.6,1))
with(df,{
  plot(Datetime, Global_active_power, type = 'l', xlab='',ylab='Global Active Power',cex=0.2 )
  plot(Datetime, Voltage, type = 'l', xlab = 'datetime', ylab = 'Voltage')
  plot(Datetime, Sub_metering_1, type = 'l', col= 'black', xlab = '', ylab = "Energy sub metering")
lines(Datetime, Sub_metering_2, type = 'l', col= 'red')
lines(Datetime, Sub_metering_3, type = 'l', col= 'blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2.5, col=c("black", "red", "blue"), bty='n')
  plot(Datetime, Global_reactive_power, type = 'l', xlab = 'datetime')
  
})
dev.off()

