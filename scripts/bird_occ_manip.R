# install packages

if (!require(sf)) install.packages("sf")
if (!require(ggplot2)) install.packages("ggplot2")
if (!require(terra)) install.packages("terra")
if (!require(tidyterra)) install.packages("tidyterra")
if (!require(knitr)) install.packages("knitr")
if (!require(dplyr)) install.packages("dplyr")
if (!require(tidyverse)) install.packages("tidyverse")
if (!require(vroom)) install.packages("vroom")
if (!require(arrow)) install.packages("arrow")


# load packages

library(sf)          
library(ggplot2)     
library(dplyr)       
library(terra)       
library(tidyterra)   
library(knitr)       
library(dplyr)
library(tidyverse)
library(vroom)
library(arrow)

# load data

af_birds <- vroom("C://Users//cpils//Documents//EDS Cert//Capstone//Data//Raw Data//Bird Occurences - AP Countries//0014526-260108223611665.csv")

# examine data

names(af_birds)

# make data more manageable

birds_slim <- af_birds %>%
  select(gbifID, occurrenceID, kingdom, phylum, class, order, family, genus, species, countryCode, decimalLatitude, decimalLongitude, eventDate, month, year, basisOfRecord, license, issue)

# filter out observations where scientific name was not determined

birds_slim <- birds_slim %>%
  filter(!is.na(species))

# filter out observations where date is not recorded

birds_slim <- birds_slim %>%
  filter(!is.na(eventDate))

# filter out observations that have certain associated issues

issue_na <- birds_slim %>% 
  filter(!grepl('TAXON_MATCH_FUZZY|RECORDED_DATE_INVALID|CONTINENT_COORDINATE_MISMATCH|TAXON_MATCH_HIGHERRANK', issue))

# export cleaned csv

write_csv(birds_slim, "C://Users//cpils//Documents//EDS Cert//Capstone//Data//Processed Data//GBIF Bird Data//birds_slim.csv", append = FALSE, col_names = TRUE)


  
  
  
  
  