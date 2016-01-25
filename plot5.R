#Files RDS files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Data
BE <- NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]
BESum <- aggregate(Emissions ~ year, data=BE, FUN=sum)

# Importation of ggplot2
library(ggplot2)

#Creation of the file plot5.png
png("plot5.png")

#Construction of the plot
ggplot(BESum, aes(x=factor(year), y=Emissions)) +   geom_bar(stat="identity") +  xlab("year") +   ylab(expression("total PM"[2.5]*" emissions")) +  ggtitle("Emissions from motor vehicle sources in Baltimore City")
dev.off()