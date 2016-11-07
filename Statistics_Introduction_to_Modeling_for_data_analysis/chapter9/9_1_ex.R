# glmのベイズモデル化

library(rstan)
library(coda)

# データ読み込み
load("~/study_statistical_model/Statistics_Introduction_to_Modeling_for_data_analysis/chapter9/d.RData")

summary(d)
plot(d$x, d$y)

# 比較のためglmでfitting
fit.glm <- glm(y ~ x, data = d, family = poisson)
summary(fit.glm)
xx <- seq(min(d$x), max(d$x), length = 100)
yy <- predict(fit.glm, newdata = data.frame(x = xx), type = "response")
lines(xx,yy)

print(fit.glm)

# rstan_options(auto_write = TRUE)
# options(mc.cores = parallel::detectCores())

# stanのモデル用にデータを加工
list.data <- list(
  x = d$x,
  y = d$y,
  N = nrow(d),
  mean_x = mean(d$x)
)
# stanの実行
fit <- stan(file = "~/study_statistical_model/Statistics_Introduction_to_Modeling_for_data_analysis/chapter9/9_1_ex.stan", data = list.data,
            iter = 1500, chains = 3, thin = 3, warmup = 100)
# 結果を表示
# MCMCサンプリングの図示
ms <- rstan::extract(fit)
fit_coda <- mcmc.list(lapply(1:ncol(fit),function(x) mcmc(as.array(fit)[,x,])))
plot(fit_coda)

print(fit)
plot(fit, ci_lebel = c(0.5, 0.95))
traceplot(fit, inc_warmup = TRUE)


post <- extract(fit)
old <- par(mfrow = c(1, 2))
plot(density(post$beta1), main = "beta 1")
rug(post$beta1)
plot(density(post$beta2), main = "beta 2")
rug(post$beta2)
par(old)

stan_dens(fit, separate_chains  = TRUE)

# mcmcのλ推定による予測
add.mean <- function(bb1, bb2, lty = 2, lwd = 1, ...){
  lines(d$x, exp(bb1 + bb2 * (d$x - mean(d$x))), lty = lty, lwd = lwd, ...)
}
plot(d$x, d$y, type = "n", xlab = "x_i", ylab = "y_i")
for (i in 1:length(post$beta1)) {
  add.mean(post$beta1[i], post$beta2[i], lty = 1, col = "#00000004")
}
points(d$x, d$y)
add.mean(median(post$beta1), median(post$beta2), lty = 1, lwd = 2)
