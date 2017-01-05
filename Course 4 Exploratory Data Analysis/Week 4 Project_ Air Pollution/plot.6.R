# create a subset of baltimore motor vehicle pollution
sub3 <- subset(NEI, fips == "24510" & type=="ON-ROAD")
baltmot.sources <- aggregate(sub3[c("Emissions")], list(type = sub3$type, year = sub3$year, zip = sub3$fips), sum)

#create a subset of LA motor vehicle pollution
sub4 <- subset(NEI, fips == "06037" & type=="ON-ROAD")
lamot.sources <- aggregate(sub4[c("Emissions")], list(type = sub4$type, year = sub4$year, zip = sub4$fips), sum)

#create a data frame combining the two subsets
comp.mv <- rbind(baltmot.sources, lamot.sources)

library(ggplot2)

#create a plot to compare the Baltimore and LA
png("plot6.png", width=480,height=480)
qplot(year, Emissions, data = comp.mv, color = zip, geom= "line", ylim = c(-100, 5000)) + ggtitle("Motor Vehicle Emissions in Baltimore (24510) \nvs. Los Angeles (06037) Counties") + xlab("Year") + ylab("Emission Levels") 
dev.off()