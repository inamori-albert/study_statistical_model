library(rstan)

icecream <- read.csv("icecream.txt")

dat <- list(N = 20, kion = icecream$kion, kyaku = icecream$kyaku)

scr<-"icecream.stan"
par = c("beta0", "beta1")
war<-5000
ite<-100000
cha<-1
fit<-stan(file = scr, model_name = scr, data = dat, pars = par, chains = cha, warmup = war, iter=ite)