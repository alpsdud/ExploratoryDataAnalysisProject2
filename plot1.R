################################################
## PLOT1

# read the txt file and load it to R
hpc <- read.table("./household_power_consumption/household_power_consumption.txt",sep =";",header= TRUE)

#install lubridate package
install.packages("lubridate")
library(lubridate)

#convert the Date and Time factor format to date and character format
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


## EXPORT 
png("plot1.png", width = 480, height= 480)
hist(hpc_filter$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)" ,main  = "Global Active Power")
dev.off()