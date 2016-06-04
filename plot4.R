## Name         : Yash Kumar Singh
## Program Title: Constructing plot4.png
## ------------------------------------------------------------------

##-------------------------------------------------------------------
## Reading data and altering it according to the need
##-------------------------------------------------------------------
data <- read.table('~/ExData_Plotting1/household_power_consumption.txt', sep = ';', header = TRUE, stringsAsFactors = FALSE)
data$datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
graphdata <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02", ]
rm(data)
rownames(graphdata) <- 1:nrow(graphdata)
for(i in 3:9){
    graphdata[, i] <- as.numeric(graphdata[, i])
}
rm(i)

##-------------------------------------------------------------------
## Constructing plot4.png
##-------------------------------------------------------------------
png(filename = "~/ExData_Plotting1/plot4.png", width = 480, height = 480, units = "px", bg = "white")
par(mfrow = c(2,2), mar = c(4,4,1.5,1.8))

## First Graph
##-------------
with(graphdata, plot(datetime, Global_active_power, type = "l", xlab = "",  ylab = "Global Active Power (kilowatts)", cex.lab = 0.8))

## Second Graph
##-------------
with(graphdata, plot(datetime, Voltage, type = "l", xlab = "datetime",  ylab = "Voltage", cex.lab = 0.8))

## Third Graph
##-------------
with(graphdata, plot(datetime, Sub_metering_1, type = "n", xlab = "",  ylab = "Energy sub metering", cex.lab = 0.8))
lines(graphdata$datetime, graphdata$Sub_metering_1, col = "black")
lines(graphdata$datetime, graphdata$Sub_metering_2, col = "red")
lines(graphdata$datetime, graphdata$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = "solid", col = c("black","red","blue"), bg = "transparent", box.col = "transparent", cex = 0.7)

## Fourth Graph
##-------------
with(graphdata, plot(datetime, Global_reactive_power, type = "l", xlab = "datetime",  ylab = "Global_reactive_power", cex.lab = 0.8))

dev.off()

##-------------------------------------------------------------------