#Files RDS files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Calculation of the NEI's sum
total <- aggregate(Emissions ~ year, NEI, sum)

#Creation of the file plot1.png
png('plot1.png')

#Construction of the plot
barplot(height=total$Emissions, names.arg=total$year,xlab="years", ylab=expression('total PM'[2]*' emission'),main=expression('Total PM'[2]*' emissions at various years'))
dev.off()