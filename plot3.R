#----------------------------------- plot3.R ----------------------------------#

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
TData <- cbind(as.numeric(as.character(PDataTest[,7])), 
               as.numeric(as.character(PDataTest[,8])), 
               as.numeric(as.character(PDataTest[,9])))


#Construct date variable
Time <- strptime(paste(PDataTest[,1], PDataTest[,2]), format='%d/%m/%Y %H:%M:%S')

#Construct plot
plot(Time, c(TData[,1]), type="l", ylab="Energy sub metering", 
     col=c("black", "red", "blue"), xlab="")
lines(Time, c(TData[,2]),col="red")
lines(Time, c(TData[,3]),col="blue")
legend("topright", c("Sub_metering_1   ","Sub_metering_2   ","Sub_metering_3   "), 
       lty=1, col=c("black", "red", "blue"),
       y.intersp=0.6, x.intersp=1, cex=0.9)

#Copy to png file
dev.copy(png,'plot3.png', width = 480, height = 480, units = "px")
dev.off()