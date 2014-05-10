#----------------------------------- plot2.R ----------------------------------#

#Set working directory
setwd("C:/Users/Jens/Dropbox/Documents/Coursera/Data Science Track/Exploratory data analysis/Peer assesment 1")

#Load data
household_power_consumption <- read.csv("C:/Users/Jens/Dropbox/Documents/Coursera/Data Science Track/Exploratory data analysis/Peer assesment 1/household_power_consumption.txt", sep=";")
Data <- household_power_consumption

#Select relevant data for analysis
PDataTest <- Data[Data[,1]=="1/2/2007" | Data[,1]=="2/2/2007",] #Transfers therelevant dates

#Set background color to transparent
par(bg=NA)

#Isolate the data to be plotted
PData <- as.numeric(as.character(PDataTest[,3]))

#Construct date variable
Time <- strptime(paste(PDataTest[,1], PDataTest[,2]), format='%d/%m/%Y %H:%M:%S')

#Construct graphs
plot(Time, as.numeric(PData), type="l", ylab="Global Active Power (kilowatts)")

#Copy to png-file
dev.copy(png,'plot2.png', width = 480, height = 480, units = "px")
dev.off()