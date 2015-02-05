# R SCRIPT TO CREATE PLOT 4 FOR EXPLORATORY PROJECT 1
# by Rasmus Engholm

# Clear memory
rm(list=ls())

# PATH TO DATA
file_to_read <- 'C:/Users/Speko2/Documents/Hopkins/explorative/household_power_consumption.txt' 

# READ DATA
raw_data <- read.table(file_to_read, header =TRUE, sep = ';', na.strings = '?',
                       colClasses=c(rep('character',2),rep('numeric',7)))

# CONVERT TIME AND DATE to POSIXct DATETIME AND ADD TO DF
raw_data$DateTime <- as.POSIXct(paste(raw_data$Date, raw_data$Time), 
                                format="%d/%m/%Y %H:%M:%S")

# SUBSET TO ONLY THE TWO DAYS OF DATA
cleaned_data <- subset(raw_data,raw_data$Date=="1/2/2007" | raw_data$Date=="2/2/2007")


# SAVE TO PNG FILE
png(file='C:/Users/Speko2/Documents/Hopkins/explorative/plot4.png', 
    width = 480, height=480, units="px", bg = "transparent" )

# CREATE PLOT
par(mfrow = c(2, 2))

plot(cleaned_data$DateTime,cleaned_data$Global_active_power, 
     ylab='Global Active Power (kilowatts)', type='l', xlab='')

plot(cleaned_data$DateTime, cleaned_data$Voltage, xlab ='datetime', ylab = 'Voltage', typ = 'l')

plot(cleaned_data$DateTime,cleaned_data$Sub_metering_1, 
     ylab='Energy sub metering', type='l', xlab='')
lines(cleaned_data$DateTime,cleaned_data$Sub_metering_2, col = 'red')
lines(cleaned_data$DateTime,cleaned_data$Sub_metering_3, col = 'blue')
legend("topright", col = c("black", "blue", "red"),bty='n',lty=c(1,1,1),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


plot(cleaned_data$DateTime, cleaned_data$Global_reactive_power, xlab ='datetime', 
     ylab = 'Global_reactive_power', typ = 'l')
#CLOSE PNG DEVICE
dev.off() ## Don't forget to close the PNG device!



