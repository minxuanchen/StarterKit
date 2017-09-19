
#read csv file in my laptop
#if csv stored in default directory, use:
#mydf<-read.csv("quizscores.csv",header=T,sep = ",")
mydf<-read.csv("C:/Users/Administrator/Desktop/quizscores.csv",header=T,sep = ",")

#use "table" function to tabulate Degree by Sex
tb<-table(mydf$Degree,mydf$Sex)
tb
#use subset to caculate the probability
PF=sum(tb[,"F"])/sum(tb)
PF
PM=sum(tb[,"M"])/sum(tb)
PM
PMandMBA=sum(tb[,"M"],tb["MBA","F"])/sum(tb)
PMandMBA
PFandMS=sum(tb[,"F"],tb["MS","M"])/sum(tb)
PFandMS
PFMBA=tb["MBA","F"]/sum(tb["MBA",])
PFMBA
PMSM=tb["MS","M"]/sum(tb[,"M"])
PMSM

#apply the mean function to all quizzes in a subset the only includes female
femalemean <-apply(subset(mydf,Sex=="F",select=Quiz1:Quiz6),2,mean)
femalemean
#apply the mean function to all quizzes in a subset the only includes male
malemean <-apply(subset(mydf,Sex=="M",select=Quiz1:Quiz6),2,mean)
malemean

#apply the mean function to all quizzes in a subset the only includes section A students
Amean <-apply(subset(mydf,Section=="A",select=Quiz1:Quiz6),2,mean)
Amean
#apply the mean function to all quizzes in a subset the only includes section B students
Bmean <-apply(subset(mydf,Section=="B",select=Quiz1:Quiz6),2,mean)
Bmean
#apply the mean function to all quizzes in a subset the only includes section C students
Cmean <-apply(subset(mydf,Section=="C",select=Quiz1:Quiz6),2,mean)
Cmean

#apply the mean function to all quizzes in a subset the only includes MBA students
MBAmean <-apply(subset(mydf,Degree=="MBA",select=Quiz1:Quiz6),2,mean)
MBAmean
#apply the mean function to all quizzes in a subset the only includes MS students
MSmean <-apply(subset(mydf,Degree=="MS",select=Quiz1:Quiz6),2,mean)
MSmean