power<-read.table("~/Downloads/household_power_consumption.txt",header=TRUE, sep=";")

#Subset power dataset
power.2007 <-power[power$Date%in%c("1/2/2007","2/2/2007"),]
date.time <-strptime(paste(power.2007$Date,power.2007$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
#set working directory where plot1-4 will be saved
setwd("~/Coursera/ExData_Plotting1")
gap<-as.numeric(as.vector(power.2007$Global_active_power))

sbm1<-as.numeric(power.2007$Sub_metering_1)
sbm2<-as.numeric(power.2007$Sub_metering_2)
sbm3<-as.numeric(power.2007$Sub_metering_3)

grp<-as.numeric(as.vector(power.2007$Global_reactive_power))
voltage<- as.numeric(as.vector(power.2007$Voltage))

png("plot4.png",width=480, height=480)
par(mfcol=c(2,2))

plot(date.time,gap,xlab= "", ylab="Global Active Power",type="l")

plot(date.time,sbm1,xlab= "", ylab="Energy sub metering",type="l")
lines(date.time,sbm2,type="l",col=2)
lines(date.time,sbm3,type="l",col=4)
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c(1:2,4))
plot(date.time,voltage,type="l",ylab="Voltage",xlab="datetime")
plot(date.time,grp,type="l",ylab="Global_reactive_power",xlab="datetime")
dev.off()