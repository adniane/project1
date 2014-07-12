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


#my project plot 1
with(data, hist(Global_active_power, main=" ",col="red",xlab = "Global Active Power (kilowatts)")) 
title(main="Global Active Power")
dev.copy(png, file = "plot1.png") 
dev.off()
