plot4 <- function(){
      
      min1 <- 6 * 60 + 36
      minday <- 24* 60
      days <- 15 + 31
      mintot <- days * minday + min1
      minsInSample <- 2 * minday
      tab <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", skip = mintot, 
                        nrows = minsInSample, na.strings = "?")
      names(tab) <- names(read.table("household_power_consumption.txt", header = TRUE, sep=";", 
                                     nrows=1))
      
      date <- as.Date(tab$Date, "%d/%m/%Y")
      time <- as.character(tab$Time)
      tz <- rep("UTC", length(date))
      dateTime <- strptime(paste(date, time), format="%Y-%m-%d %H:%M:%S")
      gap <- tab$Global_active_power
      x <- unclass(as.POSIXct(dateTime))
      
      png(file = "plot4.png")
      par(mfcol = c(2,2))
      
      # top left plot

      plot(x, tab$Global_active_power, ylab="Global Active Power (kilowatts)", type = "l", 
           xaxt = "n", cex = 1, cex.lab = .7, xlab = "")
      axis(1, labels = c("Thu", "Fri", "Sat"), at = c(x[1],x[1]+3600*24,x[1]+3600*48), 
           cex.axis = .8, cex=1)      
      
      # bottom left plot
      plot(x, tab$Sub_metering_1, ylab="Energy sub metering", type = "l", 
           xaxt = "n", xlab = "", cex.axis=.8)
      lines(x, tab$Sub_metering_2, col = "red")
      lines(x, tab$Sub_metering_3, col = "blue")
      axis(1, labels = c("Thu", "Fri", "Sat"), at = c(x[1],x[1]+3600*24,x[1]+3600*48), 
           cex.axis = .8, cex=1)      
      legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
             col = c("black", "red","blue"), lwd=1,  bty = "n")
      
      # top right plot
      plot(x, tab$Voltage, ylab = "Voltage", xlab = "datetime", xaxt = "n", cex.axis=.8, 
           type = "l")
      axis(1, labels = c("Thu", "Fri", "Sat"), at = c(x[1],x[1]+3600*24,x[1]+3600*48), 
           cex.axis = .8, cex=1)
      
      # bottom right plot
      plot(x, tab$Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", 
           xaxt = "n", cex.axis=.8, type = "l", yaxt = "n")
      axis(1, labels = c("Thu", "Fri", "Sat"), at = c(x[1],x[1]+3600*24,x[1]+3600*48), 
           cex.axis = .8, cex=1)
      ylabs <- (seq(1:6)-1)*.1
      cylabs <- as.character(ylabs)
      cylabs[1] <- "0.0"
      axis(2, labels = cylabs, at = ylabs, cex.axis = .7, cex=1, cex.lab = .8)
      
      dev.off()     
      
      
      
}