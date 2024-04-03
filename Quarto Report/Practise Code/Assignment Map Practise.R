#install packages
install.packages("gapminder")
install.packages("tidyverse")
install.packages("ggplot2")

#view libraries
library(ggplot2)
library(tidyverse)
library(gapminder)

#read in the data
indicator1 <- read.csv(file = "C:/Users/aisli/OneDrive/Documents/College/Data Analytics/Quarto Report/unicef_indicator_1 (2).csv")
metadata <- read.csv(file = "C:/Users/aisli/OneDrive/Documents/College/Data Analytics/Quarto Report/unicef_metadata (2).csv")
View(indicator1)
View(metadata)

#rename collumn name 
colnames(indicator1)[colnames(indicator1) == "country"] <- "region"
colnames(metadata)[colnames(metadata) == "country"] <- "region"

colnames(indicator1)[colnames(indicator1) == "time_period"] <- "year"
colnames(indicator1)[colnames(indicator1) == "obs_value"] <- "no.deprivations"


#attempting map using ggplot
mapdata <- map_data("world")
View(mapdata)

#join data information
mapdata <- left_join(mapdata, indicator1, by="region")
view(mapdata)

#creating a map 1
map1<-ggplot(mapdata, aes( x = long, y = lat, group=group)) + 
  geom_polygon(aes(fill=no.deprivations), color = "black")
map1

#map practise 2
ggplot(data = mapdata) +
  aes(x = long, y = lat, group = group, fill = no.deprivations) +
  geom_polygon() +
  scale_fill_gradient(low = "yellow", high = "red", na.value = "grey") +
  labs(
    title = "Differences between countries and average number of deprivations suffered by children",
    subtitle = "Countries in grey have no data due to a mismatch with their names",
    caption = "Source: R package {gapminder}",
    x = "Longitude",
    y = "Latitude",
    fill = "no.deprivations"
  ) +
  theme_bw()