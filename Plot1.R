## download file manually in the folder Exploratory-Data-Analisys
## Create a table
Power <- read.table("household_power_consumption.txt", sep = ";", header= T)

Power$Date <- strptime(Power$Date,"%d/%m/%Y")

##subsetting the date 01/02/2007 to 02/02/2007

Power2 <- subset(Power, Power$Date >= as.POSIXct('2007-02-01') & Power$Date <= as.POSIXct('2007-02-02'))

## Make Global_active_power as numeric
Power2$Global_active_power <- as.numeric(as.character(Power2$Global_active_power))

## plot 
hist(Power2$Global_active_power, col ="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power" )

## save as png file
dev.print(device = png,file = "plot1.png", width = 480, height = 480)

dev.off()
