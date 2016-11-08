d <- iris
d <- d[,-ncol(d)]
hc <- hclust(as.dist(1-cor(d, method='spearman', use='pairwise.complete.obs')))
hc.order <- order.dendrogram(as.dendrogram(hc))
d <- d[ ,hc.order]
gr <- as.factor(iris$Species)

cols.key <- scales::muted(c('red', 'blue', 'green'))
cols.key <- adjustcolor(cols.key, alpha.f=1/4)
pchs.key <- rep(19, 3)

panel.hist <- function(x, ...) {
  usr <- par('usr'); on.exit(par(usr))
  par(usr=c(usr[1:2], 0, 1.5))
  h <- hist(x, plot=FALSE)
  breaks <- h$breaks
  nB <- length(breaks)
  y <- h$counts; y <- y/max(y)
  rect(breaks[-nB], 0, breaks[-1], y, col='gray', ...)
}

panel.cor <- function(x, y, ...){
  usr <- par('usr'); on.exit(par(usr))
  par(usr=c(0,1,0,1))
  r <- cor(x, y, method='spearman', use='pairwise.complete.obs')
  zcol <- lattice::level.colors(r, at=seq(-1, 1, length=81), col.regions=colorRampPalette(c(scales::muted('red'),'white',scales::muted('blue')), space='rgb')(81))
  ell <- ellipse::ellipse(r, level=0.95, type='l', npoints=50, scale=c(.2, .2), centre=c(.5, .5))
  polygon(ell, col=zcol, border=zcol, ...)
  text(x=.5, y=.5, lab=100*round(r, 2), cex=2, col='white')
  # pval <- cor.test(x, y, method='spearman', use='pairwise.complete.obs')$p.value
  # sig <- symnum(pval, corr=FALSE, na=FALSE, cutpoints = c(0, 0.001, 0.01, 0.05, 0.1, 1), symbols = c('***', '**', '*', '.', ' '))
  # text(.6, .8, sig, cex=2, col='gray20')
}

panel.scatter <- function(x, y){
  points(x, y, col=cols.key[gr], pch=pchs.key[gr], cex=1)
  lines(lowess(x, y))
}

png('pairs.png', res=250, width=1500, height=1500)
pairs(d,
      diag.panel=panel.hist,
      lower.panel=panel.scatter,
      upper.panel=panel.cor,
      gap=0.5,
      labels=gsub('\\.', '\n', colnames(d)),
      label.pos=0.7,
      cex.labels=1.4
)
dev.off()
