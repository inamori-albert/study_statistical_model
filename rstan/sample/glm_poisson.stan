data {
  int<lower=1> N;
  vector[N] x;
  vector[N] y;
}

parameters{
  real beta1;
  real beta2;
}

model {
  for(i in 1:N){
    y[i] ~ poisson_log(beta1 + beta2 * x[i]);
  }
}

generated quantities {
  real log_lik[N];
  for (n in 1:N){
    log_lik[n] = poisson_lpmf(y[i]|exp(beta1 + beta2 * x[i]));
  }
}