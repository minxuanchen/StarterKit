# P(inf|-) = P(-|inf) * P(inf)/[P(-|inf)*P(inf) + P(-|not inf)*P(not inf)]
inf<-seq(from = 0 , to = 1, by=0.0005)
pinf<-c()
for (i in inf) {
  p<- 0.027*i/(0.027*i+0.995*(1-i))
  pinf<-append(pinf,p)
}
plot(y =pinf,x = inf, ylab="P(inf|-)", xlab="P(inf)", type = "l",col="blue",lwd=2)

# plot when P(inf)>0.9
inf2<-seq(from = 0.9 , to = 1, by=0.0005)
pinf2<-c()
for (i in inf2) {
  p<- 0.027*i/(0.027*i+0.995*(1-i))
  pinf2<-append(pinf2,p)
}
plot(y =pinf2,x = inf2, ylab="P(inf|-)", xlab="P(inf)", type = "l",col="blue",lwd=2)
