power<-read.table("~/Downloads/household_power_consumption.txt",header=TRUE, sep=";")

#Subset power dataset
power.2007 <-power[power$Date%in%c("1/2/2007","2/2/2007"),]
#set working directory where plot1-4 will be saved
setwd("~/Coursera/ExData_Plotting1")
png("plot1.png",width=480, height=480)
gap<-as.numeric(as.vector(power.2007$Global_active_power))
hist(gap,col="red",main= "Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
