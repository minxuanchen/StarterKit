library(ggplot2)
library(reshape2)

x<-seq(-5,15,0.1)

f1<- function(x){
  y=-1+0.5*x
  d1 <- data.frame(x=x,y=y) 
  return(d1)
}

f2<- function(x){
  y=6-x
  d2 <- data.frame(x=x,y=y) 
  return(d2)
}

f3<- function(x){
  y=4
  d3 <- data.frame(x=x,y=y) 
  return(d3)
}

f4<- function(x){
  y=0*x
  d4 <- data.frame(x=x,y=y) 
  return(d4)
}

f5<- function(x){
  y=0*x
  d5 <- data.frame(x=y,y=x) 
  return(d5)
}

d1<-f1(x)
d2<-f2(x)
d3<-f3(x)
d4<-f4(x)
d5<-f5(x)

d<-cbind(x,d1$y,d2$y,d3$y,d4$y)
colnames(d)=c("x","y1","y2","y3","y4")
d<-as.data.frame(d)
dlong <- melt(d, id="x")

p<-ggplot()
p<-p+geom_line(data=dlong,aes(x=x, y=value, colour=variable))
p<-p+geom_vline(xintercept = 0,color="blue")
p<-p+geom_text(label="xxxxx",aes(1,1))
p<-p+xlab("z2")+ylab("z1")
p

g<-ggplot()
g<-g+geom_line(data=d,aes(x=x, y=y1,color="red"))+geom_text(label="-2z1+z2<=2",aes(7,1.5))
g<-g+geom_line(data=d,aes(x=x, y=y2,color="yellow"))+geom_text(label="z1+z2<=6",aes(2.5,5))
g<-g+geom_line(data=d,aes(x=x, y=y3,color="blue"))+geom_text(label="z1<=4",aes(-1,3.7))
g<-g+geom_line(data=d,aes(x=x, y=y4,color="orange"))+geom_text(label="z1>=0",aes(-1,0.3))
g<-g+geom_line(data=d5,aes(x=x, y=y,color="green"))+geom_text(label="z2>=0",aes(0.8,-1.5))
g<-g+geom_ribbon(data=subset(d, 0 <= x & x <= 2),aes(x=x,ymin=y3,ymax=y4), fill="grey", alpha="0.5")
g<-g+geom_ribbon(data=subset(d, 2 <= x & x <= 14/3),aes(x=x,ymin=y1,ymax=y2), fill="grey", alpha="0.5")
g<-g+coord_cartesian(xlim=c(-1.5,8),ylim=c(-1.5,6))
g<-g+xlab("z2")+ylab("z1")
g<-g+theme(legend.position='none')
g


ftar<- function(x){
  y=-1/3*x+4+2/3
  dtar <- data.frame(x=x,y=y) 
  return(dtar)
}

dtar<-ftar(x)

g<-g+geom_line(data=dtar,aes(x=x, y=y,color="purple"))+geom_text(label="3z1+z2",aes(5.3,3.2))
g

ggsave("plot.png", width = 5, height = 5)
