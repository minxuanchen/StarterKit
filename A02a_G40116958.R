
#read csv file in my laptop
#if csv stored in default directory, use:
#mydf<-read.csv("quizscores.csv",header=T,sep = ",")
mydf<-read.csv("C:/Users/Administrator/Desktop/quizscores.csv",header=T,sep = ",")

#choose first 20 rows
mydfb <-mydf[1:20,]

#choose the row whose Sex is M and Section is B
mydfc <-subset(mydf,Sex =="M"&Section=="B")

#choose the row whose Sex is F and Degree is MBA
mydfd <-subset(mydf,Sex=="F"&Degree=="MBA")

#choose the row whose Sex is M and Degree is MS
#Then, choose columns from Quiz1 to Quiz6
mydfe <-subset(mydf,Sex=="M"&Degree=="MS",Quiz1:Quiz6)

#choose the row whose Sex is F, Degree is MS and Section is C
#Then, choose columns from Quiz1 and Quiz3, use c() to bind the parameter
mydff <-subset(mydf,Sex=="F"&Degree=="MS"&Section=="C",c(Quiz1,Quiz3))
