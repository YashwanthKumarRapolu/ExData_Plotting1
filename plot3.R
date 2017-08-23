setwd('C:/Users/yashwanth_2/Desktop/Course') # Destination of the folder containing the data
data = read.table("household_power_consumption.txt",sep=";",colClasses = "character",header=TRUE)
feb_2007 = data[which(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]
feb_2007$Sub_metering_1 = as.numeric(feb_2007$Sub_metering_1)
feb_2007$Sub_metering_2 = as.numeric(feb_2007$Sub_metering_2)
feb_2007$Sub_metering_3 = as.numeric(feb_2007$Sub_metering_3)

feb_2007$Date= as.Date(feb_2007$Date,format='%d/%m/%Y')
feb_2007[["day"]]=weekdays(feb_2007$Date)
Thurday = which(feb_2007$day=="Thursday")[1]
friday = which(feb_2007$day=="Friday")[1]

png("plot3.png", width = 480, height = 480)
plot(feb_2007$Sub_metering_1,type = 'l',xaxt='n',ylab='Energy Sub Metering',xlab='day')
lines(feb_2007$Sub_metering_2,type = 'l',xaxt='n',col='red')
lines(feb_2007$Sub_metering_3,type = 'l',xaxt='n',col='blue')
axis(1, c(Thurday,friday,dim(feb_2007)[1]), c("Thu","Fri","Sat"))
legend("topright",c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c('black','red','blue'),cex=0.5)
dev.off()
