## This script will answer the question if total emissions from PM2.5 decreased in the United States from 1999 to 2008

## Pulls the data
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")
 
## use sqldf package
install.packages("sqldf")
library(sqldf)

## Pull the dataset
q1 <- sqldf("select year, sum(Emissions) as Emissions from NEI group by year order by year")


#Export to plot1.png
png("plot1.png", width = 480, height= 480)
with(q1,plot(year,Emissions,col = "blue", type = "l",pch = 20,ylab = "Total Emissions",xlab = "Year",main = "Total Emissions by Year"))

dev.off()


## Based on the graph, we can conclude that there was a decrease in total emissions from 1998 to 2008.