# (1)(b).
# p.d.f. plot for f(x)
x<-seq(-1,2,0.01)
y<-c()
n<-length(x)
for (i in 1:n){
  if (x[i]<1 & x[i]>0){
    y[i]=5*(x[i])^4
  }
  if (x[i]<=0){
    y[i]=0
  }
  if (x[i]>=1){
    y[i]=0
  }
}
plot(y~x,type="l")

# p.d.f. plot for f(y)
x<-seq(-1,2,0.01)
y<-c()
n<-length(x)
for (i in 1:n){
  if (x[i]<1 & x[i]>0){
    y[i]=7.5*(x[i])^2-7.5*(x[i])^4
  }
  if (x[i]<=0){
    y[i]=0
  }
  if (x[i]>=1){
    y[i]=0
  }
}
plot(y~x,type="l")

# (4)(a).
a= read.table("~/Service.csv",header=TRUE,sep=',')
service=a[,1]
hist(service,nclass=25,col='blue')
x=seq(0,2000,by=1)
rate=1/mean(service)
density=dexp(x,rate)
hist(service,nclass=25,col='blue',probability=TRUE)
lines(density,type='l',col='red',lwd=2)
# the estimate the parameter is rate
rate
# lambda = 0.003020491

# quantiles for service data
summary(service)
# quantiles for our model
# 1st 95.2 ; median 229.5 ; 3rd 459.0