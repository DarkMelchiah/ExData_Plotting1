file.name <- "household_power_consumption.txt"
data <- read.table(file.name, header=TRUE, sep=";", na.string="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
dataSubs <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
png("plot1.png", height=480, width=480)
hist(dataSubs$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()