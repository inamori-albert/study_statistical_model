library("faraway", lib.loc="~/R/win-library/3.3")
data(babyfood,package="faraway")

babyfood

mod1<-glm(cbind(disease,nondisease)~sex+food, family=binomial,data= babyfood)
