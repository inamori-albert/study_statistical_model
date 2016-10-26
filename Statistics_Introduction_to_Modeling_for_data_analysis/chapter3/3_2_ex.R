setwd("./Statistics_Introduction_to_Modeling_for_data_analysis/chapter3/")
d <- read.csv("data3a.csv")

head(d, 10)
print(d$y)
print(d$x)
print(d$f)

print(class(d$y))
print(class(d$x))
print(class(d$f))

summary(d)