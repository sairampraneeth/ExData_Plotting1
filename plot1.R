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

png("plot1.png",width = 480,height = 480)
hist(Data$Global_active_power,col = "red",main="Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()