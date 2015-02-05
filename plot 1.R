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

#Plot 1
png("plot1.png",width=800, height=600)
hist(df.project$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="orangered2", ylim=c(0,1200))
dev.off()