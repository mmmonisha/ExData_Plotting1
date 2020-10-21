## PREPARING DATA FOR PLOTS

library(dplyr)
unzip("Power_Consumption.zip")

# read relevant data
data <- read.table("household_power_consumption.txt", skip = 1, sep=";")
colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power",
                    "Voltage","Global_intensity","Sub_metering_1",
                    "Sub_metering_2","Sub_metering_3")
data <- subset(data, data$Date=="1/2/2007" | data$Date=="2/2/2007")

# converting to Date/Time variables, combining Date & Time into single column
# in posixLT format, change Date column to Day of the Week
data$Date <- as.Date(data$Date, tryFormats = "%d/%m/%Y")
one <- data[data$Date=="2007-02-01",]
data$Time <- strptime(data$Time, format = "%H:%M:%S")
data[1:1440,"Time"] <- format(data[1:1440,"Time"], "2007-02-01 %H:%M:%S")
data[1441:2880,"Time"] <- format(data[1441:2880,"Time"], "2007-02-02 %H:%M:%S")
names(data)[2] <- "Date_Time"
names(data)[1] <- "Day" #optional
data$Day <- weekdays.POSIXt(data$Day, abbreviate = TRUE) #optional

# PLOT 1
data$Global_active_power <- as.numeric(data$Global_active_power)
png(filename = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power, 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power",
     col = "red")
dev.off()