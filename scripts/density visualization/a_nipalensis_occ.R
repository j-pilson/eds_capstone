# install packages

if (!require(dplyr)) install.packages("dplyr")
if (!require(vroom)) install.packages
if (!require(naniar)) install.packages("naniar")
if (!require(readr)) install.packages("readr")

# load packages

library(dplyr)
library(vroom)
library(naniar)
library(readr)

# data path - update for your file locations

a_nipalensis_path <-

# load data

a_nipalensis <- vroom(a_nipalensis_path, col_names = TRUE)

# examine data

names(a_nipalensis)

# make data more manageable

an_slim <- a_nipalensis %>%
  select(gbifID, occurrenceID, kingdom, phylum, class, order, family, genus, species, countryCode, decimalLatitude, decimalLongitude, eventDate, month, year, basisOfRecord, license, issue)

# filter out observations where scientific name was not determined

an_slim <- an_slim %>%
  filter(!is.na(species))

# filter out observations where date is not recorded

an_slim <- an_slim %>%
  filter(!is.na(eventDate))

# examine missingness

gg_miss_upset(an_slim)

# filter out observations that have certain associated issues

an_noissue <- an_slim %>% 
  filter(!grepl('RECORDED_DATE_INVALID|CONTINENT_COORDINATE_MISMATCH|TAXON_MATCH_HIGHERRANK', issue))

# export path - update for your file locations

an_noissue_path <- 

# export cleaned csvs

write_csv(an_noissue, an_noissue_path, append = FALSE, col_names = TRUE)

# split observations by month to help with spatial analysis

an_jan <- an_noissue %>%
  filter(month == "1")

an_feb <- an_noissue %>%
  filter(month == "2")

an_mar <- an_noissue %>%
  filter(month == "3")

an_apr <- an_noissue %>%
  filter(month == "4")

an_may <- an_noissue %>%
  filter(month == "5")

an_jun <- an_noissue %>%
  filter(month == "6")

an_jul <- an_noissue %>%
  filter(month == "7")

an_aug <- an_noissue %>%
  filter(month == "8")

an_sep <- an_noissue %>%
  filter(month == "9")

an_oct <- an_noissue %>%
  filter(month == "10")

an_nov <- an_noissue %>%
  filter(month == "11")

an_dec <- an_noissue %>%
  filter(month == "12")

# export path - update for your file locations

an_jan_path <- 
  
an_feb_path <- 
  
an_mar_path <- 
  
an_apr_path <- 
  
an_may_path <- 
  
an_jun_path <- 
  
an_jul_path <- 
  
an_aug_path <- 
  
an_sep_path <- 
  
an_oct_path <- 
  
an_nov_path <- 
  
an_dec_path <- 
  
# write month csvs
  
write_csv(an_jan, an_jan_path, append = FALSE, col_names = TRUE)

write_csv(an_feb, an_feb_path, append = FALSE, col_names = TRUE)

write_csv(an_mar, an_mar_path, append = FALSE, col_names = TRUE)

write_csv(an_apr, an_apr_path, append = FALSE, col_names = TRUE)

write_csv(an_may, an_may_path, append = FALSE, col_names = TRUE)

write_csv(an_jun, an_jun_path, append = FALSE, col_names = TRUE)

write_csv(an_jul, an_jul_path, append = FALSE, col_names = TRUE)

write_csv(an_aug, an_aug_path, append = FALSE, col_names = TRUE)

write_csv(an_sep, an_sep_path, append = FALSE, col_names = TRUE)

write_csv(an_oct, an_oct_path, append = FALSE, col_names = TRUE)

write_csv(an_nov, an_nov_path, append = FALSE, col_names = TRUE)

write_csv(an_dec, an_dec_path, append = FALSE, col_names = TRUE)