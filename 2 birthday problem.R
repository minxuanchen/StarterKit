# k is the class size
# p is the probability that at least two people in a group have the same birthday
# p = 1-P(365,k)/(365^k)
# p <- 1- (factorial(365)/factorial(k))/(365^k)
# factorial(365) would cause warning "value out of range"
# so we calculate permutation with loops

p<-c()
for(k in 1:100){
  permutation <- 1
  for(n in (366-k):365){
    permutation <- permutation*n
  }
  p1 <- 1- permutation/(365^k)
  p<- append(p,p1)
}
p
plot(p,xlab="group size",ylab="probability")
