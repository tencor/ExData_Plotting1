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

rawdata <- read.table(".\\data\\household_power_consumption.txt", header= TRUE,sep=";")

targetdata <- rawdata[rawdata$Date == "1/2/2007" |rawdata$Date=="2/2/2007", ]
targetdata$Global_active_power <- as(as(targetdata$Global_active_power,"character"),"numeric")

png(file="plot1.png")

hist(targetdata$Global_active_power, xlab="Global Active Power (kilowatts)", 
     main="Global Active Power", col ="red")

dev.off()

hist(targetdata$Global_active_power, xlab="Global Active Power (kilowatts)", 
     main="Global Active Power", col ="red")
