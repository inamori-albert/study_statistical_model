library(corrplot)

d <- iris
d <- d[,-ncol(d)]
M <- cor(d, method='spearman', use='pairwise.complete.obs')

png(file='corrplot.png', res=250, w=1500, h=1500)
corrplot.mixed(M, order = 'hclust')
dev.off()
