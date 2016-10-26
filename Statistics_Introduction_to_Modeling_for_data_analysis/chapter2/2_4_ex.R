logL <- function(m) sum(dpois(data, m, log = TRUE))
lambda <- seq(2, 5, 0.1)
plot(lambda, sapply(lambda, logL), type = "l")

plot_hist_and_prob <- function(m_list) {
  par(mfrow=c(length(m_list)/2,2))
  for (m in m_list){
    print(m)
    # 平均mのポアソン分布を作成
    y <- 0:9
    prob <- dpois(y, lambda = m)
    
    hist(data, breaks = seq(-0.5, 9.5, 1), main = paste0("lambda = ", as.character(m),
                                                         "\nlogL = ", as.character(logL(m))))
    lines(y, prob*length(data), type = "b", lty = 2)
  }
}

plot_hist_and_prob(c(2,3,3.56,4))
