download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./zipped_data")

unzip("./zipped_data")

if(!file.exists("household_power_consumption")){
  
  power_data <- read.table("household_power_consumption.txt", skip = 66637, nrows = 2879, sep = ";", na.strings = "?", stringsAsFactors = FALSE, col.names = c("Date", "Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  power_data$DateTime <- strptime(paste(power_data$Date, power_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  png("plot3.png", width = 480, height = 480)
  plot(power_data$DateTime, power_data$Sub_metering_1, type="n", xlab = " ", ylab="Energy sub metering")
  lines(power_data$DateTime, power_data$Sub_metering_1, type="l", col="black")
  lines(power_data$DateTime, power_data$Sub_metering_2, type="l", col="red")
  lines(power_data$DateTime,power_data$Sub_metering_3, type="l", col="blue")
  legend("topright", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = 1)
  dev.off()
  
} else {
  print("Required file missing!")
}