## This script will answer the question if total emissions from PM2.5 decreased in the Baltimore City, MD from 1999 to 2008

## Pulls the data
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")


## use sqldf package
install.packages("sqldf")
library(sqldf)

## Pull the dataset
q2 <- sqldf("select year, sum(Emissions) as Emissions from NEI where fips = '24510' group by year order by year")


#Export to plot2.png
png("plot2.png", width = 480, height= 480)
with(q2,plot(year,Emissions,col = "blue", type = "l",pch = 20,ylab = "Total Emissions",
              xlab = "Year",main = "Total Emissions by Year in Baltimore City, MD"))
dev.off()


## Based on the graph, we can conclude that there was a decrease in total emissions in Baltimore City, MD from 1998 to 2008.