### Load libraries #################################################
library(tidyverse)
library(piecewiseSEM)


+### Model outline #################################################
# disturbance -> neighborhood -> growth
# disturbance -> coral growth 

### Fit a strictly linear SEM assuming multivariate normality #####
shipley_psem2 <- psem(
  lm(neighborhood ~ disturbance, data = photoquad),
  lm(growth ~ neighborhood, data = dat2),
  lm(growth ~ disturbance, data = dat2))
  
  #but these aren't through lm function bc doing gam

#Disturbance- disturbance presence/absence, disturbance type
#Neighborhood effects- density, competition, percent cover
