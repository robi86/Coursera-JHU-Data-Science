# A script to create a continuous plot of Global Active Power versus day of the week using data from 
# UC Irvine for Part 1 of the Coursera Exploratory Data Analysis Week 1 Course Project


## download the data from UC Irvine website
if (!file.exists("data.zip")) {
  download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                destfile="data.zip",
                method="wininet")
  unzip("data.zip")  
}

## use read.csv to process the unzipped file and subset the data of interest
data <- read.csv("household_power_consumption.txt", 
                 skip=66637,
                 nrows=2880,
                 na.strings = "?",
                 header=F,
                 sep=";")
names(data) <- names(read.csv("household_power_consumption.txt", nrows=1,sep=";"))

# Convert Date and Time to DataTime object using the 'as' function and specifcy the format 
# for the new object
data$DateTime <- as.POSIXct(paste(data$Date, data$Time, sep=" "), 
                            format="%d/%m/%Y %H:%M:%S")

# plot an xy chart of global active power in kilowatts versus day of the week 
# using the PNG graphic device 
png(filename="plot2.png", width=480, height=480)
plot(data$DateTime, 
     data$Global_active_power, 
     type="l",
     col="black", 
     xlab="", 
     ylab="Global Active Power (kilowatts)", 
     main="")
dev.off()
