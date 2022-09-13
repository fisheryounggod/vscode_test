#### (1) 数据导入 ####

# install.packages("bruceR")

library(bruceR)
# set.wd()  # 设置工作路径到当前文件所在路径（需安装1.4.843版本以上的RStudio）

# 通过rio::import()可以轻松导入任何格式的数据
# 这里只是一个示例，并无此Excel文件，可替换为你的数据
# data=import("BFI Personality.xlsx", setclass="data.table")

# 我们使用psych包里的“大五人格测验”数据（bfi）作为演示
?psych::bfi  # 查看该数据的帮助文档
data=as.data.table(psych::bfi)  # 转换为data.table格式
str(data)  # 查看变量
glimpse(data)  # 查看变量（另一种方式）


#### (2) 量表计算 ####

# 维度平均分（包括反向计分题）
# E = 外倾性，A = 宜人性，C = 尽责性，N = 神经质，O = 开放性
data[,`:=`(
  Big5.E=MEAN(data, "E", 1:5, rev=c(1,2), likert=1:6),
  Big5.A=MEAN(data, "A", 1:5, rev=1, likert=1:6),
  Big5.C=MEAN(data, "C", 1:5, rev=c(4,5), likert=1:6),
  Big5.N=MEAN(data, "N", 1:5, likert=1:6),
  Big5.O=MEAN(data, "O", 1:5, rev=c(2,5), likert=1:6)
)]

# 内部一致性信度
Alpha(data, "E", 1:5, rev=c(1,2))
Alpha(data, "A", 1:5, rev=1)
Alpha(data, "C", 1:5, rev=c(4,5))
Alpha(data, "N", 1:5)
Alpha(data, "O", 1:5, rev=c(2,5))


#### (3) 描述统计 ####

d=data[,.(gender, age, education, Big5.E, Big5.A, Big5.C, Big5.N, Big5.O)]

Describe(d, plot=TRUE)

Corr(d)


#### (4) 方差分析 ####

# 两因素被试间设计ANOVA
#（也可以添加多个协变量）
MANOVA(na.omit(d), dv="Big5.E", between=c("gender", "education"))

# 简单效应检验与事后配对比较
#（也可以设置不同的对比方式）
MANOVA(na.omit(d), dv="Big5.E", between=c("gender", "education")) %>%
  EMMEANS("gender", by="education")


#### (5) 回归分析 ####

lm1=lm(Big5.O ~ Big5.E, data=d)
lm2=lm(Big5.O ~ Big5.E + Big5.A + Big5.C + Big5.N + gender + education, data=d)
GLM_summary(lm1)
GLM_summary(lm2)
model_summary(list(lm1, lm2), std=TRUE)
model_summary(list(lm1, lm2), std=TRUE, file="Big5.doc")


#### (6) 中介分析 ####

# 将所有变量标准化处理（中心化的基础上进一步标准化）
d.std=grand_mean_center(na.omit(d), vars=names(d), std=TRUE)

# 建立中介变量模型和因变量模型
lm.m=lm(education ~ age + gender, data=d.std)
lm.y=lm(Big5.O ~ education + age + gender, data=d.std)
model_summary(list(lm.m, lm.y), std=TRUE)

# 使用mediation包做中介分析
# 查看mediate函数的帮助文档
?mediation::mediate

# (1) Monte Carlo方法
set.seed(123)  # 设置一个随机种子以重复随机结果
med.model=mediation::mediate(
  lm.m, lm.y,
  treat="age", mediator="education",
  sims=1000)
med_summary(med.model)

# (2) Bootstrap方法
set.seed(123)  # 设置一个随机种子以重复随机结果
med.model=mediation::mediate(
  lm.m, lm.y,
  treat="age", mediator="education",
  sims=1000, boot=TRUE, boot.ci.type="bca")
med_summary(med.model)