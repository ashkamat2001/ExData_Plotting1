#Coursera - Exploratory Data : Project 1 Plot4
#By Ashwini Kerkar

setwd("C:\\ashwini01\\backtowork\\analytics\\coursera-exploratorydata")
getwd()


#Using skip & nrows roughly determined with what rows contain data for 1st and 2nd feb
PowerData=read.table("./household_power_consumption.txt", sep=";", nrows=4000,skip=66000, na.strings="?")
#PowerData=read.table("./household_power_consumption.txt", sep=";", header=TRUE, nrows=10,skip=70000)

#Setting names to the dataframe
names(PowerData) = c("Date", "Time", "act_pwr", "grp", "volt", "gint", "sub_1", "sub_2", "sub_3")


#Discarded rows for dates other than 1st and 2nd feb
PowerData=subset(PowerData,V1=="1/2/2007" | V1=="2/2/2007")

#Getting a date-time variable
PowerData$dttm = paste(as.character(PowerData$Date), as.character(PowerData$Time), sep = " ")
PowerData$dttm =  strptime(PowerData$dttm, "%d/%m/%Y %H:%M:%S")

#Plot4
par(mfcol=c(2,2), cex.axis=0.6, cex.lab=0.6)
plot(PowerData$dttm,PowerData$act_pwr, type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(PowerData$dttm,PowerData$act_pwr)


plot(PowerData$dttm,PowerData$sub_1, type="n", xlab="", ylab="Energy sub metering")
lines(PowerData$dttm,PowerData$sub_1)
lines(PowerData$dttm,PowerData$sub_2, col="red")
lines(PowerData$dttm,PowerData$sub_3, col="blue")
legend(x="topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,4,5), col=c("black","red","blue"),cex=0.5, bty="n", yjust=1)

plot(PowerData$dttm,PowerData$volt, type="n", xlab="datetime", ylab="Voltage")
lines(PowerData$dttm,PowerData$volt)


plot(PowerData$dttm,PowerData$grp, type="n", xlab="datetime", ylab="Global_Reactive_Power", cex=0.5)
lines(PowerData$dttm,PowerData$grp)

dev.copy(png, file="Plot4.png", width=480, height=480)
dev.off()

