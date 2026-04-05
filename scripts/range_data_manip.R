# Purpose:
#   Extract the range data for study species from the BirdLife Range dataset

# install packages

if (!require(dplyr)) install.packages("dplyr")
if (!require(sf)) install.packages("sf")
if (!require(ggplot2)) install.packages("ggplot2")

# load packages

library(dplyr)
library(sf)
library(ggplot2)

# Data path - update for your file locations

range_path <- 

# load data

range <- st_read(range_path)

# remove range entries that have a presence value of 1 or 2 (Extant or Probably Extant)

range_slim <- range %>%
  filter_out(presence == 4 | presence == 5 | presence == 6)

# select needed species

aquila_nipalensis_seasonal <- range_slim[range_slim$sci_name %in% c('Aquila nipalensis'), ]

ardeola_idae_seasonal <- range_slim[range_slim$sci_name %in% c('Ardeola idae'), ]

gyps_rueppelli_seasonal <- range_slim[range_slim$sci_name %in% c('Gyps rueppelli'), ] # this species' scientific name is written as both Gyps rueppelli and Gyps rueppellii -- the BirdLife dataset uses Gyps rueppelli

neophron_percnopterus_seasonal <- range_slim[range_slim$sci_name %in% c('Neophron percnopterus'), ]

# export paths - update for your file locations

an_path <- 

ai_path <- 
  
gr_path <- 
  
np_path <- 

# write new shapefiles

st_write(aquila_nipalensis_seasonal, an_path)

st_write(ardeola_idae_seasonal, ai_path)

st_write(gyps_rueppelli_seasonal, gr_path)

st_write(neophron_percnopterus_seasonal, np_path)
