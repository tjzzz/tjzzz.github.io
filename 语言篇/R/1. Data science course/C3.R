### Course3
#############  WEEK 1 ---------------------------------
if(!file.exists("data")){
  dir.create("data")
}


### 1.download.file()

fileurl='https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD'
destfile="C:\\Users\\Administrator\\Desktop\\Data science\\download.csv"
download.file(fileurl,destfile)
list.files()

### 2.读取XML文件
library(XML)
# url1='http://worldcup.2014.163.com/schedule/calendar/'
# doc1<-htmlTreeParse(url1)
# rootNode1<-xmlRoot(doc1)
# xmlName(rootNode1)
# names(rootNode1)

## 例子2.1
url='http://www.w3schools.com/xml/simple.xml'
doc<-xmlTreeParse(url,useInternal=T)
rootNode<-xmlRoot(doc)
xmlName(rootNode)
names(rootNode)

rootNode[[1]][[1]]

xmlSApply(rootNode,xmlValue)

#用XPath的方法找到name
xpathSApply(rootNode,"//name",xmlValue)

### 例子2.2
url='http://espn.go.com/nfl/team/_/name/bal/baltimore-ravens'
doc <- htmlTreeParse(url,useInternal=TRUE)
scores <- xpathSApply(doc,"//li[@class='score']",xmlValue)
teams <- xpathSApply(doc,"//li[@class='team-name']",xmlValue)



### 3.XML.pdf学习练习
setwd("C:/Users/Administrator/Desktop/Data science")

doc<-xmlTreeParse("books.xml",useInternal=T)
top=xmlRoot(doc)

xmlName(top)
names(top)    #共有两篇文章

#查找作者列表
names(top[[1]])
art=top[[1]][["AuthorList"]]
names(art)       #是对应的6个author
author1=art[[1]]  #第一个author下的属性
names(author1)
xmlSApply(author1,xmlValue)

##对总体的
xmlSApply(art, function(x) xmlSApply(x, xmlValue))



##利用XPath语句查找文章received日期
nodes=getNodeSet(top,"//PubDate[@PubStatus='received']")
#找到2个结点,此时是list
#提取出year，month，day
lapply(nodes,function(x) xmlSApply(x,xmlValue))

#文章的摘要
abstracts<-xpathSApply(top, "//Abstract", xmlValue)
lapply(getNodeSet(top,"//Abstract"),xmlValue)



### 4.读取json文件
library(jsonlite)
jsondata<-fromJSON("https://api.github.com/users/jtleek/repos")
names(jsondata)

#输出json格式
myjson<-toJSON(iris,pretty=T)


## 5.data.table 包
#源于data.frame,速度更快，更有效
install.packages("data.table")
library(data.table)


# 数据创建和data.frame差不多
#子集提取不太一样
tables()
DF = data.frame(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
DT = data.table(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))

DF[2]   
DF[c(1,3),]

DT[2]   
DT[,c(1,3)]

#sumarize data
DT[,list(mean(x),sum(z))]
DT[,table(y)]
# 增加新列
DT[,w:=z^2]
# count .N

#keys JOIN
DT1=data.table(x=c('a','b','b','dt1'),y=1:4)
DT2=data.table(x=c('a','b','dt2'),y=5:7)
setkey(DT1,x)
setkey(DT2,x)
merge(DT1,DT2)

#fread 实验读入速度 50m  170万行
library(data.table)
file="C:\\Users\\Administrator\\Desktop\\Data science\\2014-05-14.csv"
system.time(read.csv(file,header=F))
system.time(fread(file))

# Week1_Homework ----------------------------------------------------------

setwd("F:\\05Course\\Data science\\3.Geting and cleaning data\\Hw")

url='https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
destfile="hw1_1.csv"
download.file(url,destfile)
#list.files()

hw1_data=read.csv(destfile,header=T)
#Q1:VAL=24
val=hw1_data$VAL
sum(val==24,na.rm=T)

# Q3  ?????????? 下载有问题
library(xlsx)
url<-'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx'
destfile="hw1_2.xlsx"
download.file(url,destfile,mode="wb")
dat=read.xlsx(file=destfile,1,rowIndex=18:23,colIndex=7:15)
sum(dat$Zip*dat$Ext,na.rm=T) 


#Q4
library(XML)
url='https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml'
doc<-htmlTreeParse(url)

url='http://www.w3schools.com/xml/simple.xml'
doc<-xmlTreeParse("dat2.xml")

#Q5
library(data.table)
url<-'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv'
dest="hw1-3.csv"
download.file(url,dest)
DT=fread(dest)
DT2=rbind(DT,DT)
DT=rbind(DT2,DT)


#不同方式比较
#21.7
system.time(mean(DT[DT$SEX==1,]$pwgtp15))
system.time(mean(DT[DT$SEX==2,]$pwgtp15))

#0.03
system.time(mean(DT$pwgtp15,by=DT$SEX))

#....
system.time(rowMeans(DT)[DT$SEX==1])
system.time(rowMeans(DT)[DT$SEX==2])

#1.84
system.time(tapply(DT$pwgtp15,DT$SEX,mean))

#0.81
system.time(DT[,mean(pwgtp15),by=SEX])

#0.87
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
  

s=0
for(i in 1:100){
  b=system.time(mean(DT[DT$SEX==1,]$pwgtp15))
  s=s+b[3]
}                                                    
s                                                   
                                                            
                                                            

### week2 homework-------
##Q4.
url<-"http://biostat.jhsph.edu/~jleek/contact.html"
www<-readLines(url)
str(www)
nchar(www[c(10,20,30,100)])

##Q5.
#注意数据格式是混合的，前4行是标题，中间分隔符有制表符，空格，-
getwd()
# download the file
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
download.file(fileUrl, destfile = "getdata-wksst8110")

#F1:
zz<-file("getdata-wksst8110","r")
b=readLines(zz,n=4)   #first 4 lines
head(b)
b=readLines(zz)
#字符串替换
dat<-as.numeric(substr(b,29,32))
sum(dat)
close(zz)

                                                     
                                                            

### week 3 homework -------
# download the file

setwd("F:\\05Course\\Data science\\3.Geting and cleaning data\\Hw\\w3")

##Q1
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv "
download.file(fileUrl, destfile = "dat_w3.csv")

dat<-read.csv(file="dat_w3.csv")
str(dat)
agricultureLogical=(dat$ACR==3 & dat$AGS==6)
which(agricultureLogical) 


#Q2
install.packages("jpeg")
library(jpeg)
dat2<-readJPEG("getdata-jeff.jpg",native=T)
str(dat2)
dat2[30,80]

quantile(dat2,probs=c(0.3,0.8))

#Q3
GDP=read.csv("getdata-data-GDP.csv",skip=5,nrows=190,header=F)
GDP<-GDP[,-c(3,6:10)]
colnames(GDP)<-c("short.name","rank","Economy","us")
EDSTATS=read.csv("getdata-data-EDSTATS_Country.csv")

head(GDP)
head(EDSTATS)
merge_dat=merge(GDP,EDSTATS,by.x="short.name",by.y="CountryCode") 
#没匹配上的省略
nrow(merge_dat)
merge_dat=merge_dat[order(merge_dat$rank,decreasing=T),]
merge_dat$Long.Name[13]

attach(merge_dat)
tapply(rank,INDEX=merge_dat$Income.Group,mean)

#Q5:
library(Hmisc)
groupfactor<-cut2(rank,g=5)
table(groupfactor,Income.Group)


### week4 homework----------
## q1
setwd("F:/05Course/Data science/3.Geting and cleaning data/Hw/w4")

dat<-read.csv("getdata_data_ss06hid.csv")
head(dat)
strsplit(colnames(dat),"wgtp")[123]

## Q2
dat=read.csv("getdata_data_GDP.csv",skip=5,nrows=190,header=F)
GDP=as.character(dat[,5])

GDP=gsub(",","",GDP)
mean(as.numeric(GDP))

grep("^United",dat[,4])


##Q4
EDSTATS=read.csv("getdata_data_EDSTATS_Country.csv")
GDP=read.csv("getdata_data_GDP.csv",skip=5,nrows=190,header=F)

name1<-as.character(GDP[4])   #190
name2<-EDSTATS$Short.Name   #234

index=(name2 %in% name1) 


notes=EDSTATS$Special.Notes


grep("Fiscal year end: June",notes)

## 还没有将两个数据match
#dat2=merge(EDSTATS,GDP,by.x=EDSTATS$Short.Name,by.y=GDP[4])



## Q5
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)

amzn=as.data.frame(amzn)
time=row.names(amzn)
time=as.Date(time)

year=format(time,"%Y")

sum(year=="2012")
sum(weekdays(time)=="星期一" & format(time,"%Y")=="2012")

























