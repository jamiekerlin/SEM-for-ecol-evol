### SEM For Ecology and Evolution Chapter 3- Local Estimation######
### Notes created by Jamie Kerlin following along with code in book
### Created on 2021-02-15
####################################################################

### Load libraries #################################################
library(tidyverse)
library(piecewiseSEM)

### Work through random dataset ####################################
set.seed(100)
n <- 100
x1 <- rchisq(n,7)
mu2 <- 10*x1/(5+x1)
x2 <- rnorm(n, mu2, 1)
x2[x2 <= 0] <- 0.1
x3 <- rpois(n, lambda = (0.5*x2))
x4 <- rpois(n, lambda = (0.5*x2))
p.x5 <- exp(-0.5*x3 + 0.5*x4)/(1 + exp(-0.5*x3 + 0.5*x4))
x5 <- rbinom(n, size = 1, prob = p.x5)
dat2 <- data.frame(x1 = x1, x2 = x2, x3 = x3, x4 = x4, x5 = x5)

### Fit a strictly linear SEM assuming multivariate normality #####
shipley_psem2 <- psem(
  lm(x2 ~ x1, data = dat2),
  lm(x3 ~ x2, data = dat2),
  lm(x4 ~ x2, data = dat2),
  lm(x5 ~ x3 + x4, data = dat2)
)
