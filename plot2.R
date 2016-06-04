## Name         : Yash Kumar Singh
## Program Title: Constructing plot2.png
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
## Constructing plot2.png
##-------------------------------------------------------------------
png(filename = "~/ExData_Plotting1/plot2.png", width = 480, height = 480, units = "px", bg = "white")
par(mfrow = c(1,1), mar = c(3,5,2,2))
with(graphdata, plot(datetime, Global_active_power, type = "l", xlab = "",  ylab = "Global Active Power (kilowatts)"))
dev.off()

##-------------------------------------------------------------------