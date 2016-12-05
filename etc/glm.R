library(MASS)
head(birthwt)

str(birthwt)

sample_logi <- birthwt[,c(1,2,3,5,6,7,8)]

attach(sample_logi)

output.glm <- glm(low~.,family = binomial,data = sample_logi)
summary(output.glm)

exp(output.glm$coefficients)
