setwd("C:\\Users\\Oscar\\Documents\\R\\4. Data Exploration")

if (!file.exists("data")) {
        
        print("The data folder doesn't exists. I proceed to create it")
        dir.create("data")
        myurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(myurl, destfile = ".\\data.zip")
        dateDownloaded <- date()
        unzip(zipfile = ".\\data.zip",
              overwrite = TRUE,
              exdir = ".\\data")
        rawdata <- read.table(".\\data\\household_power_consumption.txt", header= TRUE,sep=";")
        
} else {
        print("Dear friend, our data folder exists.")
}

Sys.setlocale("LC_ALL","C")

rawdata <- read.table(".\\data\\household_power_consumption.txt", header= TRUE,sep=";")

targetdata <- rawdata[rawdata$Date == "1/2/2007" |rawdata$Date=="2/2/2007", ]

targetdata$DateTime <-strptime(paste(targetdata$Date, targetdata$Time), format="%d/%m/%Y %H:%M:%S")

targetdata$Global_active_power <- as(as(targetdata$Global_active_power,"character"),"numeric")
targetdata$Global_reactive_power <- as(as(targetdata$Global_reactive_power,"character"),"numeric")
targetdata$Voltage <- as(as(targetdata$Voltage,"character"),"numeric")

targetdata$Sub_metering_1 <- as(as(targetdata$Sub_metering_1,"character"),"numeric")
targetdata$Sub_metering_2 <- as(as(targetdata$Sub_metering_2,"character"),"numeric")
targetdata$Sub_metering_3 <- as(as(targetdata$Sub_metering_3,"character"),"numeric")

png(file="plot4.png")
par(mfrow=c(2,2))
#graph topleft
with (targetdata, {
        plot(x=DateTime, y= Global_active_power, ylab="Global Active Power", type="l", xlab="")
#graph topright
        plot(x= DateTime, y= Voltage, ylab="Voltage", type="l", xlab="datetime")
#graph downleft
        plot(x = DateTime, 
             y = Sub_metering_1,
                 ylab="Energy sub metering",
                 type="l",
                 col=c("black"),
                 xlab="")
        lines(x = DateTime, 
              y = Sub_metering_2,
              type = "l",
              col = "red")
        lines(x = DateTime, 
              y = Sub_metering_3, 
              col = "blue")
        legend("topright",
               lty=1,
               col=c("black","red","blue"), 
               legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#graph downright
        plot(x=DateTime, y= Global_reactive_power, ylab="Global_reactive_power",
             type="l", xlab="datetime")
})
dev.off()