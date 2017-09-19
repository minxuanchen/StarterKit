
#read csv file in my laptop
#if csv stored in default directory, use:
#mydf<-read.csv("quizscores.csv",header=T,sep = ",")
mydf<-read.csv("C:/Users/Administrator/Desktop/quizscores.csv",header=T,sep = ",")

#choose the row whose Section is B
#Then, choose columns from Quiz1 to Quiz6
mymatb <-subset(mydf,Section=="B",Quiz1:Quiz6)

#choose the row whose Section is C
#Then, choose columns from Quiz1 to Quiz6
mymatc <-subset(mydf,Section=="C",Quiz1:Quiz6)

#use "apply" function to apply the "mean" function to each column 
apply(mymatb,2,mean)
apply(mymatc,2,mean)

#define a function that output the mean and the standard deviation
myAnalysis<-function(x){c(mean(x),sd(x))}
#use "apply" function to apply the function we defined to each column
apply(mymatb,2,myAnalysis)
apply(mymatc,2,myAnalysis)
#Section B performs better in Quiz 1,3,5 and 6 
#Section C performs better in Quiz 2 and 4
#In terms of SD, I didn't find significant different performance of Section B or C