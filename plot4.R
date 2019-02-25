#Read in txt file
power <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

#Subset wanted dates
dates <- c("1/2/2007", "2/2/2007")
pow2 <- subset(power, power$Date %in% dates)

#Remove original dataset
rm("power")

#Convert
pow2$dt <- as.Date(pow2$Date, "%d/%m/%Y")
pow2$dttime <- as.POSIXct(paste(pow2$Date, pow2$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

#Create plots
par(mfrow=c(2,2))

#top left
with(pow2, plot(dttime, Global_active_power
		,type="l"
		,xlab=""
		,ylab="Global Active Power"))

#top right
with(pow2, plot(dttime, Voltage
		,type="l"
		,xlab="datetime"
		,ylab="Voltage"))

#bottom left
with(pow2, plot(dttime, Sub_metering_1
		,type="n"
		,xlab=""
		,ylab="Energy sub metering"))
with(pow2, points(dttime, Sub_metering_1, type="l", col="black"))
with(pow2, points(dttime, Sub_metering_2, type="l", col="red"))
with(pow2, points(dttime, Sub_metering_3, type="l", col="blue"))
legend("topright"
	,lty=1
	,bty="n"
	,col=c("black", "red", "blue")
	,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#bottom right
with(pow2, plot(dttime, Global_reactive_power
		,type="l"
		,xlab="datetime"
		,ylab="Global_reactive_power"))

dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
