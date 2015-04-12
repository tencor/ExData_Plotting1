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

        
} else {
        print("Dear friend, our data folder exists.")
}

Sys.setlocale("LC_ALL","C")

rawdata <- read.table(".\\data\\household_power_consumption.txt", header= TRUE,sep=";")

targetdata <- rawdata[rawdata$Date == "1/2/2007" |rawdata$Date=="2/2/2007", ]

targetdata$DateTime <-strptime(paste(targetdata$Date, targetdata$Time), format="%d/%m/%Y %H:%M:%S")
targetdata$Sub_metering_1 <- as(as(targetdata$Sub_metering_1,"character"),"numeric")
targetdata$Sub_metering_2 <- as(as(targetdata$Sub_metering_2,"character"),"numeric")
targetdata$Sub_metering_3 <- as(as(targetdata$Sub_metering_3,"character"),"numeric")

png(file="plot3.png")
with(targetdata,   plot(x=targetdata$DateTime, 
                        y= targetdata$Sub_metering_1,
                        ylab="Energy sub metering",
                        type="l",
                        col=c("black"),
                     #   ylim=c(0,50),
                        xlab=""))


with(targetdata, lines(x=targetdata$DateTime, 
                       y= targetdata$Sub_metering_2, 
                       #ylim=c(0,50),
                       type="l",
                       col="red"))
with(targetdata, lines(x=targetdata$DateTime, 
                       y= targetdata$Sub_metering_3, 
                       #ylim=c(0,50),
                       col="blue"))
legend("topright",
       lty=1,
       col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
print("end")



