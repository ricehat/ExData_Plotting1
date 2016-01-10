
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

par(mar=c(5.1,5.1,4.1,2.1))
line_graph<-with(dat_subset, plot(dat_time,as.numeric(dat_subset$Global_active_power), type='l', xlab='',ylab='Global Active Power (kilowatts)'))

dev.copy(png, file='plot2.png',height=480,width=480)
dev.off()




