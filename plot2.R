# PLOT 2
png(filename = "plot2.png", width = 480, height = 480)
plot(data$Date_Time, data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)"
)
dev.off()