# R SCRIPT TO CREATE PLOT 1 FOR EXPLORATORY PROJECT 1
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
png(file='C:/Users/Speko2/Documents/Hopkins/explorative/plot1.png', 
    width = 480, height=480, units="px", bg = "transparent" )

# CREATE PLOT
hist(cleaned_data$Global_active_power, xlab='Global Active Power (kilowatts)', 
     main = 'Global Active Power', col = 'red')

#CLOSE PNG DEVICE
dev.off() ## Don't forget to close the PNG device!



