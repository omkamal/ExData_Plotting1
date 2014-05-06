# Exploratory Data Analysis - Project 1 
rm(list=ls())

setwd("C:/Coursera/Exploratory Data Analysis/Project1")
raw_data <- read.table(file="./household_power_consumption.txt",sep=";",header=T,na.strings="?")

raw_data$Date <- as.Date(raw_data$Date,format="%d/%m/%Y")
#Time2 <- strptime(raw_data$Time,format="%H:%M:%S")
merged_date_time <- paste(raw_data$Date,raw_data$Time,sep=" ")
raw_data$Date_Time <- strptime(merged_date_time,format="%Y-%m-%d %H:%M:%S") 

#nrow(raw_data)-sum(complete.cases(raw_data))

subset_raw_data <- raw_data[raw_data$Date<"2007-02-03" & raw_data$Date>"2007-01-31",]


attach(subset_raw_data)

#plot1 <- hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

png(filename="./plot1.png",width=480,height=480,bg = "transparent")
#plot1 <- hist(Global_active_power,col="red")
plot1 <- hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
