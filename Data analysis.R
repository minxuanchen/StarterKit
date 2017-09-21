# Slide 3
# Which of these variables are continuous? Which are discrete? 
read.csv()
names(P02_11)
# - Except House, all variables are continuous (bedrooms and baths are ??)

# Create histograms for the appraised values and selling prices of 
# the houses. How are these two distributions similar? How are they different? 
hist(P02_11$`Appraised Value`)
hist(P02_11$`Selling Price`)

library(lattice)
histogram( ~ `Appraised Value` +`Selling Price` ,data = P02_11) 


# Find the maximum and minimum sizes (measured in square footage) 
# of all sample houses. 
min(P02_11$`Square Feet`)
max(P02_11$`Square Feet`)


# Find the house(s) at the 80th percentile of all sample houses with
# respect to appraised value. Find the house(s) at the 80th percentile
# of all sample houses with respect to selling price. 
quantile(P02_11$`Appraised Value`, c(.80)) 
quantile(P02_11$`Selling Price`, c(.80)) 


# What are the typical number of bedrooms and the typical number of
# bathrooms in this set of houses? How do you interpret the word "typical?" 
plot(table(P02_11$Bedrooms))
plot(table(P02_11$Bathrooms))


# Slide 5
# Load the mtcars dataset
data(mtcars)

# Assign data in mtcars to the variable d
d <- mtcars

# See the data
head(d)

# Make sure you understand which variables are continuous 
# and which ones are discrete


# Slide 6
# For the qualitative variables we will provide labels

# VS is coded as 0 or 1
# We want to attache val;ues as:
# 0 = V-engine, and 1 = straight engine
d$vslab <- factor(d$vs,
                  levels = c(0,1),
                  labels = c("V-engine", "straight engine")
)
# Now go and verify that you have added the labels

# am is coded as 0 or 1
# We want to attache val;ues as:
# 0 = automatic, and 1 = manual
d$amlab <- factor(d$am,
                  levels = c(0,1),
                  labels = c("automatic", "manual")
)


# Slide 7
# Two discrete variables
table(d$vslab,d$amlab)
plot(table(d$vslab,d$amlab), cex=1.5) 
# cex = 1.5 inceases the label font soize


# Slide 8
# DV is continuous, IV is discrete
plot(d$mpg~d$amlab)

library(lattice)
histogram( ~ d$mpg | d$amlab)


# Slide 9
# DV is continuous, IV is discrete
plot(d$disp~d$hp)
cor(d$disp,d$hp)

model <- lm(disp~hp, data=d)
plot(disp~hp, data=d)
abline(model)



# Slide 10

# DV is discrete, IV is continuous

# plot with horsepower on x-axis and V or straight engine (0 or 1) on y-axis
plot(vs~hp,data=d,
     xlab="Horse power (HP)",
     ylab="Probability of a straight engine")

# run a logistic regression model
vs.log = glm(vs ~ hp, 
             data=mtcars,
             family=binomial)

# draws a curve based on prediction from logistic regression model
curve(predict(vs.log,
              data.frame(hp=x),
              type="resp"),
      add=TRUE)

# optional: you could skip this; draws an invisible set of points of body size 
# survival based on a 'fit' to glm model. pch= changes type of dots.
points(d$hp,
       fitted(vs.log),
       pch=20,
       cex=1.5)

# To predict,
# Wrap the test parameter(s) inside a data frame newdata.
newdata = data.frame(hp=120)

# Now we apply the function predict to the generalized linear model vs.log along 
# with newdata. We will have to select response prediction type in order
# to obtain the predicted probability.
predict(vs.log, newdata, type="response")

# Answer: For an automobile with 120hp engine, the probability of it being fitted 
# with a straight engine is about 54%.


# Slide 12
### Many IVs
am.glm = glm(am ~ hp + wt,
             data=mtcars,
             family=binomial)
# We then wrap the test parameters inside a data frame newdata.
newdata = data.frame(hp=120, wt=2.8)

# Now we apply the function predict to the generalized linear model 
# am.glm along withnewdata. We will have to select response 
# prediction type in order to obtain the predicted probability.
predict(am.glm, newdata, type="response")


#Multivariate analysis

# scatterplot matrix 
splom(d[c(1,3,4,5,6)], 
      main="MTCARS Data")

