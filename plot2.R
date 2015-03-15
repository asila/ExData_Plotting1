power<-read.table("~/Downloads/household_power_consumption.txt",header=TRUE, sep=";")

#Subset power dataset
power.2007 <-power[power$Date%in%c("1/2/2007","2/2/2007"),]
date.time <-strptime(paste(power.2007$Date,power.2007$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
#set working directory where plot1-4 will be saved
setwd("~/Coursera/ExData_Plotting1")
png("plot2.png",width=480, height=480)
gap<-as.numeric(as.vector(power.2007$Global_active_power))
plot(date.time,gap,xlab= "", ylab="Global Active Power (kilowatts)",type="l")
dev.off()
