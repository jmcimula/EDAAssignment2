#Files RDS files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Assign the variable dataFlip data of emissionsons
dataFlip <- NEI[NEI$fips=="24510",]

# Sum of Emissions group data by year and type of the source
dataFlipSum <- aggregate(Emissions ~ year + type,data=dataFlip,FUN=sum)

# Importation of ggplot2
library(ggplot2)

#Creation of the file plot3.png
png("plot3.png")

#Construction of the plot
ggplot(dataFlipSum, aes(x=factor(year), y=Emissions, fill=type)) +  geom_bar(stat="identity") +  facet_grid(. ~ type) +
xlab("year") +  ylab(expression("total PM"[2.5]*" emission")) + ggtitle(expression("PM"[2.5]*paste(" emissions in Baltimore ","City by various source types", sep="")))
dev.off()