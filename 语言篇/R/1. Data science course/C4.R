### Course4 EDA
#############  WEEK 1 ---------------------------------
workdir<-"C:\\Users\\Administrator\\Desktop\\Data science\\4.Exploratory Data Analysis"
setwd(workdir)
dat=read.csv(file="avgpm25.csv",colClasses 
            = c("numeric", "character","factor", "numeric", "numeric"))
head(dat)
#1,一维的
summary(dat$pm25)

boxplot(dat$pm25,col="blue")
abline(h=12)   #添加y=12的直线

hist(dat$pm25,col="green",breaks=30)
rug(dat$pm25)

barplot(table(dat$region),col="wheat",main="this is a barplot")

#2.二维的
boxplot(pm25~region,dat,col="green")

#
par(mfrow=c(2,1),mar=c(4,4,2,1))   #设置2*1的子图，图边距下，左，上，右
hist(subset(dat,region=="east")$pm25,col="red")
hist(subset(dat,region=="west")$pm25,col="green")

#scatter
attach(dat)
plot(latitude,pm25,col=region)
#
par(mfrow=c(1,2))
with(subset(dat,region=="west"),plot(latitude,pm25,main="west"))
with(subset(dat,region=="east"),plot(latitude,pm25,main="east"))


##
library(lattice)
state <- data.frame(state.x77, region = state.region)
xyplot(Life.Exp ~ Income | region, data = state, layout = c(4, 1))

## graph_device
pdf(file = "myplot.pdf")  ## Open PDF device; create 'myplot.pdf' in my working directory
## Create plot and send to a file (no plot appears on screen)
with(faithful, plot(eruptions, waiting))
title(main = "Old Faithful Geyser data")  ## Annotate plot; still nothing on screen
dev.off()  ## Close the PDF file device
## Now you can view the file 'myplot.pdf' on your computer


###########  Progect 1 -----------------------------

workdir<-"C:\\Users\\Administrator\\Desktop\\Data science\\4.Exploratory Data Analysis\\hw"
setwd(workdir)

col.names<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
dat<-read.csv("household_power_consumption.txt",sep=";",col.names=col.names,
          skip=66637,nrows=2880)

#strptime(dat[1,1],format="%d/%mm/%Y")

attach(dat)
png(filename = "plot1.png",width = 480, height = 480)
hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()

##plot2
png(filename = "plot2.png",width = 480, height = 480)
plot(1:2880,Global_active_power,type="l",xaxt = "n",xlab="",ylab="Global Active Power(kilowatts)")
axis(1, at = c(1,1440,2880),labels = c("Thu","Fri","Sat"))
dev.off()



##plot3
png(filename = "plot3.png",width = 480, height = 480)
plot(Sub_metering_1,type="n",xaxt = "n",xlab="",ylab="Energy sub metering")
lines(Sub_metering_1)
lines(Sub_metering_2,col="red")
lines(Sub_metering_3,col="blue")
legend("topright", pch = "——", col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
axis(1, at = c(1,1440,2880),labels = c("Thu","Fri","Sat"))
dev.off()


##plot4
workdir<-"C:\\Users\\Administrator\\Desktop\\Data science\\4.Exploratory Data Analysis\\hw"
setwd(workdir)

dat<-read.csv("household_power_consumption.txt",sep=";",
          skip=66637,nrows=2880)

attach(dat)
datetime<-1:2880

png(filename = "plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))
#1
plot(dat[,3],type="l",xaxt = "n",xlab="",ylab="Global Active Power")
axis(1, at = c(1,1440,2880),labels = c("Thu","Fri","Sat"))
#2
plot(datetime,dat[,5],type="l",xaxt = "n",ylab="Voltage")
axis(1, at = c(1,1440,2880),labels = c("Thu","Fri","Sat"))
#3
plot(Sub_metering_1,type="n",xaxt = "n",xlab="",ylab="Energy sub metering")
lines(Sub_metering_1)
lines(Sub_metering_2,col="red")
lines(Sub_metering_3,col="blue")
legend("topright", pch = "——", bty="n",
    col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
axis(1, at = c(1,1440,2880),labels = c("Thu","Fri","Sat"))
#4
datetime<-1:2880
plot(datetime,Global_reactive_power,type="l",xaxt = "n")
axis(1, at = c(1,1440,2880),labels = c("Thu","Fri","Sat"))

dev.off()


############# WEEK 2 听课笔记-------
###1.lattice 绘图-----
library(lattice)
library(datasets)
xyplot(Ozone~Wind,data=airquality)
str(airquality)
airquality<-transform(airquality,Month=as.factor(Month))

xyplot(Ozone~Wind|Month,data=airquality,layout=c(5,1))


### 2.ggplot2

library(ggplot2)
str(mpg)
qplot(displ,hwy,data=mpg,col=drv)

qplot(displ,hwy,data=mpg,geom=c("point","smooth"))


qplot(displ,data=mpg,fill=drv)

qplot(displ,hwy,data=mpg,facets=drv)

qplot(displ,hwy,data=mpg,facets=.~drv)

