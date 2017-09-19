# Code for p5.R

myname <- readline("Please enter your name: ")

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

print(paste("Number of consonants =", cons))
print(paste("Number of vowels =", vows))