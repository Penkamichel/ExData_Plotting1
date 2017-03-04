#Load the data
      fileURL <- "../household_power_consumption.txt"
      fulldata <- read.table(fileURL, sep=";", header=TRUE, stringsAsFactors=FALSE, na.strings="?")
      fulldata$Date <- as.Date(fulldata$Date, format="%d/%m/%Y")
      subsetdata <- subset(fulldata, fulldata$Date=="2007-02-01" | fulldata$Date=="2007-02-02")
      
# Making plot
      hist(subsetdata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (killowatts)")

# create png file
      dev.copy(png, file="Plot1.png", width=480, height=480)
      dev.off()  