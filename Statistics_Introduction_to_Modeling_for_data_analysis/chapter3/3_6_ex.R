# 説明変数が数量型+因子型のポアソン回帰
fit.all <- glm(y ~ x + f, data = d, family = poisson(link = "log"))
summary(fit.all)
logLik(fit.all)
