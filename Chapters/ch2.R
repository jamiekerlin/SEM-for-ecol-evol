### SEM For Ecology and Evolution Chapter 2- Global Estimation######
### Notes created by Jamie Kerlin following along with code in book
### Created on 2021-02-12
####################################################################

### 2.1 What is (Co)variance?######################################
x <- c(1, 2, 3, 4)
y <- c(2, 3, 4, 5)

#variance in x
sum((x - mean(x))^2)/(length(x) - 1) == var(x)

#variance in y
sum((y - mean(y))^2)/(length(y) - 1) == var(y)

#covariance
sum((x - mean(x)) * (y - mean(y))) / (length(x) - 1) == cov(x,y)

#Depends on magnitude of units, if units of x are much larger
#than y, the covariance will also be large
cov(x,y)

#increase units of x as example
x1 <- x * 1000
cov(x1, y)

#To fix this issue, standardize to have mean of 0 and var of 1
zx <- (x - mean(x))/sd(x)
zy <- (y - mean(y))/sd(y)

sum(zx * zy)/(length(zx) - 1) == cor(x,y)

### 2.2 Regression Coefficients ################################## 
#Unstandardized coefficients scaled by variance of predictor,
#Standardized variance scaled by ratio of standard devs of x and y
set.seed(111)

data <- data.frame(y1 = runif(100))

data$x1 <- data$y1 + runif(100)

unstd.model <- lm(y1 ~ x1, data)

#get unstandardized coefficient
summary(unstd.model)$coefficients[2, 1]

#now using covariance
(cov(data$y1, data$x1)/var(data$x))

#repeat with scaled data
std.model <- lm(y1 ~ x1, as.data.frame(apply(data, 2, scale)))

#get standardized coefficient
summary(std.model)$coefficients[2, 1]

#now using correlation
cor(data$y1, data$x1)

### Rule 2. ####################################################
data$y2 <- data$y1 + runif(100)






