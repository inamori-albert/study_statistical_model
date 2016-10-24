data <- c(2,2,4,6,4,5,2,3,1,2,0,4,3,3,3,3,4,2,7,2,4,3,3,3,4,3,7,5,3,1,7,6,4,6,5,2,4,7,2,2,6,2,4,5,4,5,1,3,2,3)

summary(data)

table(data)
hist(data, breaks = seq(-0.5, 9.5, 1))

var(data)
sd(data)
sqrt(var(data))
