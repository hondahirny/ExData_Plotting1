Plot2 <- function() {
    
    bigdata <- read.table("household_power_consumption.txt",stringsAsFactors = FALSE, sep=";",header=1, colClasses = c(rep("character",times=2),rep("numeric",times=7)), na.strings = "?", nrows=70000)
    Feb1 <- bigdata$Date == "1/2/2007"
    Feb2 <- bigdata$Date == "2/2/2007"
    Feb1n2 <- Feb1 | Feb2
    bigdsubset <- bigdata[Feb1n2,]
    bigdsubset <- cbind("Date Time" = paste(bigdsubset$Date, bigdsubset$Time), bigdsubset)
    bigdsubset$`Date Time` <- strptime(bigdsubset$`Date Time`,"%d/%m/%Y %H:%M:%S")
    plot1output<<- bigdsubset
    plot(plot1output$`Date Time`,plot1output$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)")
    dev.copy(png,"Plot2.png")
    dev.off()
    
}