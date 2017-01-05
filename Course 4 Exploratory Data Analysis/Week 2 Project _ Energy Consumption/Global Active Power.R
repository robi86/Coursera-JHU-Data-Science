# A script to create a histogram of Global Active Power versus frequency using data from 
# UC Irvine for Part 1 of the Coursera Exploratory Data Analysis Week 1 Course Project

# download the UC Irvine dataset and unzip the file
if (!file.exists("data.zip")) {
  download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                destfile="data.zip",
                method="wininet")
  unzip("data.zip")  
}

#read the unzipped data file and subset the data file
data <- read.csv("household_power_consumption.txt", 
                 skip=66637,
                 nrows=2880,
                 na.strings = "?",
                 header=F,
                 sep=";")
names(data) <- names(read.csv("household_power_consumption.txt", nrows=1,sep=";"))

#transform the Date and Time columns from factors to date and time objects
data$Date <- as.Date(data$Date, format="%d/%m/%y")
data$Time <- strptime(data$Time, format="%H:%M:%S")

# open the PNG graphic device and create the histogram
png(filename="plot1.png", width=480, height=480)
hist(data$Global_active_power, 
     col="#ff2500", 
     xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")
dev.off()

