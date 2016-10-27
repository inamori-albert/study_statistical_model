# 逸脱度について

# フルモデルの逸脱度
sum(log(dpois(d$y, lambda = d$y)))

fit.null <- glm(formula = y ~ 1, family = poisson(link = "log"), data=d)
summary(fit.null)
logLik(fit.null)
