#Read in txt file
power <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

#Subset wanted dates
dates <- c("1/2/2007", "2/2/2007")
pow2 <- subset(power, power$Date %in% dates)

#Remove original dataset
rm("power")

#Create plots
with(pow2, hist(Global_active_power
	,xlab = "Global Active Power (kilowatts)"
	,main = "Global Active Power"
	,col = "red"))
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
