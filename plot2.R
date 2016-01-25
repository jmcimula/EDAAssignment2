#Files RDS files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Assign the variable dataFlip data of emissionsons
dataFlip <- NEI[NEI$fips=="24510",]

# Sum of Emissionns group by year
dataFlipSum <- aggregate(Emissions ~ year, dataFlip, sum)

#Creation of the file plot2.png
png('plot2.png')

#Construction of the plot
barplot(height=dataFlipSum$Emissions,names.arg=dataFlipSum$year,xlab="years", ylab=expression('total PM'[2]*' emission'),main=expression('Total PM'[2]*' emissions in Baltimore City, '*'Maryland at various years'))
dev.off()