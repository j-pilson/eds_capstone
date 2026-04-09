# purposes:
#   Create a list of all recorded bird species that occur in AP
#   Add migration status, IUCN status, and common names to the list of AP birds

# install packages

if (!require(dplyr)) install.packages("dplyr")
if (!require(readr)) install.packages("readr")
if (!require(tidyverse)) install.packages("tidyverse")
if (!require(vroom)) install.packages("vroom")

# load packages

library(dplyr)          
library(readr)       
library(tidyverse) 
library(vroom)

# Paths - update for your file locations

ap_birds_path <- 
  
bird_life_path <- 

# load data

ap_birds <- vroom(ap_birds_path)
bird_life <- vroom(bird_life_path)

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
  select("Common name", "Scientific name", "Family", "RL Category", "Migratory status", "Current population trend")

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

# export path - update for your file locations

final_birds_path <- 

# export list

write_csv(final_birds, final_birds_path)
