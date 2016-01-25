#Files RDS files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


combus <- grepl("Fuel Comb.*Coal", SCC$EI.Sector)
combuSources <- SCC[combus,]

# Find emissions from coal combustion-related sources
Emiss <- NEI[(NEI$SCC %in% combuSources$SCC), ]

# Sum of Emission group by year
emissions.by.year <- aggregate(Emissions ~ year, data=Emiss, FUN=sum)

# Importation of ggplot2
library(ggplot2)
#Creation of the file plot4.png

png("plot4.png")
#Construction of the plot
ggplot(Emiss.by.year, aes(x=factor(year), y=Emissions)) +  geom_bar(stat="identity") +  xlab("year") +   ylab(expression("total PM"[2.5]*" emissions")) + ggtitle("Emissions from coal combustion-related sources")
dev.off()