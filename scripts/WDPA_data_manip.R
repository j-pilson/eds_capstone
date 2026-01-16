# install packages

if (!require(sf)) install.packages("sf")
if (!require(ggplot2)) install.packages("ggplot2")
if (!require(terra)) install.packages("terra")
if (!require(tidyterra)) install.packages("tidyterra")
if (!require(knitr)) install.packages("knitr")
if (!require(dplyr)) install.packages("dplyr")
if (!require(tidyverse)) install.packages("tidyverse")


#load packages

library(sf)          
library(ggplot2)     
library(dplyr)       
library(terra)       
library(tidyterra)   
library(knitr)       
library(dplyr)
library(tidyverse)

# load data

wdpa0 <- st_read("C://Users//cpils//Documents//EDS Cert//Capstone//Data//Raw Data//WDPA Africa//WDPA_WDOECM_Jan2026_Public_AF_shp_0//WDPA_WDOECM_Jan2026_Public_AF_shp-polygons.shp")

wdpa1 <- st_read("C://Users//cpils//Documents//EDS Cert//Capstone//Data//Raw Data//WDPA Africa//WDPA_WDOECM_Jan2026_Public_AF_shp_1//WDPA_WDOECM_Jan2026_Public_AF_shp-polygons.shp")

wdpa2 <- st_read("C://Users//cpils//Documents//EDS Cert//Capstone//Data//Raw Data//WDPA Africa//WDPA_WDOECM_Jan2026_Public_AF_shp_2//WDPA_WDOECM_Jan2026_Public_AF_shp-polygons.shp")

# filter for needed columns

wdpa0_f <- wdpa0 %>%
  select(SITE_ID, SITE_PID, SITE_TYPE, NAME_ENG, DESIG_ENG, DESIG_TYPE, REP_AREA, geometry)

wdpa1_f <- wdpa1 %>%
  select(SITE_ID, SITE_PID, SITE_TYPE, NAME_ENG, DESIG_ENG, DESIG_TYPE, REP_AREA, geometry)

wdpa2_f <- wdpa2 %>%
  select(SITE_ID, SITE_PID, SITE_TYPE, NAME_ENG, DESIG_ENG, DESIG_TYPE, REP_AREA, geometry)

# join all shape files

wdpa <- wdpa0_f %>%
  bind_rows(wdpa1_f) %>%
  bind_rows(wdpa2_f)

# round values in the REP_AREA column

round(wdpa$REP_AREA, digits = 3)

# select needed rows

wdpa_ap <- wdpa[wdpa$SITE_ID %in% c('862', '2337', '555583110', '4106', '802', '1371', '555583108', '555781120', '555622048', '13704', '1083', '347', '1085', '1084', '1089', '2316', '2319', '33157', '1107', '2318', '9148', '555555585', '2253', '555781119', '12201', '641'), ]

# create export files

st_write(wdpa, "wdpa_africa.shp") #contains all of the wdpa areas in Africa in one shape file

st_write(wdpa_ap, "wdpa_ap.shp") #contains only the areas managed by African Parks

