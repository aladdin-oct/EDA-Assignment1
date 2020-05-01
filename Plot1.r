file = "./household_power_consumption.txt"

cols <- read.csv2(file, header=TRUE, nrows = 1)
df <- read.csv2(file, skip = 66637, nrows = 2879, col.names = colnames(cols))
GAP <- as.numeric(df$Global_active_power)
png('Plot1.png', width = 480, height = 480)
hist(GAP, col='red', main='Global Active Power', xlab='Global Active Power (kilowatts)')
dev.off()

