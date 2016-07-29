dlink <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
dname <- "household_power_consumption.zip"
fname <- "household_power_consumption.txt"

if(file.exists(fname) == FALSE){
  download.file(dlink,dname,method = "curl")
  unzip(dname,overwrite = TRUE)
}

Data <- read.table(fname,header = TRUE,sep = ";",na.strings = "?")

isTime <- Data$Date == "1/2/2007" | Data$Date == "2/2/2007"
Data <- Data[isTime == TRUE,]
DateTime <- strptime(paste(Data$Date,Data$Time,sep = "-"),"%d/%m/%Y-%H:%M:%S")

png("plot3.png",width = 480,height = 480)
plot(DateTime,Data$Sub_metering_1,type = "l",col = "black",xlab = "",ylab = "Energy sub metering")
lines(DateTime,Data$Sub_metering_2,col = "red")
lines(DateTime,Data$Sub_metering_3,col = "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty = "solid")
dev.off()