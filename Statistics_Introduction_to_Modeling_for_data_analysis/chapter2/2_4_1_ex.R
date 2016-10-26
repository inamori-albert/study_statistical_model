# 最尤推定値のばらつきを乱数を利用して実験
logger = c()

for(i in c(1:3000)){
  logger = c(logger, mean(rpois(50, 3.5)))
}

hist(logger, breaks = seq(2.5, 4.5, 0.1))
