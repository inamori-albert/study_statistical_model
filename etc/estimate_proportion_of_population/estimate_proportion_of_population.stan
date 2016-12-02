// estimate_proportion_of_population

data {
  int N;
  int sample_a[N];
  int sample_b[N];
  int sample_c[N];
}

parameters {
  real population_a[N];
  real population_b[N];
  real population_c[N];
  real population_a_s;
  real population_b_s;
  real population_c_s;
  real sample_percent[N];
}


model {
  for (n in 2:N) {
    population_a[n] ~ normal(population_a[n-1], population_a_s);
    population_b[n] ~ normal(population_b[n-1], population_b_s);
    population_c[n] ~ normal(population_c[n-1], population_c_s);
    
    
    
    // Y[n] ~ normal(a + b*X[n], sigma);
  }
}