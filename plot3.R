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

png(filename="./plot3.png",width=480,height=480)
plot3 <- plot(Sub_metering_1,type="n",ylab="Energy sub metering",xaxt="n",xlab="")
lines(Sub_metering_1,col="black")
lines(Sub_metering_2,col="red")
lines(Sub_metering_3,col="blue")
axis(1,at=c(which(subset_raw_data$Time=="00:00:00"),2880),labels=c("Thu","Fri","Sat"))
legend("topright",lty=1,legend=colnames(subset_raw_data)[7:9],col=c("black","red","blue"))
dev.off()

