################################################
## PLOT3

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

 
#Export to plot3.png
 
png("plot3.png", width = 480, height= 480)
with(hpc_filter,plot(DateTime,Sub_metering_1,type = "l"))
plot(hpc_filter$DateTime,hpc_filter$Sub_metering_1,type = "l",xlab= "",ylab ="Energy sub metering")
lines(hpc_filter$DateTime,hpc_filter$Sub_metering_2,col = "red")
lines(hpc_filter$DateTime,hpc_filter$Sub_metering_3,col = "blue")
legend("topright", col= c("black","red","blue"),legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=c(2.5,2.5))
dev.off()