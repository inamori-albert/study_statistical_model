library("glmmML", lib.loc="~/R/win-library/3.3")

d <- read.csv("data.csv")
summary(d)

d4 <- d[d$x==4,]
table(d4$y)
c(mean(d4$y), var(d4$y))

# glmとglmmを試す
fit.glm <-glm(cbind(y, N-y) ~ x, data = d, family = binomial)
fit.glmm <- glmmML(cbind(y, N-y) ~ x, data = d, family = binomial, cluster = id)

summary(fit.glm)
summary(fit.glmm)
# AICからglmmの方がよさそう