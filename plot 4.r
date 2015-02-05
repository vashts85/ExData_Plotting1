rm(list=ls())

## Set your working directory
setwd("C:/Users/rcarvalho/Desktop/R Course/graphic exploration/Project1")

## Download and unzip data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="data.zip")
unzip("data.zip")

## Read in and subset data based on specifications
data=read.csv("household_power_consumption.txt", sep=";", header=TRUE, na.strings=c("?"))
df.project <- subset(data, (data$Date=="1/2/2007") | (data$Date=="2/2/2007"))

## Create a new date and date/time variable
df.project$Date <- as.Date(df.project$Date, format = "%d/%m/%Y", tz="") 
df.project$date_time=as.POSIXct(paste(df.project$Date, df.project$Time), format="%Y-%m-%d %H:%M:%S")
  
#Plot 4
png("plot4.png", width=800, height=600)
par(mfrow=c(2,2), mar=c(4,4,2,2), oma=c(rep(0.5,4)))
plot(df.project$date_time, df.project$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(df.project$date_time, df.project$Voltage, type="l", ylab="Voltage", xlab="datetime")
plot(df.project$date_time, df.project$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  legend("topright",c(names(df.project[7:9])), col=c("black","red"), lwd=2, bty="n", cex=1)
  lines(df.project$date_time, df.project$Sub_metering_2, type="l", col="red")
  lines(df.project$date_time, df.project$Sub_metering_3, type="l", col="blue")  
plot(df.project$date_time, df.project$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
dev.off()

