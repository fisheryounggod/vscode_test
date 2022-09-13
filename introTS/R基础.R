R 基础

```{r}
# for循环：for (n in x) ｛expr}
pv<-c(1,2,3,1,1)

for(i in pv){ 
    print(i)
}
```

```{r}
# while 循环：while (condition) ｛expr}
a=1
while (a){
    print(a)
    if (a==1){
        a=0
    }
}

```

```{r}
# if：if (condition1) ｛expr1}else｛expr1}
for (b in c(1,2,3,4)){
    if (b<3){
        print(b)
    }else{
        print("no")
    }
    
}
```
# 对象和类
```{r}
# 创建两个数值向量
x <- runif(100) 
y <- rnorm(100)+5*x
# 用线性回归创建模型，存入对象model
model <- lm(y~x)
attributes(model)
```
# 自定义函数
```{r}
f1 <- function(x) {
    log(x)
}
f1(1)
f1(10)
```

# 错误处理
> 在R中，有三个函数工具可以解决条件异常处理（包括错误）问题：
- try() 如果出现错误，使用该函数可以跳过错误继续执行程序。
- tryCatch() 指定控制条件，进行异常捕捉，然后采用对应的函数处理异常和错误。
- withCallingHandlers() 是tryCatch()的变体，只是运行的上下文条件不同，它使用的情况很少，但是非常有用。

```{r}
#默认 silent = FALSE，显示错误信息
try({
    a <- 1
    b <- "x"
    a + b
})

```

```{r}
try({
    a <- 1
    b <- "x"
    a + b
}, silent = TRUE)
print("ok")
```
```{r}

```

