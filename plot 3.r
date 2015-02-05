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

#Plot 3
png("plot3.png",width=800, height=600)
plot(df.project$date_time, df.project$Sub_metering_1, type="l", ylab="Energy sub metering")
  legend("topright",c(names(df.project[7:9])), col=c("black","red"), lwd=2)
  lines(df.project$date_time, df.project$Sub_metering_2, type="l", col="red")
  lines(df.project$date_time, df.project$Sub_metering_3, type="l", col="blue")  
dev.off()