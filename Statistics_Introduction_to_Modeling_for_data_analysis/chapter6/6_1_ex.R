# データの読み込み
d <- read.csv("data4a.csv")

# データの確認
summary(d)
plot(d$x, d$y, xlab = "xi", ylab = "yi", pch = c(21,19)[d$f])
legend("topleft", legend = c("C", "T"), pch = c(21,19))
