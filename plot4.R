url<-'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
getwd()
download.file(url,destfile='C:/Users/Timothy/Documents/R Files/Exploratory_Data_Analysis/Project_1/datafile.zip')
unzip('datafile.zip')

dat<-read.table('household_power_consumption.txt',header=TRUE,sep=';',stringsAsFactors=FALSE)
dat_subset<-subset(dat, Date=='1/2/2007' | Date=='2/2/2007')

times<-dat_subset$Time
dates<-dat_subset$Date
x<-paste(dates,times)
dat_time<-strptime(x,"%d/%m/%Y %H:%M:%S")


plot4<-png("plot4.png",height=480,width=480)
par(mfrow=c(2,2))

line_graph<-with(dat_subset, plot(dat_time,as.numeric(dat_subset$Global_active_power), type='l', xlab='',ylab='Global Active Power (kilowatts)'))

line_graph2<-with(dat_subset, plot(dat_time,as.numeric(dat_subset$Voltage), type='l', xlab='datetime',ylab='Voltage'))

line_graph3<-with(dat_subset, plot(dat_time,as.numeric(dat_subset$Sub_metering_1), type='l', col='black', xlab='',ylab='Energy sub metering'))
lines(dat_time,as.numeric(dat_subset$Sub_metering_2), col='red')
lines(dat_time,as.numeric(dat_subset$Sub_metering_3), col='blue')
legend<-legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),bty='n',lty=c(1,1,1),col=c('black','red','blue'))

line_graph4<-with(dat_subset, plot(dat_time,as.numeric(dat_subset$Global_reactive_power), type='l', xlab='datetime',ylab='Global_reactive_power'))

dev.off()
