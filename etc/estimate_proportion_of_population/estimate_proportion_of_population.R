library(rstan)

start_year = 1
end_year = 10

sample_size = 100

a_s = 10
b_s = 20
c_s = 25

a_0 = 1000
b_0 = 3000
c_0 = 5000

a_p_now = a_0
b_p_now = b_0
c_p_now = c_0

population = NULL
sample_p = NULL
for(i in start_year:end_year){
  a_p_pre = a_p_now
  b_p_pre = b_p_now
  c_p_pre = c_p_now
  a_p_now = as.integer(rnorm(1, mean = a_p_pre, sd = a_s))
  b_p_now = as.integer(rnorm(1, mean = b_p_pre, sd = b_s))
  c_p_now = as.integer(rnorm(1, mean = c_p_pre, sd = c_s))
  # population = rbind(population,c(a_p_now,b_p_now,c_p_now))
  population_now = c(rep("a",a_p_now),rep("b",b_p_now),rep("c",c_p_now))
  population = rbind(population,table(population_now))
  sample_p = rbind(sample_p, table(sample(population_now,sample_size)))
}

dev.off()

par(mfrow=c(2,1))
plot(population[,'a'], col='red', ylim = c(0,max(population)))
par(new=T)
plot(population[,'b'], col='blue', ylim = c(0,max(population)))
par(new=T)
plot(population[,'c'], col='green', ylim = c(0,max(population)))

plot(sample_p[,'a'], col='red', ylim = c(0,max(sample_p)))
par(new=T)
plot(sample_p[,'b'], col='blue', ylim = c(0,max(sample_p)))
par(new=T)
plot(sample_p[,'c'], col='green', ylim = c(0,max(sample_p)))


