plot1 <- function(){
      min1 <- 6 * 60 + 36
      minday <- 24* 60
      days <- 15 + 31
      mintot <- days * minday + min1
      minsInSample <- 2 * minday
      tab <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", skip = mintot, 
                        nrows = minsInSample, na.strings = "?")
      names(tab) <- names(read.table("household_power_consumption.txt", header = TRUE, sep=";", 
                                     nrows=1))
      png(file = "plot1.png")
      hist(tab$Global_active_power,xlab="Global Active Power (kilowatts)", 
           main = "Global Active Power", col = "red")
      dev.off()
      
}