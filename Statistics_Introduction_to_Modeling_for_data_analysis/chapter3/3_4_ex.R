# ポアソン回帰
fit <- glm(y ~ x, data = d, family = poisson(link = "log"))

summary(fit)

logLik(fit)

plot(d$x, d$y, pch = c(21,19)[d$f])
xx <- seq(min(d$x), max(d$x), length = 100)
lines(xx, exp(1.29 + 0.0757 * xx), lwd = 2)

plot(d$x, d$y, pch = c(21,19)[d$f])
yy <- predict(fit, newdata = data.frame(x = xx), type = "response")
lines(xx, yy, lwd = 2)
