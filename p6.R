# Code for p6.R

get_char_count <- function(inputstring) {

  myname_split <- strsplit(myname, '')[[1]]  # This is the interesting part
  
  vows <- 0
  cons <- 0
  for(eachchar in myname_split) {
    if (tolower(eachchar) %in% c("a", "e", "i", "o", "u")) {
      vows <- vows + 1
    }
    else {
      cons <- cons + 1
    }
  }
  
  answer <- list(con=cons, vow=vows)
  return(answer)
  
}
  

# The main scripty starts here  
myname <- readline("Please enter your name: ")
vc <- get_char_count(myname)
print(paste("Number of consonants =", vc["con"]))
print(paste("Number of vowels =", vc["vow"]))
chenminxuan<-"fat pig"




