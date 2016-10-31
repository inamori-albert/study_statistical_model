library(MASS)

# データの読み込み
d <- read.csv("data4a.csv")

# データの確認
summary(d)
plot(d$x, d$y, xlab = "xi", ylab = "yi", pch = c(21,19)[d$f])
legend("topleft", legend = c("C", "T"), pch = c(21,19))

# パラメータ推定
fit.bino <- glm(cbind(y, N-y) ~ x + f, data = d, family = binomial(link = "logit"))
summary(fit.bino)

# 推定結果の図示
nn <- 8
xx <- seq(min(d$x), max(d$x), length = 100)
ff <- c("C")
yy <- predict(fit.bino, newdata = data.frame(x = xx, f = ff), type = "response") * nn
lines(xx, yy, type = "b", lwd = 2, pch = c(21))
ff <- c("T")
yy <- predict(fit.bino, newdata = data.frame(x = xx, f = ff), type = "response") * nn
lines(xx, yy, type = "b", lwd = 2, pch = c(19))

# AICによるモデル選択
fit.1 <- glm(cbind(y, N-y) ~ 1, data = d, family = binomial(link = "logit"))
fit.f <- glm(cbind(y, N-y) ~ f, data = d, family = binomial(link = "logit"))
fit.x <- glm(cbind(y, N-y) ~ x, data = d, family = binomial(link = "logit"))
fit.xf <- glm(cbind(y, N-y) ~ x + f, data = d, family = binomial(link = "logit"))
stepAIC(fit.1)
stepAIC(fit.f)
stepAIC(fit.x)
stepAIC(fit.xf)
# fit.xfが一番AICが低くなるのでよい

