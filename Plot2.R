## download file manually in the folder Exploratory-Data-Analisys
## Create a table
Power <- read.table("household_power_consumption.txt", sep = ";", header= T, na.strings = "?")

Power$Date <- strptime(Power$Date,"%d/%m/%Y")

##df$DateTime <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")



##subsetting the date 01/02/2007 to 02/02/2007

Power2 <- subset(Power, Power$Date >= as.POSIXct('2007-02-01') & Power$Date < as.POSIXct('2007-02-03'))

##paste Date and time in the same column
Power2$Date_Time <- paste(Power2$Date, Power2$Time)

## Make Date_Time as POSIXct
Power2$Date_Time <- as.POSIXct(Power2$Date_Time)

## plot 2
plot(Power2$Global_active_power~Power2$Date_Time, type ="l", ylab = "Global Active Power (kilowatts", xlab = "")

## save as png file
dev.print(device = png,file = "plot2.png", width = 480, height = 480)

dev.off()

