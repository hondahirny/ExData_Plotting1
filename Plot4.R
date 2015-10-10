Plot4 <- function() {
    
    bigdata <- read.table("household_power_consumption.txt",stringsAsFactors = FALSE, sep=";",header=1, colClasses = c(rep("character",times=2),rep("numeric",times=7)), na.strings = "?", nrows=70000)
    Feb1 <- bigdata$Date == "1/2/2007"
    Feb2 <- bigdata$Date == "2/2/2007"
    Feb1n2 <- Feb1 | Feb2
    bigdsubset <- bigdata[Feb1n2,]
    bigdsubset <- cbind("Date Time" = paste(bigdsubset$Date, bigdsubset$Time), bigdsubset)
    bigdsubset$`Date Time` <- strptime(bigdsubset$`Date Time`,"%d/%m/%Y %H:%M:%S")
    plot1output<<- bigdsubset
    
    par(mfcol = c(2,2),mar = c(4,4,2,4))
    plot(plot1output$`Date Time`,plot1output$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)")
    
    plot(plot1output$`Date Time`,plot1output$Sub_metering_1,type = "l",xlab = "",ylab = "Energy sub metering")
    points(plot1output$`Date Time`,plot1output$Sub_metering_2,type = "l",col = "red")
    points(plot1output$`Date Time`,plot1output$Sub_metering_3,type = "l", col = "blue")
    legend("topright", bty = "n", xjust = 1, cex = 0.7, y.intersp = 0.9, lwd = 1, col = c("black","blue","red"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
    
    plot(plot1output$`Date Time`,plot1output$Voltage,type = "l",xlab = "datetime",ylab = "Voltage")
    
    plot(plot1output$`Date Time`,plot1output$Global_reactive_power,type = "l",xlab = "datetime",ylab = "Global_reactive_power")
    
    dev.copy(png,"Plot4.png")
    dev.off()
    
}