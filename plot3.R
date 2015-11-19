## This script will answer the questions  which of these four sources have seen decreases and increases in emissions from 1999-2008 for Baltimore City

## Pulls the data
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

## use sqldf and ggplot2 packages
install.packages("sqldf")
install.packages("ggplot2")
library(sqldf)
library(ggplot2)

## Pull the dataset
q3 <- sqldf("select year, type, sum(Emissions) as Emissions from NEI where fips = '24510' group by year, type order by year")

#q3$year <-  as.character(q3$year) 
#qplot(year,Emissions, data = q3, facets = . ~ type,xlab = "Year",ylab = "Total Emissions",geom = "line", main = "Total Emissions by Year in Baltimore City, MD")


#Export to plot3.png
png("plot3.png", width = 800, height= 800)
q3_plot <- ggplot(q3, aes(year,Emissions))
q3_plot +geom_point(colour="black", size = 3, show_guide = TRUE) + facet_grid(. ~ type) + xlab("Year") + ylab("Total Emissions") + ggtitle("Total Emissions by Year in Baltimore City, MD")
dev.off()


## Non-Road , Nonpoint and On-Road have consistently decreased in emmisions. On the other hand, Point has seen some increased in 1999, 2002
## and 2005 but went down in 2008.
