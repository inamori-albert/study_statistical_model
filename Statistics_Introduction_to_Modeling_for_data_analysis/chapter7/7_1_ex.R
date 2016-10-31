# データの読み込み
d <- read.csv("data.csv")

plot(d$x, d$y)

# 2項分布でGLM
fit <- glm(cbind(y, N-y) ~ x, data = d, family = binomial(link = "logit"))
summary(fit)

xx <- seq(min(d$x), max(d$x), length = 100)
nn <- 8
yy <- predict(fit, newdata = data.frame(x=xx), type = "response") * nn
lines(xx, yy, type = "b", lwd = 2)
