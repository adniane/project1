#Subsetting relevent data[66637:69517,]
tab5rows <- read.table("household_power_consumption.txt", na.strings = "?", sep=";",header = TRUE, nrows = 5)
classes <- sapply(tab5rows, class)
tabAll <- read.table("household_power_consumption.txt",nrows=69516,na.strings = "?", sep=";", header = TRUE, colClasses = classes)

#Extract relevent dat
data <- tabAll[66637:69516,]

#Concatenate Date and Time
dateTime <- paste(as.character(data$Date),as.character(data$Time))

#Convert to R Date/Time
dateTime1 <- strptime(dateTime, format =("%d/%m/%Y %H:%M:%S"))


#My plot 3
with(data,plot (dateTime1,data$Sub_metering_1,type = "l", xlab = "", ylab = "Energy sub metering", col = "black"))
with(data,lines (dateTime1,data$Sub_metering_2,type = "l", col = "red"))
with(data,points (dateTime1,data$Sub_metering_3,type = "l", col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "plot3.png") 
dev.off()
