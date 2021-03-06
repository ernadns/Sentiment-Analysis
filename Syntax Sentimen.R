library(tm)
kalimat2<-read.csv("E:/KULIAH/TUGAS AKHIR LJ/FULL TWEET/DATA UNTUK MANDIRI TANPA REPLIES/data MANDIRI lexicon.csv",header=TRUE)

#Scoring
positif <- scan("E:/KULIAH/TUGAS AKHIR LJ/positifsent.txt",what="character",comment.char=";")
negatif <- scan("E:/KULIAH/TUGAS AKHIR LJ/negatifsent.txt",what="character",comment.char=";")
kata.positif = c(positif, "senang")
kata.negatif = c(negatif, "kecewa")
score.sentiment = function(kalimat2, kata.positif, kata.negatif,
                           .progress='none')
{
  require(plyr)
  require(stringr)
  scores = laply(kalimat2, function(kalimat, kata.positif,
                                    kata.negatif)
  {
    kalimat = tolower(kalimat)
    list.kata = str_split(kalimat, '\\s+')
    kata2 = unlist(list.kata)
    positif.matches = match(kata2, kata.positif)
    negatif.matches = match(kata2, kata.negatif)
    positif.matches = !is.na(positif.matches)
    negatif.matches = !is.na(negatif.matches)
    score = sum(positif.matches) - (sum(negatif.matches))
    return(score)
  }, kata.positif, kata.negatif, .progress=.progress )
  scores.df = data.frame(score=scores, text=kalimat2)
  return(scores.df)
}
hasil = score.sentiment(kalimat2$text, kata.positif, kata.negatif)
View(hasil)
#CONVERT SCORE TO SENTIMENT
hasil$klasifikasi<- ifelse(hasil$score<0, "Negatif","Positif")
hasil$klasifikasi
View(hasil)
#EXCHANGE ROW SEQUENCE
data<- hasil[c(3,1,2)]
View(data)
write.csv(data, file = "E:/KULIAH/TUGAS AKHIR LJ/FULL TWEET/DATA UNTUK MANDIRI TANPA REPLIES/hasil_pelabelanmandirifix.csv")
