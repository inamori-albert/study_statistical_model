library(rstan)
require("coda")

icecream <- read.csv("icecream.txt")

dat <- list(N = 20, kion = icecream$kion, kyaku = icecream$kyaku)

scr<-"icecream.stan"
par = c("beta0", "beta1")
war<-5000
ite<-100000
cha<-1
fit<-stan(file = scr, model_name = scr, data = dat, pars = par, chains = cha, warmup = war, iter=ite)

s <- mcmc.list(lapply(1:ncol(fit), function(x) mcmc(as.array(fit)[,x,])))
S <- ggs(s)

ggs_histogram(S)
ggs_traceplot(S)
ggs_density(S)
ggs_compare_partial(S)
ggs_running(S)
ggs_autocorrelation(S)
ggs_crosscorrelation(S)
ggs_caterpillar(S)
