# Purposes:
#   Calculate what percentage of each species’ African range is protected
#   Calculate what percentage of each species’ African range is managed by African Parks
#   Calculate what percentage of each species’ protected range w/in Africa is managed by African Parks

# install packages

if (!require(dplyr)) install.packages("dplyr")
if (!require(readr)) install.packages("readr")
if (!require(tidyverse)) install.packages("tidyverse")
if (!require(sf)) install.packages("sf")

#load packages

library(dplyr)          
library(readr)       
library(tidyverse) 
library(sf)

### Ardeola idae analysis

# data paths - update for your file locations

ai_af_path <- 

ai_wdpa_path <- 
  
ai_ap_path <- 

# load data
  
ai_af <- st_read(ai_af_path)
  
ai_wdpa <- st_read(ai_wdpa_path)
  
ai_ap <- st_read(ai_ap_path)

# percent of African range protected

ai_af_area <- ai_af$area

ai_wdpa_area <- ai_wdpa$area

ai_af_per <- round((ai_wdpa_area/ai_af_area)*100, digits = 2)

# percent of African range managed by African Parks

ai_ap_area <- ai_ap$area

ai_ap_per <- round((ai_ap_area/ai_af_area)*100, digits = 2)

# percent of protected range w/in Africa managed by African Parks

ai_ap_wdpa_per <- round((ai_ap_area/ai_wdpa_area)*100, digits = 2)

# compile data

ai_percentages <- data.frame(
  stat = c("Habitat Protected w/in Africa", "Habitat Protected w/in Africa managed by AP", "Protected Land Used w/in Africa Managed by AP"),
  percent = c(ai_af_per, ai_ap_per, ai_ap_wdpa_per)
)


### Aquila nipalensis analysis

# data paths - update for your file locations

an_af_path <- 
  
an_wdpa_path <- 
  
an_ap_path <- 
  
# load data
  
an_af <- st_read(an_af_path)

an_wdpa <- st_read(an_wdpa_path)

an_ap <- st_read(an_ap_path)

# percent of African range protected

an_af_area <- an_af$area

an_wdpa_area <- an_wdpa$area

an_af_per <- round((an_wdpa_area/an_af_area)*100, digits = 2)

# percent of African range managed by African Parks

an_ap_area <- an_ap$area

an_ap_per <- round((an_ap_area/an_af_area)*100, digits = 2)

# percent of protected range w/in Africa managed by African Parks

an_ap_wdpa_per <- round((an_ap_area/an_wdpa_area)*100, digits = 2)

# compile data

an_percentages <- data.frame(
  stat = c("Habitat Protected w/in Africa", "Habitat Protected w/in Africa managed by AP", "Protected Land Used w/in Africa Managed by AP"),
  percent = c(an_af_per, an_ap_per, an_ap_wdpa_per)
)



### Gyps rueppellii analysis

# data paths - update for your file locations

gr_af_path <- 
  
gr_wdpa_path <- 
  
gr_ap_path <- 
  
# load data
  
gr_af <- st_read(gr_af_path)

gr_wdpa <- st_read(gr_wdpa_path)

gr_ap <- st_read(gr_ap_path)

# percent of African range protected

gr_af_area <- gr_af$area

gr_wdpa_area <- gr_wdpa$area

gr_af_per <- round((gr_wdpa_area/gr_af_area)*100, digits = 2)

# percent of African range managed by African Parks

gr_ap_area <- gr_ap$area

gr_ap_per <- round((gr_ap_area/gr_af_area)*100, digits = 2)

# percent of protected range w/in Africa managed by African Parks

gr_ap_wdpa_per <- round((gr_ap_area/gr_wdpa_area)*100, digits = 2)

# compile data

gr_percentages <- data.frame(
  stat = c("Habitat Protected w/in Africa", "Habitat Protected w/in Africa managed by AP", "Protected Land Used w/in Africa Managed by AP"),
  percent = c(gr_af_per, gr_ap_per, gr_ap_wdpa_per)
)


### Neophron percnopterus analysis

# data paths - update for your file locations

np_af_path <- 
  
np_wdpa_path <- 
  
np_ap_path <- 
  
# load data
  
np_af <- st_read(np_af_path)

np_wdpa <- st_read(np_wdpa_path)

np_ap <- st_read(np_ap_path)

# percent of African range protected

np_af_area <- np_af$area

np_wdpa_area <- np_wdpa$area

np_af_per <- round((np_wdpa_area/np_af_area)*100, digits = 2)

# percent of African range managed by African Parks

np_ap_area <- np_ap$area

np_ap_per <- round((np_ap_area/np_af_area)*100, digits = 2)

# percent of protected range w/in Africa managed by African Parks

np_ap_wdpa_per <- round((np_ap_area/np_wdpa_area)*100, digits = 2)

# compile data

np_percentages <- data.frame(
  stat = c("Habitat Protected w/in Africa", "Habitat Protected w/in Africa managed by AP", "Protected Land Used w/in Africa Managed by AP"),
  percent = c(np_af_per, np_ap_per, np_ap_wdpa_per)
)
