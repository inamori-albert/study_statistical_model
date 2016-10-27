library("vars", lib.loc="~/R/win-library/3.3")
library("tsDyn", lib.loc="~/R/win-library/3.3")
data(Canada)
VARselect(Canada,lag.max=4)

Canada.var <- VAR(Canada, p=VARselect(Canada,lag.max = 4)$selection[1])
summary(Canada.var)
plot(Canada.var)

Canada.predict <- predict(Canada.var,n.ahead = 20,ci = 0.95)
plot(Canada.predict)
