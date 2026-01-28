# install packages

if (!require(dplyr)) install.packages("dplyr")
if (!require(terra)) install.packages("terra")
if (!require(tidyterra)) install.packages("tidyterra")
if (!require(sf)) install.packages("sf")
if (!require(tidyverse)) install.packages("tidyverse")
if (!require(naniar)) install.packages("naniar")
if (!require(readr)) install.packages("readr")
if (!require(ggplot2)) install.packages("ggplot2")


#load packages

library(dplyr)          
library(terra)     
library(tidyterra)       
library(sf)        
library(tidyverse)       
library(naniar)
library(readr)
library(ggplot2)

# load Africa data

af0 <- st_read("C:/Users/cpils/Documents/EDS Cert/Capstone/Final Data Sources/WDPA (raw)/Africa/WDPA_WDOECM_Jan2026_Public_AF_shp_0/WDPA_WDOECM_Jan2026_Public_AF_shp-polygons.shp")

af1 <- st_read("C:/Users/cpils/Documents/EDS Cert/Capstone/Final Data Sources/WDPA (raw)/Africa/WDPA_WDOECM_Jan2026_Public_AF_shp_1/WDPA_WDOECM_Jan2026_Public_AF_shp-polygons.shp")

af2 <- st_read("C:/Users/cpils/Documents/EDS Cert/Capstone/Final Data Sources/WDPA (raw)/Africa/WDPA_WDOECM_Jan2026_Public_AF_shp_2/WDPA_WDOECM_Jan2026_Public_AF_shp-polygons.shp")

# load Europe data

eu0 <- st_read("C:/Users/cpils/Documents/EDS Cert/Capstone/Final Data Sources/WDPA (raw)/Europe/WDPA_WDOECM_Jan2026_Public_AS_shp_0/WDPA_WDOECM_Jan2026_Public_AS_shp-polygons.shp")

eu1 <- st_read("C:/Users/cpils/Documents/EDS Cert/Capstone/Final Data Sources/WDPA (raw)/Europe/WDPA_WDOECM_Jan2026_Public_AS_shp_1/WDPA_WDOECM_Jan2026_Public_AS_shp-polygons.shp")

eu2 <- st_read("C:/Users/cpils/Documents/EDS Cert/Capstone/Final Data Sources/WDPA (raw)/Europe/WDPA_WDOECM_Jan2026_Public_AS_shp_2/WDPA_WDOECM_Jan2026_Public_AS_shp-polygons.shp")

# load Asia & Pacific data

asp0 <- st_read("C:/Users/cpils/Documents/EDS Cert/Capstone/Final Data Sources/WDPA (raw)/Asia and Pacific/WDPA_WDOECM_Jan2026_Public_AS_shp_0/WDPA_WDOECM_Jan2026_Public_AS_shp-polygons.shp")

asp1 <- st_read("C:/Users/cpils/Documents/EDS Cert/Capstone/Final Data Sources/WDPA (raw)/Asia and Pacific/WDPA_WDOECM_Jan2026_Public_AS_shp_1/WDPA_WDOECM_Jan2026_Public_AS_shp-polygons.shp")

asp2 <- st_read("C:/Users/cpils/Documents/EDS Cert/Capstone/Final Data Sources/WDPA (raw)/Asia and Pacific/WDPA_WDOECM_Jan2026_Public_AS_shp_2/WDPA_WDOECM_Jan2026_Public_AS_shp-polygons.shp")

# investigate missingness

vis_miss(af0)

vis_miss(af1)

vis_miss(af2)

vis_miss(eu0)

vis_miss(eu1)

vis_miss(eu2)

vis_miss(asp0)

vis_miss(asp1)

vis_miss(asp2)

# filter for needed columns

af0_f <- af0 %>%
  select(SITE_ID, SITE_PID, SITE_TYPE, NAME_ENG, DESIG_ENG, DESIG_TYPE, REP_AREA, geometry)

af1_f <- af1 %>%
  select(SITE_ID, SITE_PID, SITE_TYPE, NAME_ENG, DESIG_ENG, DESIG_TYPE, REP_AREA, geometry)

af2_f <- af2 %>%
  select(SITE_ID, SITE_PID, SITE_TYPE, NAME_ENG, DESIG_ENG, DESIG_TYPE, REP_AREA, geometry)

eu0_f <- eu0 %>%
  select(SITE_ID, SITE_PID, SITE_TYPE, NAME_ENG, DESIG_ENG, DESIG_TYPE, REP_AREA, geometry)

eu1_f <- eu1 %>%
  select(SITE_ID, SITE_PID, SITE_TYPE, NAME_ENG, DESIG_ENG, DESIG_TYPE, REP_AREA, geometry)

eu2_f <- eu2 %>%
  select(SITE_ID, SITE_PID, SITE_TYPE, NAME_ENG, DESIG_ENG, DESIG_TYPE, REP_AREA, geometry)

asp0_f <- asp0 %>%
  select(SITE_ID, SITE_PID, SITE_TYPE, NAME_ENG, DESIG_ENG, DESIG_TYPE, REP_AREA, geometry)

asp1_f <- asp1 %>%
  select(SITE_ID, SITE_PID, SITE_TYPE, NAME_ENG, DESIG_ENG, DESIG_TYPE, REP_AREA, geometry)

asp2_f <- asp2 %>%
  select(SITE_ID, SITE_PID, SITE_TYPE, NAME_ENG, DESIG_ENG, DESIG_TYPE, REP_AREA, geometry)

# join all Africa shape files

af_all <- af0_f %>%
  bind_rows(af1_f) %>%
  bind_rows(af2_f)

# join all Europe shape files

eu_all <- eu0_f %>%
  bind_rows(eu1_f) %>%
  bind_rows(eu2_f)

# join all Asia & Pacific shape files

asp_all <- asp0_f %>%
  bind_rows(asp1_f) %>%
  bind_rows(asp2_f)

# join all shape files for Africa, Europe, Asia, & the Pacific

wdpa_all <- af_all %>%
  bind_rows(eu_all) %>%
  bind_rows(asp_all)

# select needed rows from Africa shape file

wdpa_ap <- af_all[af_all$SITE_ID %in% c('862', '2337', '555583110', '4106', '802', '1371', '555583108', '555781120', '555622048', '13704', '1083', '347', '1085', '1084', '1089', '2316', '2319', '33157', '1107', '2318', '9148', '555555585', '2253', '555781119', '12201', '641'), ]

# create export files

st_write(wdpa_all, "C:/Users/cpils/Documents/EDS Cert/Capstone/Final Data Sources/WDPA (processed)/wdpa_all.shp") #contains all of the WDPA areas in Africa, Europe, Asia, & the Pacific

st_write(af_all, "C:/Users/cpils/Documents/EDS Cert/Capstone/Final Data Sources/WDPA (processed)/wdpa_africa.shp") #contains all of the WDPA areas in Africa in one shape file

st_write(wdpa_ap, "C:/Users/cpils/Documents/EDS Cert/Capstone/Final Data Sources/WDPA (processed)/wdpa_ap.shp") #contains only the areas managed by African Parks



