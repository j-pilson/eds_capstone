# purposes:
#   Compile data of all bird occurrences (and their accompanying geospatial data) recorded on GBIF that fall within land managed by African Parks
#   Compile a list of all bird species that occur on land managed by African Parks

# install packages

if (!require(dplyr)) install.packages("dplyr")
if (!require(readr)) install.packages("readr")
if (!require(vroom)) install.packages("vroom")
if (!require(naniar)) install.packages("naniar")

# load packages

library(dplyr)          
library(readr)
library(vroom)
library(naniar)

# Paths - update for your file location

af_birds_path <- 

# load data

af_birds <- vroom(af_birds_path)

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

# file save path - update for your desired save location

birds_issue_path <- 

# export issues list csv

write_csv(birds_issue, birds_issue_path, append = FALSE, col_names = TRUE)

# filter out observations that have certain associated issues

issue_na <- birds_slim %>% 
  filter(!grepl('RECORDED_DATE_INVALID|CONTINENT_COORDINATE_MISMATCH|TAXON_MATCH_HIGHERRANK', issue))

# file save path - update for your desired save location

issue_na_path <- 

# export cleaned csv

write_csv(issue_na, issue_na_path, append = FALSE, col_names = TRUE)
