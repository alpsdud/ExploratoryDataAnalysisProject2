################################################
## PLOT2

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
 
 

#Export to plot2.png
png("plot2.png", width = 480, height= 480)
plot(hpc_filter$DateTime,hpc_filter$Global_active_power,type = "l",xlab= "",ylab ="Global Active Power (kilowatts)" )
dev.off()