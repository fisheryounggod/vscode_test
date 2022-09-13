x = c(2,7,5)
x
y = seq(from=-4,length=3,by=3)
x+y
x/y
x^y
x[2]
x[2:3]
x[-2]
m = matrix(seq(12),3,4)
m
?seq
m[,2:3]
dim(m)
ls()
rm(y)

x = runif(30)
y = rnorm(30)
plot(x,y)
par(mfrow=(c(1,1)))
plot(x,y,pch='o',col='blue')
hist(y)

pix = read.csv('/users/mac/downloads/mtcars.csv')
names(pix)
dim(pix)
class(pix)
summary(pix)
plot(pix$carb,pix$wt)
attach(pix)
search()
plot(cyl,gear)
cyl=as.factor(cyl)


