library(DAAG)
attach(ais)

##############################
## PART A
##############################

# Histogram
hist(wt, freq=F)

# Use the rug plot
# Create a set of tick marks along the base of a plot
rug(jitter(wt), col = "red")

# Add a normal probability density function
lines(seq(40, 120, by=.5), 
      dnorm(seq(40, 120, by=.5),
      mean(wt), sd(wt)), 
      lwd=2, col="blue")

# Add an estimated probability density function
lines(density(wt), lwd = 2, col="green")


##############################
## PART B
##############################

# Stem and leaf plot
stem(wt)


##############################
## PART C
##############################

# QQ plot
qqnorm(wt)
qqline(wt, col="red", lwd=2)


##############################
## PART D
##############################

# Empirical cumulative distribution function
Fn  <- ecdf(wt)
plot(Fn, main="Empirical cumulative distribution function")
curve(pnorm, add=TRUE, col="gray", lwd=2)


# Empirical cumulative distribution function
plot(ecdf(wt), 
     main = "Empirical cumulative distribution function", 
     cex=0.5)

##############################
## PART E
##############################

# Joint distribution
plot(wt, ht, pch=c(4, 16)[sex], lwd=2,
     col=c("black", "blue")[sex],
     main="Joint distribution per group",
     xlab = "Weight",
     ylab = "Height")
legend(x="topleft", 
       legend=c("Female", "Male"),
       pch=c(4, 16), 
       col=c("black", "blue"))


##############################
## PART F
##############################

# Using transparency
plot(wt, ht, pch=16, col=rgb(0, 0, 1, 0.3))

# Smooth scatter plot
smoothScatter(wt, ht, bandwidth=4)


# Hexagonal 2-D binning
library(hexbin)
res <- hexbin(wt, ht, xbins=20)
plot(res)
