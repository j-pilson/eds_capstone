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

a_idae_path <- 

# load data

a_idae <- vroom(a_idae_path, col_names = TRUE)

# examine data

names(a_idae)

# make data more manageable

ai_slim <- a_idae %>%
  select(gbifID, occurrenceID, kingdom, phylum, class, order, family, genus, species, countryCode, decimalLatitude, decimalLongitude, eventDate, month, year, basisOfRecord, license, issue)

# filter out observations where scientific name was not determined

ai_slim <- ai_slim %>%
  filter(!is.na(species))

# filter out observations where date is not recorded

ai_slim <- ai_slim %>%
  filter(!is.na(eventDate))

# examine missingness

gg_miss_upset(ai_slim)

# filter out observations that have certain associated issues

ai_noissue <- ai_slim %>% 
  filter(!grepl('RECORDED_DATE_INVALID|CONTINENT_COORDINATE_MISMATCH|TAXON_MATCH_HIGHERRANK', issue))

# export path - update for your file locations

ai_noissue_path <- "C:/Users/cpils/Documents/EDS Cert/Capstone/script test/ai_seasonal.csv"

# export cleaned csvs

write_csv(ai_noissue, ai_noissue_path, append = FALSE, col_names = TRUE)

# split observations by month to help with spatial analysis

ai_jan <- ai_noissue %>%
  filter(month == "1")

ai_feb <- ai_noissue %>%
  filter(month == "2")

ai_mar <- ai_noissue %>%
  filter(month == "3")

ai_apr <- ai_noissue %>%
  filter(month == "4")

ai_may <- ai_noissue %>%
  filter(month == "5")

ai_jun <- ai_noissue %>%
  filter(month == "6")

ai_jul <- ai_noissue %>%
  filter(month == "7")

ai_aug <- ai_noissue %>%
  filter(month == "8")

ai_sep <- ai_noissue %>%
  filter(month == "9")

ai_oct <- ai_noissue %>%
  filter(month == "10")

ai_nov <- ai_noissue %>%
  filter(month == "11")

ai_dec <- ai_noissue %>%
  filter(month == "12")

# export path - update for your file locations

ai_jan_path <- 

ai_feb_path <- 

ai_mar_path <- 

ai_apr_path <- 

ai_may_path <- 

ai_jun_path <- 

ai_jul_path <- 

ai_aug_path <- 

ai_sep_path <- 

ai_oct_path <- 

ai_nov_path <- 

ai_dec_path <- 

# write month csvs

write_csv(ai_jan, ai_jan_path, append = FALSE, col_names = TRUE)

write_csv(ai_feb, ai_feb_path, append = FALSE, col_names = TRUE)

write_csv(ai_mar, ai_mar_path, append = FALSE, col_names = TRUE)

write_csv(ai_apr, ai_apr_path, append = FALSE, col_names = TRUE)

write_csv(ai_may, ai_may_path, append = FALSE, col_names = TRUE)

write_csv(ai_jun, ai_jun_path, append = FALSE, col_names = TRUE)

write_csv(ai_jul, ai_jul_path, append = FALSE, col_names = TRUE)

write_csv(ai_aug, ai_aug_path, append = FALSE, col_names = TRUE)

write_csv(ai_sep, ai_sep_path, append = FALSE, col_names = TRUE)

write_csv(ai_oct, ai_oct_path, append = FALSE, col_names = TRUE)

write_csv(ai_nov, ai_nov_path, append = FALSE, col_names = TRUE)

write_csv(ai_dec, ai_dec_path, append = FALSE, col_names = TRUE)
