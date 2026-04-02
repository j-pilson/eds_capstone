# install packages

if (!require(dplyr)) install.packages("dplyr")
if (!require(readr)) install.packages("readr")
if (!require(tidyverse)) install.packages("tidyverse")
if (!require(vroom)) install.packages("vroom")

#load packages

library(dplyr)          
library(readr)       
library(tidyverse) 
library(vroom)

# load data

ap_birds <- vroom("C:/Users/cpils/Documents/EDS Cert/Capstone/Final Data Sources/AP Bird Occurences - csv (processed)/apbirds_obs.csv")
bird_life <- vroom("C:/Users/cpils/Documents/EDS Cert/Capstone/Final Data Sources/BirdLife Species List (raw)/species-filter-results.csv")

# examine data for number of occurrences for each species 

occ_tab <- table(ap_birds$species)
occ_split <- write.table(occ_tab, file = "", append = FALSE, quote = TRUE, sep = " ",
            eol = "/n", na = "NA", dec = ".", row.names = TRUE,
            col.names = TRUE, qmethod = c("escape", "double"),
            fileEncoding = "")
occ_df <- data.frame(occ_tab)
occ_df <- rename(occ_df, species = Var1)

# remove species with only one occurrence

ap_list <- subset(occ_df, Freq>1)

# add BirdLife data

birdlife_slim <- bird_life %>%
  select("Scientific name", "Family", "RL Category", "Migratory status", "Current population trend")

birds_join <- left_join(ap_list, birdlife_slim, by = c("species" = "Scientific name"))

# rename columns

final_birds <- birds_join %>%
  rename("commonName" = "Common name") %>%
  rename("scientificName" = "species") %>%
  rename("redlistCategory" = "RL Category") %>%
  rename("migratoryStatus" = "Migratory status") %>%
  rename("popTrend" = "Current population trend")

# reorder columns

final_birds <- final_birds %>%
  relocate("commonName") %>%
  relocate("Freq", .after = "popTrend")

# export list

write_csv(final_birds, "C:/Users/cpils/Documents/EDS Cert/Capstone/Final Data Sources/AP Birds List (processed)/ap_bird_list.csv")

