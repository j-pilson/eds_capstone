# install packages

if (!require(sf)) install.packages("sf")
if (!require(ggplot2)) install.packages("ggplot2")
if (!require(terra)) install.packages("terra")
if (!require(tidyterra)) install.packages("tidyterra")
if (!require(knitr)) install.packages("knitr")
if (!require(dplyr)) install.packages("dplyr")
if (!require(tidyverse)) install.packages("tidyverse")
if (!require(vroom)) install.packages("vroom")

# load packages

library(sf)          
library(ggplot2)
library(terra)       
library(tidyterra)   
library(knitr)       
library(dplyr)
library(tidyverse)
library(vroom)

# load data

ap_birds <- vroom("C://Users//cpils//Documents//EDS Cert//Capstone//Data//Processed Data//GBIF Bird Data//Bird Observations shp//ap_bird_obs.csv")
iucn <- vroom("C://Users//cpils//Documents//EDS Cert//Capstone//Data//Raw Data//IUCN Bird List//assessments.csv")

# generate a list of AP bird species

ap_birds_str <- unique(ap_birds$species)

# turn string into a list

ap_birds_list <- as.list(strsplit(ap_birds_str, " "))

# turn list into a df

ap_birds_df <- do.call(rbind.data.frame, ap_birds_list)

ap_birds_df$species <- paste(ap_birds_df$c..Passer....Corvus....Ploceus....Corvus....Lamprotornis....Ammomanopsis..., ap_birds_df$c..melanurus....albus....xanthops....capensis....nitens....grayi...)

birds_ap <- ap_birds_df %>%
  select(species)

# add iucn & habitat info

iucn_slim <- iucn %>%
  select(scientificName, habitat, redlistCategory)

birds_join <- left_join(birds_ap, iucn_slim, by = c("species" = "scientificName"))

# export list

write_csv(birds_ap, "C://Users//cpils//Documents//EDS Cert//Capstone//Data//Processed Data//GBIF Bird Data//Bird Observations shp//ap_bird_list.csv")


