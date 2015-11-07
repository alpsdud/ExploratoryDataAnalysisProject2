################################################
## PLOT4

# read the txt file and load it to R
hpc <- read.table("./household_power_consumption/household_power_consumption.txt",sep =";",header= TRUE)

#install lubridate package
install.packages("lubridate")
library(lubridate)

#convert the Date and time factor format to date and character
hpc$Date <- dmy(hpc$Date)
hpc$Date <- as.Date(hpc$Date)
hpc$Time <- as.character(hpc$Time)


#filter only days Feb 1 and 2 2007
hpc_filter <- subset(hpc,Date >= as.Date("2007-02-01") & Date <=as.Date("2007-02-02"))

#combine the date and time columns into 1. Create a new column named DateTime
DateTime <- as.POSIXct(paste(hpc_filter$Date, hpc_filter$Time), format="%Y-%m-%d %H:%M:%S")
hpc_filter$DateTime <- DateTime

hpc_filter$Global_active_power <- as.character((hpc_filter$Global_active_power))
hpc_filter$Global_active_power <- as.numeric((hpc_filter$Global_active_power))
hist(hpc_filter$Global_active_power, col = "red")
hist(hpc_filter$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)" ,main  = "Global Active Power")

#Export to plot4
png("plot4.png", width = 480, height= 480)
par(mfrow = c(2,2))

with (hpc_filter,{
  plot(hpc_filter$DateTime,hpc_filter$Global_active_power,type = "l",xlab= "",ylab ="Global Active Power" )
  plot(hpc_filter$DateTime,hpc_filter$Voltage,type = "l",xlab= "",ylab ="Voltage")
  plot(hpc_filter$DateTime,hpc_filter$Sub_metering_1,type = "l",xlab= "",ylab ="Energy sub metering")
  lines(hpc_filter$DateTime,hpc_filter$Sub_metering_2,col = "red")
  lines(hpc_filter$DateTime,hpc_filter$Sub_metering_3,col = "blue")
  legend("topright", col= c("black","red","blue"),legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=c(1.5,1.5))
  plot(hpc_filter$DateTime,hpc_filter$Global_reactive_power,type = "l",xlab= "",ylab ="Global_reactive_power")
})
dev.off()