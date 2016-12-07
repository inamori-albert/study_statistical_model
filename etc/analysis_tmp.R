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
