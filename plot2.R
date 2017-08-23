setwd('C:/Users/yashwanth_2/Desktop/Course') # Destination of the folder containing the data
data = read.table("household_power_consumption.txt",sep=";",colClasses = "character",header=TRUE)
feb_2007 = data[which(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]
feb_2007$Global_active_power = as.numeric(feb_2007$Global_active_power)
feb_2007$Date= as.Date(feb_2007$Date,format='%d/%m/%Y')
feb_2007[["day"]]=weekdays(feb_2007$Date)
Thurday = which(feb_2007$day=="Thursday")[1]
friday = which(feb_2007$day=="Friday")[1]

png("plot2.png", width = 480, height = 480)
plot(feb_2007$Global_active_power,type = 'l',ylab='Global Active Power (kilowatts)',xaxt='n')
axis(1, c(Thurday,friday,dim(feb_2007)[1]), c("Thu","Fri","Sat"))
dev.off()
