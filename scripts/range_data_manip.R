# install packages

if (!require(dplyr)) install.packages("dplyr")
if (!require(sf)) install.packages("sf")
if (!require(ggplot2)) install.packages("ggplot2")

# load packages

library(dplyr)
library(sf)
library(ggplot2)

# load data

range <- st_read("C:/Users/cpils/Documents/EDS Cert/Capstone/Final Data Sources/BirdLife Range Data (processed)/all_species_range.shp")

# remove range entries that have a presence value of 1 or 2 (Extant or Probably Extant)

range_slim <- range %>%
  filter(presence == 1 | presence == 2)

# select needed species

aquila_nipalensis_seasonal <- range_slim[range_slim$sci_name %in% c('Aquila nipalensis'), ]

ardeola_idae_seasonal <- range_slim[range_slim$sci_name %in% c('Ardeola idae'), ]

gyps_rueppelli_seasonal <- range_slim[range_slim$sci_name %in% c('Gyps rueppelli'), ]

neophron_percnopterus_seasonal <- range_slim[range_slim$sci_name %in% c('Neophron percnopterus'), ]

# write new shapefiles

st_write(aquila_nipalensis_seasonal, "C:/Users/cpils/Documents/EDS Cert/Capstone/Final Data Sources/BirdLife Range Data (processed)/aquila_nipalensis_seasonal.shp")

st_write(ardeola_idae_seasonal, "C:/Users/cpils/Documents/EDS Cert/Capstone/Final Data Sources/BirdLife Range Data (processed)/ardeola_idae_seasonal.shp")

st_write(gyps_rueppelli_seasonal, "C:/Users/cpils/Documents/EDS Cert/Capstone/Final Data Sources/BirdLife Range Data (processed)/gyps_rueppelli_seasonal.shp")

st_write(neophron_percnopterus_seasonal, "C:/Users/cpils/Documents/EDS Cert/Capstone/Final Data Sources/BirdLife Range Data (processed)/neophron_percnopterus_seasonal.shp")
