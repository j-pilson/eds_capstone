# Purpose:
#   calculate basic stats and create visualizations for the species that occur w/in African Parks

# install packages

if (!require(dplyr)) install.packages("dplyr")
if (!require(readr)) install.packages("readr")
if (!require(tidyverse)) install.packages("tidyverse")
if (!require(ggplot2)) install.packages("ggplot2")

#load packages

library(dplyr)          
library(readr)       
library(tidyverse) 
library(ggplot2)

# data paths - update for your file locations

bird_list_path <- 

# load data

bird_list <- read.csv(bird_list_path, header = TRUE)

# data analysis/visualization

sp_total = nrow(bird_list) # how many bird species occur in AP parks
print(c('Species Total:', sp_total))

# migration status analysis

migration <- as.data.frame(table(bird_list$migratoryStatus)) # how many species fall in each migration status category
migration <- rename(migration, mig_status = Var1, count = Freq)

print(migration)

mig_wide <- migration %>% 
  pivot_wider(names_from = mig_status, values_from = count)

colnames(mig_wide) <- c("alt_migrant", "full_migrant", "nomadic", "not_migrant", "unknown") #rename columns for ease of analysis

# limited migrants
sum(mig_wide$alt_migrant, mig_wide$nomadic)

print(migration) # reference for ease of df creation

mig_status <- data.frame(
  migration_status = c("Full Migrant", "Limited Migrant", "Not a Migrant"),
  count = c(262, 41, 851)
) # create df that will be easy to visualize

mig_status <- mig_status %>%
  mutate(percent = (count/sum(count)) * 100) %>% # add percentages to df
  mutate(percent = round(percent, digits = 2)) # round percentages

# visualize migratory status breakdowns

# bar plot
ggplot(mig_status, aes(x = migration_status, y = count, fill = migration_status)) +
  geom_bar(stat = "identity") +
  scale_fill_manual(values = c("Full Migrant" = "#76C48F", "Limited Migrant" = "#549168", "Not a Migrant" = "#2C5C3C")) +
  labs(title = "Migration Status of Bird Species in AP Parks",
       x = "Migration Status",
       y = "Number of Species") +
  theme_minimal() +
  theme(legend.position = "none")

# redlist status analysis

redlist <- as.data.frame(table(bird_list$redlistCategory)) # how many species fall in each redlist category
redlist <- rename(redlist, rl_status = Var1, count = Freq)

print(redlist)

redlist <- redlist %>%
  mutate(percent = (count/sum(count)) * 100) %>% # add percentages to df
  mutate(percent = round(percent, digits = 2)) # round percentages

# select rows with concern level near threatened and above

rl_con <- redlist[redlist$rl_status %in% c("CR", "EN", "NT", "VU"), ]

rl_con <- rl_con %>%
  mutate(percent = (count/sum(count)) * 100) %>% # add percentages to df
  mutate(percent = round(percent, digits = 2)) # round percentages

rl_con$rl_status2 <- factor(rl_con$rl_status, levels=c(c("NT", "VU", "EN", "CR")))
rl_con[order(rl_con$rl_status2),] #reorder rows by increasing level of concern

rl_simp <- data.frame(
  rl_status = c("Near Threatened", "Vulnerable", "Endangered", "Critically Endangered"),
  count = c(24, 25, 13, 4)) # create df that will be easy to visualize

# visualize redlist status breakdowns 

# bar plot for species with concern level near threatened and above

ggplot(rl_simp) +
  aes(x= factor(rl_status, levels = c("Near Threatened", "Vulnerable", "Endangered", "Critically Endangered")), y = count, fill = rl_status) +
  geom_bar(stat = "identity") +
  scale_fill_manual(values = c("Near Threatened" = "#A8F7C3", "Vulnerable" = "#76C48F", "Endangered" = "#549168", "Critically Endangered" = "#2C5C3C"))+
  labs(title = "Redlist Status of Bird Species in AP Parks",
       x = "Redlist Status",
       y = "Number of Species") +
  theme_minimal() +
  theme(legend.position = "none")

# redlist status breakdown for migratory species

mig_species <- bird_list %>%
  filter(migratoryStatus == "Full migrant") # select only migratory species

mig_redlist <- as.data.frame(table(mig_species$redlistCategory)) # how many species fall in each redlist category
mig_redlist <- rename(mig_redlist, rl_status = Var1, count = Freq)

mig_redlist <- mig_redlist %>%
  mutate(percent = (count/sum(count)) * 100) %>% # add percentages to df
  mutate(percent = round(percent, digits = 2)) # round percentages

# select rows with concern level near threatened and above

migrl_con <- mig_redlist[mig_redlist$rl_status %in% c("CR", "EN", "NT", "VU"), ]

migrl_con <- migrl_con %>%
  mutate(percent = (count/sum(count)) * 100) %>% # add percentages to df
  mutate(percent = round(percent, digits = 2)) # round percentages

migrl_con$rl_status2 <- factor(migrl_con$rl_status, levels=c(c("NT", "VU", "EN", "CR")))
migrl_con[order(migrl_con$rl_status2),] #reorder rows by increasing level of concern

migrl_simp <- data.frame(
  rl_status = c("Near Threatened", "Vulnerable", "Endangered", "Critically Endangered"),
  count = c(9, 10, 3, 1)) # create df that will be easy to visualize

# visualize redlist status breakdowns for migratory species

# bar plot for species with concern level near threatened and above

ggplot(migrl_simp) +
  aes(x= factor(rl_status, levels = c("Near Threatened", "Vulnerable", "Endangered", "Critically Endangered")), y = count, fill = rl_status) +
  geom_bar(stat = "identity") +
  scale_fill_manual(values = c("Near Threatened" = "#A8F7C3", "Vulnerable" = "#76C48F", "Endangered" = "#549168", "Critically Endangered" = "#2C5C3C"))+
  labs(title = "Redlist Status of Migratory Bird Species in AP Parks",
       x = "Redlist Status",
       y = "Number of Species") +
  theme_minimal() +
  theme(legend.position = "none")
