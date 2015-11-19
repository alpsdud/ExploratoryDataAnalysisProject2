## This script will answer the question  How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

## use sqldf and ggplot2 packages
library(sqldf)
library(ggplot2)

#Looked in the EI.Sector column that pertains to "motor vehicles". Among the list, the following
# items seem to match the "motor vehicles" category. 
#[21] Mobile - On-Road Gasoline Light Duty Vehicles     
#[22] Mobile - On-Road Gasoline Heavy Duty Vehicles     
#[23] Mobile - On-Road Diesel Light Duty Vehicles       
#[24] Mobile - On-Road Diesel Heavy Duty Vehicles 

## Pull the dataset
q5 <- sqldf("select n.year, sum(n.Emissions) as Emissions 
            from NEI n
            inner join SCC s
              on n.SCC = s.SCC
            where s.[EI.Sector] like '%On-Road%'
            and fips = '24510'
            group by n.year order by n.year")
 

#Export to plot4.png
png("plot5.png", width = 800, height= 800)
q5_plot <- ggplot(q5, aes(year,Emissions))
q5_plot +geom_point(colour="blue", size = 4, show_guide = TRUE) + xlab("Year") + ylab("Total Emissions") + ggtitle("Total Emissions from Motor Vehicles by Year in MD")
dev.off()


##The motor vehicles combustion emissions drecreased  abruptly from 1999 to 2002 but decreased gradually from 2002 to 2008.