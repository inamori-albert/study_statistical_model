setwd("./Statistics_Introduction_to_Modeling_for_data_analysis/chapter2/")
load("./data.RData")

y <- 0:9
prob <- dpois(y, lambda = 3.56)
cbind(y, prob)

plot(y, prob, type = "b", lty = 2)

data <- c(2,2,4,6,4,5,2,3,1,2,0,4,3,3,3,3,4,2,7,2,4,3,3,3,4,3,7,5,3,1,7,6,4,6,5,2,4,7,2,2,6,2,4,5,4,5,1,3,2,3)
hist(data, breaks = seq(-0.5, 9.5, 1))
lines(y, prob*50)
