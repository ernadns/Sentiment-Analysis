library(dplyr)
library(Hmisc)
library(pscl)
library(ResourceSelection)
library(caret)
library(polycor)
library(car)

data<-read.csv("E:/KULIAH/TUGAS AKHIR LJ/FULL TWEET/DATA UNTUK BRI TANPA REPLIES/datarblsmotemindf5.csv", header=TRUE)
datakor<-read.csv("E:/KULIAH/TUGAS AKHIR LJ/FULL TWEET/DATA UNTUK BRI TANPA REPLIES/datakorelasi.csv",header=TRUE)
options(max.print = 999999999)
kor=data.frame(datakor)
View(data)

#Korelasi Polycor
hasil<-hetcor(kor, stde.err=TRUE, tests=TRUE)
write.csv(hasil[["correlations"]], "E:/KULIAH/TUGAS AKHIR LJ/FULL TWEET/DATA UNTUK BRI TANPA REPLIES/korelasiyx.csv")
write.csv(hasil[["tests"]], "E:/KULIAH/TUGAS AKHIR LJ/FULL TWEET/DATA UNTUK BRI TANPA REPLIES/pvalueyx.csv")
write.csv(hasil[["std.errors"]], "E:/KULIAH/TUGAS AKHIR LJ/FULL TWEET/DATA UNTUK BRI TANPA REPLIES/stderroryx.csv")
View(hasil)

#Korelasi Pearson
data.cor=rcorr(as.matrix(datakor))
as.data.frame.default(data.cor, optional = TRUE, stringsAsFactors = stringsAsFactors)
write.csv(data.cor[["r"]], "E:/KULIAH/TUGAS AKHIR LJ/FULL TWEET/DATA UNTUK BRI TANPA REPLIES/korelasixx.csv")
write.csv(data.cor[["P"]], "E:/KULIAH/TUGAS AKHIR LJ/FULL TWEET/DATA UNTUK BRI TANPA REPLIES/pvaluexx.csv")
View(data.cor)

#Regresi Logistik Biner
model <- glm(Klasifikasi~., data=data, family=binomial, control=glm.control(maxit=1))
summary(model)
vif(model)



