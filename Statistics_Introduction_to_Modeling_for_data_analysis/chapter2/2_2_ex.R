setwd("./Statistics_Introduction_to_Modeling_for_data_analysis/chapter2/")
load("./data.RData")

# 平均3.56のポアソン分布を作成
y <- 0:9
prob <- dpois(y, lambda = 3.56)
print(cbind(y,prob))
plot(y, prob, type = "b", lty = 2)

hist(data, breaks = seq(-0.5, 9.5, 1))
lines(y, prob*length(data), type = "b", lty = 2)
