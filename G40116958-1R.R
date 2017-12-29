
mybank <- read.csv("bank1.csv",header = TRUE,sep=",")
mybank<-subset(mybank,loan != "unknown" & default != "unknown")

mybank$loan<-factor(mybank$loan,labels=c(0,1),levels=c("no","yes"))
mybank$default<-factor(mybank$default,labels=c(0,1),levels=c("no","yes"))

mybank$y<-factor(mybank$y,labels=c(0,1),levels=c("no","yes"))

bank00<-subset(mybank,loan == "0" & default == "0")
bank01<-subset(mybank,loan == "0" & default == "1")
bank10<-subset(mybank,loan == "1" & default == "0")
bank11<-subset(mybank,loan == "1" & default == "1")

model00<-glm(formula = y ~ duration, family =binomial(link='logit'), data = bank00)
model01<-glm(formula = y ~ duration, family =binomial(link='logit'), data = bank01)
model10<-glm(formula = y ~ duration, family =binomial(link='logit'), data = bank10)
model11<-glm(formula = y ~ duration, family =binomial(link='logit'), data = bank11)

summary(model00)
summary(model01)
summary(model10)
summary(model11)

predict00<-predict(model00,data.frame(duration=bank00$duration),type='response')
predict01<-predict(model01,data.frame(duration=bank01$duration),type='response')
predict10<-predict(model10,data.frame(duration=bank10$duration),type='response')
predict11<-predict(model11,data.frame(duration=bank11$duration),type='response')

library(ggplot2)
plot00<-ggplot()+geom_point(aes(x=bank00$duration,y=bank00$y,color=predict00))
print(plot00)
plot01<-ggplot()+geom_point(aes(x=bank01$duration,y=bank01$y,color=predict01))
print(plot01)
plot10<-ggplot()+geom_point(aes(x=bank10$duration,y=bank10$y,color=predict10))
print(plot10)
plot11<-ggplot()+geom_point(aes(x=bank11$duration,y=bank11$y,color=predict11))
print(plot11)

library(ROCR)
p00 <- prediction(predict00, bank00$y)
auc <- performance(p00, measure = "auc")
auc <- auc@y.values[[1]]
auc
p01 <- prediction(predict01, bank01$y)
auc <- performance(p01, measure = "auc")
auc <- auc@y.values[[1]]
auc
p10 <- prediction(predict10, bank10$y)
auc <- performance(p10, measure = "auc")
auc <- auc@y.values[[1]]
auc
p11 <- prediction(predict11, bank11$y)
auc <- performance(p11, measure = "auc")
auc <- auc@y.values[[1]]
auc
