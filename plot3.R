#Working Directory and Reading in the Data
setwd("~/Desktop/Dropbox/Coursera/Exploratory Data Analysis")
power <- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE)

#Selecting specifc time frame
powers <- power[which(power$Date %in% c("1/2/2007","2/2/2007")),]

#If there are any ?, clean to NA
powers[powers == "\\?"] <- NA


#Exploratory data
str(powers)

#Cleaning Dates
powers$postime <- strptime(paste(powers$Date, powers$Time), format="%d/%m/%Y %H:%M:%S")
powers$dates <- as.Date(paste(powers$Date, powers$Time), format="%d/%m/%Y %H:%M:%S")

#Cleaning Numeric Classes
for (i in 3:8){
  powers[i] <- as.numeric(unlist(powers[i]))
}


#PNG
png(filename = "plot3.png", width = 480, height = 480)
plot(powers$postime, powers$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
lines(powers$postime, powers$Sub_metering_2, col = "red")
lines(powers$postime, powers$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
dev.off()