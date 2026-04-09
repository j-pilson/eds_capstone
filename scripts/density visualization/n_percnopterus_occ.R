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

n_percnopterus_path <-

# load data

n_percnopterus <- vroom(n_percnopterus_path, col_names = TRUE)

# examine data

names(n_percnopterus)

# make data more manageable

np_slim <- n_percnopterus %>%
  select(gbifID, occurrenceID, kingdom, phylum, class, order, family, genus, species, countryCode, decimalLatitude, decimalLongitude, eventDate, month, year, basisOfRecord, license, issue)

# filter out observations where scientific name was not determined

np_slim <- np_slim %>%
  filter(!is.na(species))

# filter out observations where date is not recorded

np_slim <- np_slim %>%
  filter(!is.na(eventDate))

# examine missingness

gg_miss_upset(np_slim)

# filter out observations that have certain associated issues

np_noissue <- np_slim %>% 
  filter(!npepl('RECORDED_DATE_INVALID|CONTINENT_COORDINATE_MISMATCH|TAXON_MATCH_HIGHERRANK', issue))

# export path - update for your file locations

np_noissue_path <- 

# export cleaned csvs

write_csv(np_noissue, np_noissue_path, append = FALSE, col_names = TRUE)

# split observations by month to help with spatial analysis

np_jan <- np_noissue %>%
  filter(month == "1")

np_feb <- np_noissue %>%
  filter(month == "2")

np_mar <- np_noissue %>%
  filter(month == "3")

np_apr <- np_noissue %>%
  filter(month == "4")

np_may <- np_noissue %>%
  filter(month == "5")

np_jun <- np_noissue %>%
  filter(month == "6")

np_jul <- np_noissue %>%
  filter(month == "7")

np_aug <- np_noissue %>%
  filter(month == "8")

np_sep <- np_noissue %>%
  filter(month == "9")

np_oct <- np_noissue %>%
  filter(month == "10")

np_nov <- np_noissue %>%
  filter(month == "11")

np_dec <- np_noissue %>%
  filter(month == "12")

# export path - update for your file locations

np_jan_path <- 
  
np_feb_path <- 
  
np_mar_path <- 
  
np_apr_path <- 
  
np_may_path <- 
  
np_jun_path <- 
  
np_jul_path <- 
  
np_aug_path <- 
  
np_sep_path <- 
  
np_oct_path <- 
  
np_nov_path <- 
  
np_dec_path <- 
  
# write month csvs
  
write_csv(np_jan, np_jan_path, append = FALSE, col_names = TRUE)

write_csv(np_feb, np_feb_path, append = FALSE, col_names = TRUE)

write_csv(np_mar, np_mar_path, append = FALSE, col_names = TRUE)

write_csv(np_apr, np_apr_path, append = FALSE, col_names = TRUE)

write_csv(np_may, np_may_path, append = FALSE, col_names = TRUE)

write_csv(np_jun, np_jun_path, append = FALSE, col_names = TRUE)

write_csv(np_jul, np_jul_path, append = FALSE, col_names = TRUE)

write_csv(np_aug, np_aug_path, append = FALSE, col_names = TRUE)

write_csv(np_sep, np_sep_path, append = FALSE, col_names = TRUE)

write_csv(np_oct, np_oct_path, append = FALSE, col_names = TRUE)

write_csv(np_nov, np_nov_path, append = FALSE, col_names = TRUE)

write_csv(np_dec, np_dec_path, append = FALSE, col_names = TRUE)
