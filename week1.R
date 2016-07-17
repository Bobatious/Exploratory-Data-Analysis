#Working Directory and Reading in the Data
setwd("~/Desktop/Dropbox/Coursera/Exploratory Data Analysis")
power <- read.csv("household_power_consumption.txt", sep = ";")

#Exploratory data

summary(power)
head(power)
str(power)

#Cleaning Data
cbind(power$Date, " ", power$Time)
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
"?" %in% power

grepl(power, "?")
gsub("\\?", )

#Selecting specifc time frame
subset(power, Date >= "2007-02-01" & Date <= "2007-02-02")