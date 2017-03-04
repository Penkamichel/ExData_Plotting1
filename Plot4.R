#Load the data
      fileURL <- "../household_power_consumption.txt"
      fulldata <- read.table(fileURL, sep=";", header=TRUE, stringsAsFactors=FALSE, na.strings="?")
      fulldata$Date <- as.Date(fulldata$Date, format="%d/%m/%Y")
      subsetdata <- subset(fulldata, fulldata$Date=="2007-02-01" | fulldata$Date=="2007-02-02")

#Arraging Data
      datetime <- paste(as.Date(subsetdata$Date), subsetdata$Time)
      subsetdata$Datetime <- as.POSIXct(datetime)
      
# Making plot
      par(mfrow=c(2,2), mar=c(4,4,2,1))
      plot(subsetdata$Global_active_power~subsetdata$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
      plot(subsetdata$Voltage~subsetdata$Datetime, type="l", ylab="Voltage", xlab="datetime")
      plot(subsetdata$Sub_metering_1~subsetdata$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
      points(subsetdata$Sub_metering_2~subsetdata$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="", col="red")
      points(subsetdata$Sub_metering_3~subsetdata$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="", col="blue")
      legend("topright", lty=c(1,1,1), col=c("black", "red", "blue"), legend=c("sub_metering_1", "sub_metering_2", "sub_metering_3"), bty="n")
      plot(subsetdata$Global_reactive_power~subsetdata$Datetime, type="l", ylab="Global_reactive_power", xlab="datetime")
      
# create png file
      dev.copy(png, file="Plot4.png")
      dev.off()
      par(mfrow=c(1,1))