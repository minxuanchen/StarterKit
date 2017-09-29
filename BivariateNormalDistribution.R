library(mvtnorm) 
sigma.xx<-4 
sigma.yy<-1 
sigma.xy<-0 
sigma<-matrix(c(sigma.xx,sigma.xy,sigma.xy,sigma.yy),ncol=2) 
old.par<-par(mfrow=c(1,2)) 
x<-seq(-5,5,by=0.25) 
y<-x 
f<-function(x,y){ 
xy<-cbind(x,y) 
dmvnorm(xy,c(0,0),sigma) 
} 
z<-outer(x,y,f) 
persp(x,y,z,theta=30,phi=30,expand=0.5,col='lightblue',ltheta=120,shade=0.75)
contour(x,y,z,method='edge',xlab='x',ylab='y') 
par(old.par)

