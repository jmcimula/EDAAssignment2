#Files RDS files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


#normalize <- function(x) {(x-min(x)) / (max(x)-min(x))}

# Data Baltimore City
BE <- NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]
BESum <- aggregate(Emissions ~ year, data=BE, FUN=sum)

# Data Los Angeles
LE <- NEI[(NEI$fips=="06037") & (NEI$type=="ON-ROAD"),]
LESum <- aggregate(Emissions ~ year, data=LE, FUN=sum)


# Cities
BESum$County <- "Baltimore City, MD"
LESum$County <- "Los Angeles County, CA"
BEM <- rbind(BESum, LESum)

# Importation of ggplot2
library(ggplot2)

#Creation of the file plot6.png
png("plot6.png")

#Construction of the plot
ggplot(BEM, aes(x=factor(year), y=Emissions, fill=County)) +   geom_bar(stat="identity") + 
  facet_grid(County  ~ ., scales="free") +  ylab("total emissions (tons)") +   xlab("year") +  ggtitle(expression("Motor vehicle emission variation\nin Baltimore and Los Angeles"))
dev.off()