#Load the data
      fileURL <- "../household_power_consumption.txt"
      fulldata <- read.table(fileURL, sep=";", header=TRUE, stringsAsFactors=FALSE, na.strings="?")
      fulldata$Date <- as.Date(fulldata$Date, format="%d/%m/%Y")
      subsetdata <- subset(fulldata, fulldata$Date=="2007-02-01" | fulldata$Date=="2007-02-02")

#Arraging Data
      datetime <- paste(as.Date(subsetdata$Date), subsetdata$Time)
      subsetdata$Datetime <- as.POSIXct(datetime)
      
# Making plot
      plot(subsetdata$Global_active_power~subsetdata$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
      
# create png file
      dev.copy(png, file="Plot2.png", width=480, height=480)
      dev.off()  