a<- "abcdefg"
b<- strsplit(a,'')
as.pairlist(b)
for (eachchar in b){
  if (eachchar %in% c("c","d")){
    print ("CD")
  }
  else {print ("nono")}
}

