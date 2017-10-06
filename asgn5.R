# Read the file
mydf <- read.csv("~/creditdata.csv")

# Let's have a quick glance at the data
head(mydf,5)
# Data structure
str(mydf)
# Data summary
summary(mydf)
# Find missing value
sum(is.na(mydf))
# There is no missing values in our data
mydf[mydf==""]  <- NA
mydfnm <- na.omit(mydf)
# The two data frames are the same

# make sure some variables are set as factors
mydfnm$rating <- as.factor(mydfnm$rating)
mydfnm$homeown <- as.factor(mydfnm$homeown)
mydfnm$mstat <- as.factor(mydfnm$mstat)
mydfnm$rcds <- as.factor(mydfnm$rcds)
mydfnm$jtype <- as.factor(mydfnm$jtype)

# These discriptive analyses were used to 
# 1,help us know more about data;
# 2,find flaws of data(missing values and distributions that need to be fixed)
# 3,identify and modify the data type(for example factor variables)

# We have 4446 rows, but we only need half of them to fit out model
# So seperate te data into 2 parts, training and test data
mytraining<-mydfnm[c(1:2223),]
mytest<-mydfnm[c(2224:4446),]

# Fit a logistc model
# All rows and columns in training data are used
mylogic<-glm(rating ~ ., data=mytraining, family = binomial)

# Predict
logictest <- predict(mylogic, mytest, type = "response")

# Summary of our model
summary(mylogic)
# Technically, a significant variable should have at least a significance level of 0.05
# So, homeownother, homeownparents, homeownpriv, homeownrent, loandurn, age,
# mstatseparated and mstatsingle are not significant.
# The rest variables are significant at least in a 0.05 level.
# The significant variables include experience, homeownowner, mstatmarried, mstatwidow, 
# rcdsyes_rec, jtypefreelance, jtypeothers, jtypepartime, explvl, inc, assts,debt, 
# loanamount and purchprice.

# Fit a decision tree
library(rpart)
library(rpart.plot)

model.tree <- rpart(rating ~ ., mytraining, method = "class")
rpart.plot(model.tree, type=1, extra = 102)

# Predict
ptree <- predict(model.tree, mytest, type = "prob")[,2]

'''
A decision tree is a decision support tool that uses a tree-like graph or model to predict possible outcomes from costs(variables).
In a decision tree we seperate our data into several data segamentations.
Everytime we do segmentation, we split a certain branch of data into 2 part.
In each segment, the target variable tends to be more "pure" (show a certain response mode, for example more positive target or more negative target).
In our case, we have 2223 records that majority of them(1595) are "good" rating. So, we predict this data section as "good".
Then, we split the data into two branches by experience, including 15% and 85% of the data respectively.
The branch with experience<1.5 has 1462 "good" of out the 1896 records.
The branch with experience<2.5 has 194 "bad" of out the 327 records.
To some extent, the two new branches are significant more pure in "good" rate and "bad" rate respectively.
similarly, we get more branches in our model to get more "pure" data section.
We can predict the test data by judging which section should the data be classified to.
The prediction can be made within the whole section performance.
'''


# The way to define a better model is to do cross validation.
# In our case, the test data are used to do cross validation.
# I will draw 2 ROC curve to see the model performance.

library(ROCR)
# ROC and AUC for logistic model
plogic <- predict(mylogic, mytest, type="response")
prlogic <- prediction(plogic, mytest$rating)
prflogic <- performance(prlogic, measure = "tpr", x.measure = "fpr")
plot(prflogic)
abline(a=0, b= 1)
auc <- performance(prlogic, measure = "auc")
auc <- auc@y.values[[1]]
auc

# ROC and AUC for decision tree model
ptree <- predict(model.tree, mytest, type = "prob")[,2]
prtree <- prediction(ptree, mytest$rating)
prftree <- performance(prtree, measure = "tpr", x.measure = "fpr")
plot(prftree)
abline(a=0, b= 1)
auc2 <- performance(prtree, measure = "auc")
auc2 <- auc2@y.values[[1]]
auc2

# From the auc, we can define logistic model a better model.
# We can plot them together.
plot(prflogic)
plot(prftree,add=TRUE)
abline(a=0, b= 1)


'''
In our diagnosis,
sensitivity is the ability of the model to correctly predict those "good", "high" or targeted values (true positive rate).
For example,  in medical cases, sensitivity means the ability to correctly identify the sick people as having the condition.
Specificity is the ability of the model to correctly predict those "bad", "low" or untargeted values (true negative rate).
For example,  in medical cases, sensitivity means the ability to correctly identify the healthy people as not having the condition.
ROC curve is a way to plot the model performance.
The line in the middle represent a fifty-fifty random predict model.
Our model is also drawn above the middle line(if it performs no worse than a random prediction)
AUC is an abbrevation for area under the curve. For the middle line, the auc is 0.5.
The bigger the auc, the better the model.
So, in our case, the logistic model is a better model.
'''

'''
In this case, we built two models to predict credit rating, one is logistic model and another one is decision tree model.
Luckily, the data is clean and it didn't waste to much of our time.
The logistic model performs better than the decision tree model. So, we will only focus on logistic model.
13 variables were used to fit the model. We got 14 factors(including different levels of a certain factor) that have significant influence in rating.
With all these factors, we can use the model to calculate the possibility of good rating and bad rating.
With that, we are able to predict the credit rating with high confidence interval.
'''