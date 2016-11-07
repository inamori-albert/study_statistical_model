data {
  int<lower=1> N;
  real<lower=0> x[N];
  real mean_x;
  int<lower=0> y[N];
}

parameters {
  real beta1;
  real beta2;
}

model {
  for(i in 1:N){
    y[i] ~ poisson(exp(beta1+beta2*(x[i]-mean_x)));
  }
}