## File IO (slide 5)
test.csv <- read.csv("https://stats.idre.ucla.edu/stat/data/test.csv", 
                     header = TRUE)

# You will need to download that file to your local machie and read as csv
mycsv <- read.csv("/home/srk/Downloads/CardioGoodnessFit.csv", header = TRUE)


## Data structures (slide 2)
a <- 2
class(a)

b <- as.integer(a)
class(b)

3 < 5
c <- 3 < 5
class(c)

d <- "Mary"
class(d)



## Data structures (slide 3)
myvec1 <- c(1, 2, 3)
myvec2 <- c("f", "g", "l")
myvec3 <- c(1, 2, "t", "u")
myvec1
myvec2
myvec3
class(myvec1)
is.vector(myvec2)
# The 'c' stands for 'combine'

# If you want different data types in the same data structure, you use lists
mylst1 <- list(1, 2, 3)
mylst2 <- list("f", "g", "l")
mylst3 <- list(1, 2, "t", "u")
mylst1
mylst2
mylst3
class(mylst1)
is.vector(mylst2)  # Actually a list is a vector of mode "list"
is.list(mylst2)
mylst3 <- list(a=1, b=2, c="t", zzz="u")
mylst3["a"]
mylst3["zzz"]
mylst3[[1]]
mylst3[[4]]

# You already know what a data frame is; that is what you got when you read the csv file



## Data structures (slide 4)
myX <- seq(1:15)
myY <- sample(1:100, 15, replace=TRUE)
myZ <- myX * myY
mydf <- data.frame(myX, myY, myZ)
plot(myZ~myX)

# What is the difference now?
plot(mydf$myZ~mydf$myX)



## Basic coding in R
# These are provided as separate R files