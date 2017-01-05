# Load the NEI & SCC data frames.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999 2008 for Baltimore City? 
# Which have seen increases in emissions from 1999 2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

# 24510 is Baltimore, see plot2.R
BCitysubset  <- NEI[NEI$fips=="24510", ]

# Create a dataframe using the 'aggregate' function that sums emissions by year and type for baltimore
aggregateEmYearType <- aggregate(Emissions ~ year + type, BCitysubset, sum)

# Create a ggplot using the created dataframe with x = year, y = emissions, 
# and color set to emissions type
png("plot3.png", width=640, height=480)
g <- ggplot(aggregateEmYearType, aes(year, Emissions, color = type))
g <- g + geom_line() +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore City from 1999 to 2008')
print(g)
dev.off()