library(TTR)

data("UKgas")
plot(UKgas)

# 周期性の影響を消すために4期で移動平均
UKgas.SMA4 <- SMA(UKgas, n = 4)
summary(UKgas.SMA4)
plot(UKgas.SMA4)

# 周期性の分離1
UKgas.dec <- decompose(UKgas)
summary(UKgas.dec)
plot(UKgas.dec)

# 周期性の分離2
# 周期性を見るならこっちの方がよさそう
UKgas.stl <- stl(UKgas, s.window = "periodic")
summary(UKgas.stl)
plot(UKgas.stl)
