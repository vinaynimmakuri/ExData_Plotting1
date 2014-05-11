# to read the file 
EPC <- read.table("household_power_consumption.txt",sep=";", na.strings = "?", header=TRUE)
#converting to Date
EPC$Date <- as.Date(EPC$Date,format = '%d/%m/%y')
# converting to timestamp
EPC$Time <- strptime(EPC$Time,format = '%I:%M%p')
# reading the subset
EPCSUB <- EPC[which(EPC$Date %in% ('2007-02-01','2007-02-02')),]
#draw histogram
hist(EPCSUB$Global_active_power, col = "red")
