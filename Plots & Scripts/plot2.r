file.name <- "household_power_consumption.txt"
data <- read.table(file.name, header=TRUE, sep=";", na.string="?")
data$dateTime <- do.call(paste, c(data[c("Date", "Time")], sep = " "))
data$dateTime <- strptime(data$dateTime, format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
dataSubs <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
png("plot2.png", height=480, width=480)
plot(dataSubs$dateTime,dataSubs$Global_active_power,pch="",xlab="",ylab="Global Active Power (kilowatts)")
lines(dataSubs$dateTime,dataSubs$Global_active_power)
dev.off()