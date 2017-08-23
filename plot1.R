setwd('C:/Users/yashwanth_2/Desktop/Course') # Destination of the folder containing the data
data = read.table("household_power_consumption.txt",sep=";",colClasses = "character",header=TRUE)
feb_2007 = data[which(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]
feb_2007$Global_active_power = as.numeric(feb_2007$Global_active_power)

png("plot1.png", width = 480, height = 480)
hist(feb_2007$Global_active_power,col='red',xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")
dev.off()
