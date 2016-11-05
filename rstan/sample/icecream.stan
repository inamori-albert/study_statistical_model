data {
  int<lower=0> N; #サンプルサイズ。0より大きい。
  real kion[N]; #最高気温のデータは20。
  real<lower=0>  kyaku[N]; #データの客数は20人。0より大きい。
}

parameters {
  real beta0; #切片。
  real beta1; #最高気温の回帰係数。
  real<lower=0> sigma; #標準偏差。
}

transformed parameters  {
  #客数の平均は切片、気温の回帰係数、気温を使って定義していく。
  real mu[N];
  for (i in 1:N) {
    mu[i] <- beta0 + beta1*kion[i]; #客数の平均を定義。
  }
}

model {
    kyaku ~ normal(mu, sigma); #客数は平均 mu、標準偏差 sigma の正規分布に従う。
}