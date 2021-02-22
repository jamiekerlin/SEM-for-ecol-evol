### Load libraries #################################################
library(tidyverse)
library(piecewiseSEM)


+### Model outline #################################################
# disturbance -> neighborhood -> growth
# disturbance -> coral growth 

### Fit a strictly linear SEM assuming multivariate normality #####
my_psem <- psem(
  lm(neighborhood ~ disturbance, data = photoquad),
  lm(growth ~ neighborhood + disturbance, data = dat2))
  
  #but these aren't through lm function bc doing gam

#Disturbance- disturbance presence/absence, disturbance type
#Neighborhood effects- density, competition, percent cover

#Neighborhood effects
neighborhood_all <- gam(data, growth ~
                          s(density_con) +
                          s(density_het) +
                          s(number_comp) +
                          s(dist_nearest) +
                          s(percent_comp_con) +
                          s(percent_comp_het) +
                          s(percent_comp_mac) +
                          s(percent_comp_turf) +
                          s(area_con) +
                          s(area_het) +
                          s(area_mac) +
                          s(area_turf))

summary(neighborhood_all)

#SEM
my_psem <- psem(
  lm(neighborhood ~ disturbance, data = data),
  lm(growth ~ neighborhood + disturbance, data = data))

#Specifically

disturbance_neighborhood <- psem(
  lm(neighborhood ~ disturbance_presence + disturbance_type, data = data)
)
