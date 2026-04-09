# purpose:
    # compile geospatial data for protected land throughout the range of African migratory birds

# install packages

if (!require(dplyr)) install.packages("dplyr")
if (!require(sf)) install.packages("sf")

# load packages

library(dplyr)          
library(sf)   

# Africa Paths - update for your file locations

af0_path <- 

af1_path <- 

af2_path <- 

# load Africa data

af0 <- st_read(af0_path)

af1 <- st_read(af1_path)

af2 <- st_read(af2_path)

# Europe Paths - update for your file locations

eu0_path <- 

eu1_path <- 

eu2_path <- 

# load Europe data

eu0 <- st_read(eu0_path)

eu1 <- st_read(eu1_path)

eu2 <- st_read(eu2_path)

# Asia & Pacific Paths - update for your file locations

asp0_path <- 

asp1_path <- 

asp2_path <- 

# load Asia & Pacific data

asp0 <- st_read(asp0_path)

asp1 <- st_read(asp1_path)

asp2 <- st_read(asp2_path)

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

# select rows containing land managed by African Parks from Africa shape file

wdpa_ap <- af_all[af_all$SITE_ID %in% c('862', '2337', '555583110', '4106', '802', '1371', '555583108', '555781120', '555622048', '13704', '1083', '347', '1085', '1084', '1089', '2316', '2319', '33157', '1107', '2318', '9148', '555555585', '2253', '555781119', '12201', '641'), ]

# file save paths - update for your desired save location

wdpa_eu_path <- 

wdpa_asp_path <- 

wdpa_af_path <- 

wdpa_ap_path <- 

# create export files

st_write(eu_all, wdpa_eu_path) #contains all of the WDPA areas in Europe

st_write(asp_all, wdpa_asp_path) #contains all of the WDPA areas in Asia & the Pacific

st_write(af_all, wdpa_af_path) #contains all of the WDPA areas in Africa in one shape file

st_write(wdpa_ap, wdpa_ap_path) #contains only the areas managed by African Parks
