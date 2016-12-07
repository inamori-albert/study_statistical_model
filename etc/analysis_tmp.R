str(iris)

# 相関をプロット
plot(iris$Sepal.Length, iris$Sepal.Width)
pairs(iris[1:5])

plot(iris[,3],iris[,4])

# 相関係数を計算
cor(iris[1:4], method = "p")
str(iris)

# Factor型を数字型に
my_iris <- iris
my_iris[,5] <- as.numeric(my_iris[,5])

# 相関係数を計算
cor(my_iris)

# Factorで1種類に絞り、相関をプロット
pairs(iris[iris$Species == 'setosa',])

# 正規分布でglm
fit = glm(Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width + Species, data = iris, family = gaussian)

plot(iris$Sepal.Width, iris$Sepal.Length)
lines(fit$fitted.values)

fit = glm(Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width, data = iris, family = gaussian)
summary(fit)

cor(my_iris[2:5])
fit = glm(Sepal.Length ~ Sepal.Width + Petal.Length, data = iris, family = gaussian)
summary(fit)

# aicでモデルを決定
fit = lm(Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width + Species, data = iris)
my_step <- step(fit)

# 木で分類
my_tree <- tree(Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width + Species, data = my_iris)
plot(my_tree)
text(my_tree)

# 木で回帰
plot(my_iris$Sepal.Length,my_iris$Sepal.Width)
partition.tree(my_tree,add=T,col=2)

# 木の剪定
my_tree2 <- prune.tree(my_tree,best=10)
plot(my_tree2)
text(my_tree2)


my_tree <- tree(Sepal.Length ~ Sepal.Width + Species, data = my_iris)
plot(my_tree)
text(my_tree)

# パレート図を作った
z <- table(cut(iris$Petal.Length, breaks = seq(3,8,0.2)))
pareto.chart(z)

# 種別で色分け
with(iris, plot(Petal.Length, Species, col=rainbow(7)[Species]))

with(iris, plot(Petal.Length, Sepal.Length, col=rainbow(7)[Species]))

# 時系列データ
ts.plot(ldeaths,mdeaths,fdeaths,col=c(1,2,3))
# 単位根検定→両方とも単位根なので、一回微分しないと見せかけの回帰が生じる
adf.test(ldeaths)
adf.test(mdeaths)

library(forecast)
tsdisplay(ldeaths)
tsdisplay(mdeaths)

my_arima <- auto.arima(ldeaths, max.p = 10, max.q = 10, max.order = 30, stepwise=F, trace=T, seasonal = F)
plot(forecast(my_arima, h = 30))

data("Canada")
# 単位根検定→単位根でないので、そのままVAR使ってOK
adf.test(Canada[,1])
adf.test(Canada[,2])
adf.test(Canada[,3])
adf.test(Canada[,4])

# 季節成分分解
plot(stl(ldeaths, s.window = "periodic"))

library(vars)
my_var = VAR(Canada,p=VARselect(Canada)$selection[1])
summary(my_var)
plot(forecast(my_var, h = 10))
