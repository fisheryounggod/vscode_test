# 一行代码出简洁又美丽的回归表格
library(flextable)
summary(mtcars)

mymodel <- lm(mpg ~ vs * hp * wt, data = mtcars)
summary(mymodel)

as_flextable(mymodel)

x <- c(1, 2, 3, 6, 3, 6, 7, 4, 7, 10, 15)
y <- c(4, 5, 7, 8, 9, 0, 5, 3, 2, 5, 12)
mydata <- data.frame(x, y)
mydata

plot(mydata$x, mydata$y)

mydist <- dist(mydata, method = "euclidean")  
mydist

library(devtools)
install_github('andreacirilloac/updateR')
library(updateR)
updateR(admin_password = 'Admin user password')