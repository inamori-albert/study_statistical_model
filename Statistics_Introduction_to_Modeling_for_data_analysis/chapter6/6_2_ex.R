# ロジステック関数の定義と図示
logistic <- function(z) 1 / (1+exp(-z))
z <- seq(-6, 6, 0.1)
plot(z, logistic(z), type = "l")
abline(v = 0, lty="dashed")

x <- seq(-3, 3, 0.1)
beta1 <- 2
beta2 <- 2
z = beta1 + beta2*x
plot(x, logistic(z), type = "b", pch = c(21), xlim = c(-3,3), ylim = c(0,1.0))

par(new=T)
beta1 <- 0
z = beta1 + beta2*x
plot(x, logistic(z), type = "b", pch = c(17), xlim = c(-3,3), ylim = c(0,1.0))
z

par(new=T)
beta1 <- -3
z = beta1 + beta2*x
plot(x, logistic(z), type = "b", pch = c(14), xlim = c(-3,3), ylim = c(0,1.0))

abline(v = 0, lty="dashed")
legend("topleft", legend = c(
  paste0("b1=", as.character(2)),
  paste0("b1=", as.character(0)),
  paste0("b1=", as.character(-3))
  ),pch = c(21,17,14)
  )

x <- seq(-3, 3, 0.1)
beta1 <- 2
beta2 <- 2
z = beta1 + beta2*x
plot(x, logistic(z), type = "b", pch = c(21), xlim = c(-3,3), ylim = c(0,1.0))

par(new=T)
beta2 <- 4
z = beta1 + beta2*x
plot(x, logistic(z), type = "b", pch = c(17), xlim = c(-3,3), ylim = c(0,1.0))
z

par(new=T)
beta2 <- -1
z = beta1 + beta2*x
plot(x, logistic(z), type = "b", pch = c(14), xlim = c(-3,3), ylim = c(0,1.0))

abline(v = 0, lty="dashed")
legend("topleft", legend = c(
  paste0("b2=", as.character(2)),
  paste0("b2=", as.character(4)),
  paste0("b2=", as.character(-1))
),pch = c(21,17,14)
)