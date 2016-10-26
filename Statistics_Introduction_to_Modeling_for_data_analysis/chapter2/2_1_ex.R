setwd("./Statistics_Introduction_to_Modeling_for_data_analysis/chapter2/")
load("./data.RData")

print(data)
summary(data)

table(data)
hist(data, breaks = seq(-0.5, 9.5, 1))

var(data)
sd(data)
sqrt(var(data))
