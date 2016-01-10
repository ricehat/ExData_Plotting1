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



plot3<-png("plot3.png",height=480,width=480)
par(mar=c(4.1,5.1,4.1,2.1))
submeter_graph1<-with(dat_subset, plot(dat_time,as.numeric(dat_subset$Sub_metering_1), type='l', col='black', xlab='',ylab='Energy sub metering'))
submeter_graph2<-with(dat_subset, lines(dat_time,as.numeric(dat_subset$Sub_metering_2), col='red'))
submeter_graph3<-with(dat_subset, lines(dat_time,as.numeric(dat_subset$Sub_metering_3), col='blue'))
legend<-legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lty=c(1,1,1),col=c('black','red','blue'))


#dev.copy(png, file='plot3.png',height=480,width=480)
dev.off()
