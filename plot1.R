
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./zipped_data")

unzip("./zipped_data")

if(!file.exists("household_power_consumption")){
  
  power_data <- read.table("household_power_consumption.txt", skip = 66637, nrows = 2879, sep = ";", na.strings = "?", stringsAsFactors = FALSE, col.names = c("Date", "Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  png("plot1.png", width = 480, height = 480)
  hist(power_data$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
  dev.off()
} else {
  print("Required file missing!")
}