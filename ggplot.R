# Slide 10
install.packages("ggplot2")
library(ggplot2)


# Slide 11
p <- ggplot(df)
# or
p <- ggplot(df, aes(args))


# Slide 12
x1 <- c(seq(1:7))
y1 <- x1^2
df1 <- data.frame(x1,y1)

x2 <- c(seq(1, 13, by = 2))
y2 <- x2^1.5
df2 <- data.frame(x2,y2)

# library(ggplot2) # is you have not yet loaded ggplo2

g <- ggplot(df1)
print(g)

g <- g + geom_line(aes(x=x1,y=y1))
print(g)

g <- g + geom_line(aes(x=x2,y=y2))
print(g)


# Slide 13
mypath <- "http://home.gwu.edu/~kanungo/files/HaveFunWithR/"
myfile <- "IntroductionToR.csv"
fn <- paste(mypath,myfile,sep = "")
mydata <- read.csv(fn)

head(mydata, 3)

p <- ggplot(mydata)
p + geom_bar(aes(Dept))

p <- ggplot(mydata)
p + aes(Dept) + geom_bar(color="red", fill="blue")


# Slide 14
breaks <- pretty(range(mydata$PULast),
                 n = nclass.FD(mydata$PULast),
                 min.n = 1)
bwidth <- breaks[2]-breaks[1]


p + aes(PULast) + geom_histogram(binwidth=bwidth,fill="white",color="black") 

p + aes(PULast) + geom_histogram(binwidth=2,fill="white",color="black")


# Slide 15
p + geom_point(aes(x=PU, y=UseMins))
p + geom_point(aes(x=PU, y=UseMins,
                   color=Sex))
p + geom_point(aes(x=PU, y=UseMins,
                   color=Sex),
               size = 4)
p + geom_point(aes(x=PU, y=UseMins,
                   shape=Dept))
p + geom_point(aes(x=PU, y=UseMins,
                   shape=Dept),
               size = 4)


# Slide 16
p %+% subset(mydata, AgeYrs>35) +
  geom_point(aes(x=PU,
                 y=UseMins,
                 color=Sex))


# Slide 17
p + geom_point(aes(x=PEOU,y=PU)) + facet_grid(Dept~ .)

p + geom_point(aes(x=PEOU,y=PU)) + facet_grid(Dept~ Sex)


# Slide 18
p + aes(x = Dept, y = PU) + 
  geom_boxplot(fill = "grey80",
               colour = "blue") +
  scale_x_discrete() +
  xlab("Department") +
  ylab("Perceived usefulness")


# Slide 19
p <- ggplot(mydata) +
  aes(x = PEOU,
      y = PU) +
  geom_point()
print(p)

p <- ggplot(mydata) +
  aes(x = PEOU,
      y = PU) +
  geom_point(size = 3,
             color='red')
print(p)


# Slide 20
p + stat_smooth(method = "lm",
                formula = y ~ x,
                size = 1)
p + stat_smooth(method = "loess",
                formula = y ~ x,
                size = 1)
p + stat_smooth(method = "lm",
                formula = y ~ poly(x, 2),
                size = 1)
p + stat_smooth(method = "lm",
                formula = y ~ x + I(x^2),
                size = 1)


# Slide 21
p + 
  stat_smooth(method = "lm",
              formula = y ~ poly(x, 2),
              size = 1) +
  facet_grid(Dept~ .)

