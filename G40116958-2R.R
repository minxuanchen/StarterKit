
library(tidyr)
library(dplyr)

mycereal <- read.csv("cereal.csv",header = TRUE,sep=",")

mysummary<-function(dataframe){
  library(tidyr)
  library(dplyr)
  mydf<-head( dataframe[order(dataframe$rating),]
                  %>%  top_n(5,rating), 5)
  print("average calories is")
  print(round(mean(mydf$calories),2))
  print(", average protain is")
  print(round(mean(mydf$protein),2))
  print(", and average fat is")
  print(round(mean(mydf$fat),2))
}


dfq2 <- read.csv("cereal.csv",header = TRUE,sep=",")

mysummary(dfq2)
