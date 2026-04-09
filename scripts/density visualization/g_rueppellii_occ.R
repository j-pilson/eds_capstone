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

g_rueppellii_path <-

# load data

g_rueppellii <- vroom(g_rueppellii_path, col_names = TRUE)

# examine data

names(g_rueppellii)

# make data more manageable

gr_slim <- g_rueppellii %>%
  select(gbifID, occurrenceID, kingdom, phylum, class, order, family, genus, species, countryCode, decimalLatitude, decimalLongitude, eventDate, month, year, basisOfRecord, license, issue)

# filter out observations where scientific name was not determined

gr_slim <- gr_slim %>%
  filter(!is.na(species))

# filter out observations where date is not recorded

gr_slim <- gr_slim %>%
  filter(!is.na(eventDate))

# examine missingness

gg_miss_upset(gr_slim)

# filter out observations that have certain associated issues

gr_noissue <- gr_slim %>% 
  filter(!grepl('RECORDED_DATE_INVALID|CONTINENT_COORDINATE_MISMATCH|TAXON_MATCH_HIGHERRANK', issue))

# export path - update for your file locations

gr_noissue_path <- 

# export cleaned csvs

write_csv(gr_noissue, gr_noissue_path, append = FALSE, col_names = TRUE)

# split observations by month to help with spatial analysis

gr_jan <- gr_noissue %>%
  filter(month == "1")

gr_feb <- gr_noissue %>%
  filter(month == "2")

gr_mar <- gr_noissue %>%
  filter(month == "3")

gr_apr <- gr_noissue %>%
  filter(month == "4")

gr_may <- gr_noissue %>%
  filter(month == "5")

gr_jun <- gr_noissue %>%
  filter(month == "6")

gr_jul <- gr_noissue %>%
  filter(month == "7")

gr_aug <- gr_noissue %>%
  filter(month == "8")

gr_sep <- gr_noissue %>%
  filter(month == "9")

gr_oct <- gr_noissue %>%
  filter(month == "10")

gr_nov <- gr_noissue %>%
  filter(month == "11")

gr_dec <- gr_noissue %>%
  filter(month == "12")

# export path - update for your file locations

gr_jan_path <- 
  
gr_feb_path <- 
  
gr_mar_path <- 
  
gr_apr_path <- 
  
gr_may_path <- 
  
gr_jun_path <- 
  
gr_jul_path <- 
  
gr_aug_path <- 
  
gr_sep_path <- 
  
gr_oct_path <- 
  
gr_nov_path <- 
  
gr_dec_path <- 

# write month csvs

write_csv(gr_jan, gr_jan_path, append = FALSE, col_names = TRUE)

write_csv(gr_feb, gr_feb_path, append = FALSE, col_names = TRUE)

write_csv(gr_mar, gr_mar_path, append = FALSE, col_names = TRUE)

write_csv(gr_apr, gr_apr_path, append = FALSE, col_names = TRUE)

write_csv(gr_may, gr_may_path, append = FALSE, col_names = TRUE)

write_csv(gr_jun, gr_jun_path, append = FALSE, col_names = TRUE)

write_csv(gr_jul, gr_jul_path, append = FALSE, col_names = TRUE)

write_csv(gr_aug, gr_aug_path, append = FALSE, col_names = TRUE)

write_csv(gr_sep, gr_sep_path, append = FALSE, col_names = TRUE)

write_csv(gr_oct, gr_oct_path, append = FALSE, col_names = TRUE)

write_csv(gr_nov, gr_nov_path, append = FALSE, col_names = TRUE)

write_csv(gr_dec, gr_dec_path, append = FALSE, col_names = TRUE)
