# install packages

if (!require(dplyr)) install.packages("dplyr")
if (!require(terra)) install.packages("terra")
if (!require(tidyterra)) install.packages("tidyterra")
if (!require(readr)) install.packages("readr")
if (!require(tidyverse)) install.packages("tidyverse")
if (!require(vroom)) install.packages("vroom")
if (!require(ggplot2)) install.packages("ggplot2")
if (!require(naniar)) install.packages("naniar")

#load packages

library(dplyr)          
library(terra)     
library(tidyterra)       
library(readr)        
library(tidyverse) 
library(vroom)
library(ggplot2)
library(naniar)

# load data

af_birds <- vroom("C:/Users/cpils/Documents/EDS Cert/Capstone/Final Data Sources/Bird Occurences - AP Countries (raw)/0014526-260108223611665.csv")

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

# examine missingness

gg_miss_upset(birds_slim)

# create and export csv with only the 'issue' column to be processed in python

birds_issue <- birds_slim %>%
  select(issue)

write_csv(birds_issue, "C:/Users/cpils/Documents/EDS Cert/Capstone/Final Data Sources/Bird Occurences - AP Countries (processed)/birds_issue.csv", append = FALSE, col_names = TRUE)

# filter out observations that have certain associated issues

issue_na <- birds_slim %>% 
  filter(!grepl('TAXON_MATCH_FUZZY|RECORDED_DATE_INVALID|CONTINENT_COORDINATE_MISMATCH|TAXON_MATCH_HIGHERRANK', issue))

# export cleaned csv

write_csv(birds_slim, "C:/Users/cpils/Documents/EDS Cert/Capstone/Final Data Sources/Bird Occurences - AP Countries (processed)/birds_slim.csv", append = FALSE, col_names = TRUE)


