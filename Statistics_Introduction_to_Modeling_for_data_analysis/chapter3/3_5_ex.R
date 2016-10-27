# 説明変数が因子型の場合のポアソン回帰
fit.f <- glm(y ~ f, data = d, family = poisson(link = "log"))
summary(fit.f)
logLik(fit.f)
