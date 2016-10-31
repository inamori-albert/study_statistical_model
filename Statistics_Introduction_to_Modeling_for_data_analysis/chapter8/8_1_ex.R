load("./data.RData")

table(data)
hist(data, breaks = seq(-0.5,8.5,1))
