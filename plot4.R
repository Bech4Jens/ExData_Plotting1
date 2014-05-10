#----------------------------------- plot4.R ----------------------------------#

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
TData <- cbind(as.numeric(as.character(PDataTest[,7])), 
               as.numeric(as.character(PDataTest[,8])), 
               as.numeric(as.character(PDataTest[,9])))
VData <- as.numeric(as.character(PDataTest[,5]))
RData <- as.numeric(as.character(PDataTest[,4]))

#Construct date variable
Time <- strptime(paste(PDataTest[,1], PDataTest[,2]), format='%d/%m/%Y %H:%M:%S')

#Contruct graph
#Set windows
par(mfrow=c(2,2))
#Set size
par(cex=.64)
#Plot 1
plot(Time, as.numeric(PData), type="l",  xlab="", ylab="Global Active Power")
#Plot 2
plot(Time, as.numeric(VData), type="l", xlab="datetime", ylab="Voltage")
#Plot 3
plot(Time, c(TData[,1]), type="l", ylab="Energy sub metering", 
     col=c("black", "red", "blue"), xlab="")
lines(Time, c(TData[,2]),col="red")
lines(Time, c(TData[,3]),col="blue")
legend("topright", c("Sub_metering_1   ","Sub_metering_2   ","Sub_metering_3   "), 
       lty=1, col=c("black", "red", "blue"),
       y.intersp=0.6, x.intersp=1, cex=0.9, bty="n")
#Plot 4
plot(Time, as.numeric(RData), type="l", xlab="datetime", ylab="Global_relative_power")

#Copy to png file
dev.copy(png,'plot4.png', width = 480, height = 480, units = "px")
dev.off()