library(stats)
library(forecast)

ts.lh <- lh
ts.lh.arima <- auto.arima(ts.lh, trace = T)
summary(ts.lh.arima)
ts.lh.forecast <- forecast(ts.lh.arima, h = 10)
plot(ts.lh.forecast)

ts.UKgas <- UKgas
ts.UKgas.arima <- auto.arima(ts.UKgas, trace = T)
summary(ts.UKgas.arima)
ts.UKgas.forecast <- forecast(ts.UKgas.arima, h = 10)
plot(ts.UKgas.forecast)
