plot2 <- function() {
      
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
      png(file = "plot2.png")
      plot(x, tab$Global_active_power, ylab="Global Active Power (kilowatts)", type = "l", 
           xaxt = "n", xlab = "")
      axis(1, labels = c("Thu", "Fri", "Sat"), at = c(x[1],x[1]+3600*24,x[1]+3600*48), 
           cex.axis = .8, cex=1)      
      dev.off()
}