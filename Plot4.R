## download file manually in the folder Exploratory-Data-Analisys
## Create a table
Power <- read.table("household_power_consumption.txt", sep = ";", header= T, na.strings = "?")

Power$Date <- strptime(Power$Date,"%d/%m/%Y")

##df$DateTime <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")



##subsetting the date 01/02/2007 to 02/02/2007

Power2 <- subset(Power, Power$Date >= as.POSIXct('2007-02-01') & Power$Date < as.POSIXct('2007-02-03'))

Power2$Date_Time <- paste(Power2$Date, Power2$Time)

Power2$Date_Time <- as.POSIXct(Power2$Date_Time)

par(mfrow= c(2,2))

## Plot 1

plot(Power2$Global_active_power~Power2$Date_Time, type ="l", ylab = "Global Active Power (kilowatts", xlab = "")

## Plot 2

plot(Power2$Date_Time, Power2$Voltage, type = "l", xlab = "datetime")

##Plot 3

plot(Power2$Date_Time, Power2$Sub_metering_1 ,type ="l",  xlab = "", ylab = "Energy sub metering")
lines(Power2$Date_Time, Power2$Sub_metering_2, type = "l", col = "red" )
lines(Power2$Date_Time, Power2$Sub_metering_3, type = "l", col = "blue")

legend("topright", col = c("black", "red", "blue"), c("Sub_metering 1", "Sub_metering 2", "Sub_metering 3"), lty = c(1,1), lwd= c(1,1))

## Plot 4
plot(Power2$Date_Time, Power2$Global_reactive_power, type = "l", xlab = "datetime")


dev.print(device = png,file = "plot4.png", width = 480, height = 480)

dev.off()

