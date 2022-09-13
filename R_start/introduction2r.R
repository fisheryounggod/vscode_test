install.packages("ISLR")

install.packages('rmarkdown')


# R uses functions to perform operatons
getwd()
setwd('~/Myprograme/Rlanguage')
rm(list=ls())    # delete any object
ls()             # show objects
length(a)

# create a vector of numbers
a <- c(1,2,3,5) 
b = 1:10
c = seq(-pi,pi,length=10)

# slips
d = b[0:4]

# operations
2*a
a^d
a/d
 
identical(2**3,2^3)   
1:10 %/% 3
1:10 %% 3

exp(pi*1i)+1
factorial(7) 
choose(5,0:10)
sqrt(2)**2==2

# ?matrix
matrix(data=c(1,2,3,4),nrow=2,ncol = 2)
matrix(data=c(1,2,3,4),nrow=2,ncol = 2, byrow = TRUE)

set.seed(1333)
x = rnorm(50)
y = x+rnorm(50,mean = 50, sd=.1)
cor(x,y)
var(x)
mean(y)

plot(y,x,col='red')

pdf("Figure.pdf")
plot(x,y,col='green')
dev.off()

hist(x)
pie(abs(x))
pairs(~x+y)

Auto = read.table("Auto.data")
