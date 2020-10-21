# PLOT 3
png(filename = "plot3.png", width = 480, height = 480)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
plot(data$Date_Time, data$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering"
)
lines(data$Date_Time, data$Sub_metering_2,
      col = "red")
lines(data$Date_Time, data$Sub_metering_3,
      col = "blue")
legend("topright", 
       lty=1, 
       col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
)
dev.off()