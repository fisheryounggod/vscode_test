setwd("/Users/mac/myPrograme/work_space/R/")
system("ls -f")
system("open .")

#install.packages("tibble")
#install.packages("ggplot")

library(tibble)   # 创建数据
library(ggplot2)  # 图片制作

set.seed(123)  # 让结果可以重复

#创建所需的数据集：
mydata <- tibble(
    x = rnorm(20, 0, 5),
    error = rnorm(20, 0, 10),
    y = 5 + 3 * x + error,
    y_fitted = predict(lm(y ~ x)),
    residuals = residuals(lm(y ~ x))
)

# 第一个代数特征为：所有残差之和为0
sum(mydata$residuals)
# 第二个特征为：自变量x与残差的乘积之和为0
sum(mydata$x * mydata$residuals)
# 第三：预测值与残差的乘积之和为0
sum(mydata$y_fitted * mydata$residuals)

c(mean(mydata$x), mean(mydata$y))

ggplot(mydata, aes(x, y)) +
    geom_point(color = "steelblue") +
    geom_line(aes(x, y_fitted), color = "darkseagreen") +
    theme_minimal()
# 图中添加上这个点(x = 0.708119, y = 6.611785)
ggplot(mydata, aes(x, y)) +
    geom_point(color = "steelblue") +
    geom_line(aes(x, y_fitted), color = "darkseagreen") +
    geom_point(aes(x = 0.708119, y = 6.611785), color = "orange", size = 3) + # 添加这个点
    theme_minimal()


# 计算并且画出95%置信区间
library(ggplot2)
summary(mtcars)
mydata <- mtcars
rownames(mydata) <- NULL
mymodel <- lm(mpg ~ hp, mydata)

prediction <- predict(mymodel, mydata, se.fit = TRUE)
prediction

mydata$lower <- prediction$fit - 1.96 * prediction$se.fit
mydata$upper <- prediction$fit + 1.96 * prediction$se.fit

ggplot(mydata, aes(x = hp, y = mpg)) +
    geom_point() +
    geom_smooth(method = "lm", fill = "steelblue") +
    geom_line(aes(y = lower), color = "orange") +   # 添加置信区间的上限
    geom_line(aes(y = upper), color = "orange") +   # 添加置信区间的下限
    theme_classic()
