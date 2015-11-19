## This script will answer the question  how have emissions from coal combustion-related sources changed from 1999-2008

## Pulls the data
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

## use sqldf and ggplot2 packages
library(sqldf)
library(ggplot2)

#checked the SCC variables which of them pertains to  coal combustion. Run the unique function 1
# variable at a time.  It was found out that itis the EI.Sector column.
unique(SCC$Data.Category)
unique(SCC$Short.Name)
unique(SCC$EI.Sector)
unique(SCC$Option.Group)


## Pull the dataset
q4 <- sqldf("select n.year, sum(n.Emissions) as Emissions 
            from NEI n
            inner join SCC s
              on n.SCC = s.SCC
            where s.[EI.Sector] like '%coal%'
            group by n.year order by n.year")
 

#Export to plot4.png
png("plot4.png", width = 800, height= 800)
q4_plot <- ggplot(q4, aes(year,Emissions))
q4_plot +geom_point(colour="blue", size = 4, show_guide = TRUE) + xlab("Year") + ylab("Total Emissions") + ggtitle("Total Emissions from Coal by Year in US")
dev.off()


## The coal combustion emissions changed gradually from 1999 to 2005 , but decreased abruptly from 2005 to 2008.