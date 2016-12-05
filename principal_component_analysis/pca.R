# 主成分分析のサンプル
# http://www.statistics.co.jp/reference/software_R/statR_9_principal.pdf
seiseki <- read.csv("~/study_statistical_model/principal_component_analysis/seiseki.csv", header=T)

# scale=Tで相関行列から主成分分析,scale=Fで分散共分散行列から主成分分析
result <- prcomp(seiseki,scale=T)

# Standard deviation(標準偏差:該当する主成分がもつ情報量)
# Proportion of Variance(寄与率:全情報量のうち、該当する主成分が占める情報量の割合)
# Cumulative Proportion(累積寄与率:選択した主成分が占める情報量の割合.次元の縮約により失う情報量を測ることができる)
# PC1のCumulative Proportionを見ると、第1主成分に全体の何％の情報が集約されているかわかる
summary(result)
biplot(result)

print(round(result$rotation,digits = 3)) # 固有ベクトル(主成分軸の係数)
print(round(result$x,digits = 3)) # 主成分得点

# 因子負荷量の計算
fc.l <- sweep(result$rotation, MARGIN=2, result$sdev, FUN="*")
subject <- c("国", "社", "数", "理", "音", "美", "体", "技", "英")
plot(fc.l[,1], pch=subject, ylim=range(fc.l), main="PC1")
plot(fc.l[,2], pch=subject, ylim=range(fc.l), main="PC2")

plot(fc.l[,1], fc.l[,2], pch=subject,xlim=c(-1,1), ylim=c(-1,1))
