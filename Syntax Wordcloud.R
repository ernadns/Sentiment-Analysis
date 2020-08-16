library(RColorBrewer)
library(wordcloud)
library(tm)

dataTFIDF = read.csv("E:/KULIAH/TUGAS AKHIR LJ/FULL TWEET/DATA UNTUK MANDIRI TANPA REPLIES/tfidfmandiriunigram_posnomandiri.csv",header=TRUE)
names(dataTFIDF)
head(dataTFIDF)
jumlahdata = rowSums(dataTFIDF)
gabTFIDF = data.frame(dataTFIDF, jumlahdata);gabTFIDF
m = ncol(gabTFIDF);m
TFIDFman = gabTFIDF[which(gabTFIDF$jumlah!=0),-468];TFIDFman

a = sort(colSums(TFIDFman), decreasing = TRUE);a
b = data.frame(word = names(a), freq=a);b
head(b)
win.graph()
wordcloud(words = b$word, freq=b$freq, scale = c(4,0,4), random_color = FALSE,
          random.order = FALSE, rot.per = 0.25, min_freq = 3, max.words = Inf, 
          colors = brewer.pal(8, "Dark2"))

