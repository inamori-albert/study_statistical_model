# glmのベイズモデル化

load("~/study_statistical_model/Statistics_Introduction_to_Modeling_for_data_analysis/chapter9/d.RData")

summary(d)
plot(d$x, d$y)

fit.glm <- glm(y ~ x, data = d, family = poisson)
summary(fit.glm)
xx <- seq(min(d$x), max(d$x), length = 100)
yy <- predict(fit.glm, newdata = data.frame(x = xx), type = "response")
lines(xx,yy)


