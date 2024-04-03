#read in the data
indicator1 <- read.csv(file = "C:/Users/aisli/OneDrive/Documents/College/Data Analytics/Quarto Report/unicef_indicator_1 (2).csv")
metadata <- read.csv(file = "C:/Users/aisli/OneDrive/Documents/College/Data Analytics/Quarto Report/unicef_metadata (2).csv")
View(indicator1)
View(metadata)

#install packages
install.packages("gapminder")
install.packages("tidyverse")
install.packages("ggplot2")

#view libraries
library(ggplot2)
library(tidyverse)
library(gapminder)

#rename collumn name 
colnames(indicator1)[colnames(indicator1) == "country"] <- "region"
colnames(metadata)[colnames(metadata) == "country"] <- "region"

colnames(indicator1)[colnames(indicator1) == "time_period"] <- "year"
colnames(indicator1)[colnames(indicator1) == "obs_value"] <- "no.deprivations"

#attempt scatterplot 1
ggplot(data = indicator1) +
  aes(x = year, y = no.deprivations, color=sex ) +
  geom_point()+
  guides(color ="none")

#combine data of both sets
metadata <- left_join(metadata, indicator1, by="region")
view(metadata)

#attempt scatterplot 2 
ggplot(data = mapdata) +
  aes(x = year
      , y = no.deprivations, color=sex ) +
  geom_point()+
  guides(color ="none")







