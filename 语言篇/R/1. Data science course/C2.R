## Course 2
### R programing 


#### week 1 homework --------------
file="C:\\Users\\Administrator\\Desktop\\Data science\\2.R programing\\rprog-data-quiz1_data\\hw1_data.csv"
dat=read.csv(file,header=TRUE)
colnames(dat)
dat[c(1,2),]
nrow(dat)
dat[c(152,153),]
sum(is.na(dat$Ozone))

index=is.na(dat$Ozone)
b=dat$Ozone[!index]
mean(b)

ind1=(dat$Ozone>31 & dat$Temp>90)
bb=dat$Solar.R[ind1]

bb=bb[!is.na(bb)]
mean(bb)

ind2=(dat$Month==6)
mean(dat$Temp[ind2],na.rm=T)


ind3=(dat$Month==5)
max(dat$Ozone[ind3],na.rm=T)


########## swirl
library(swirl)



####### C2 Week2 homework ---------------
#Q1
cube <- function(x, n) {
    x^3
}
cube(3)

#
x <- 1:10
if(x > 5) {
    x <- 0
}


##
f <- function(x) {
    g <- function(y) {
        y + z
    }
    z <- 4
    x + g(x)
}

z=10
f(3)

#
x <- 5
y <- if(x < 3) {
    NA
} else {
    10
}

y
##
h <- function(x, y = NULL, d = 3L) {
    z <- cbind(x, d)
    if(!is.null(y))
        z <- z + y
    else
        z <- z + f
    g <- x + y / z
    if(d == 3L)
        return(g)
    g <- g + 10
    g
}
h(1)

########## C2 Week2  Project1--------------

workdir="F:\\05Course\\Data science\\2.R programing\\hw\\project1\\"
setwd(workdir)

#见另外3个程序

weekdays(Sys.time())


####  C2 Week3 hw  --------

## Q1 the mean of 'Sepal.Length' for the species virginica?
library(datasets)
data(iris)
?iris
str(iris)
tapply(iris$Sepal.Length,iris$Species,mean)

apply(iris[, 1:4], 2, mean)

library(datasets)
data(mtcars)
str(mtcars)
?mtcars
with(mtcars, tapply(mpg, cyl, mean))


a=with(mtcars, tapply(hp, cyl, mean))
a
a[3]-a[1]

debug(ls)


#### C2 WEEK4  HW  -----------

set.seed(1)
rpois(5, 2)


y<-rnorm(100,2)
x1<-rnorm(100)
x2<-rnorm(100)
library(datasets)
Rprof()
fit <- lm(y ~ x1 + x2)
Rprof(NULL)
summaryRprof()



##### C2 Week4  project ----------------

workdir="F:\\05Course\\Data science\\2.R programing\\hw\\project3\\"
setwd(workdir)

outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11])




myfun<-function(x){
    if(x>1)
        stop("x>1")
    x
}











