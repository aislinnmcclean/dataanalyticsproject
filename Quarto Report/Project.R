#install packages
install.packages("tidyverse")
install.packages("plotly")
library(tidyverse)
library(plotly)

#import data
indicator1 <- read_csv("unicef_indicator_1 (2).csv")
metadata <- read_csv("unicef_metadata (2).csv")

#join data
data_join <- full_join(metadata, indicator1)

#join data
data_join <- full_join(metadata, indicator1)

#install map data
map_world <- map_data("world")

#join data
data_join <- full_join(metadata, indicator1)

#install map data
map_world <- map_data("world")

#join map and data join
map_data_join <- full_join(data_join, map_world)

#map visualisation
ggplot(map_data_join) +
  aes(x = long, y = lat, group = group, fill = lifeExp) +
  geom_polygon()

#map visualisation 2 
data_join_1983 <- data_join %>%
  filter(year == 1983)

map_data_join_1983 <- full_join(data_join_1983, map_world)

ggplot(map_data_join_1983) +
  aes(x = long, y = lat, group = group, fill = lifeExp) +
  geom_polygon()

#edited map 
ggplot(data = map_data_join_1983) +
  aes(x = long, y = lat, group = group, fill = lifeExp) +
  geom_polygon() +
  scale_fill_gradient(low = "yellow", high = "red", na.value = "grey") +
  labs(
    title = "Life Expectancy in the year 1983",
    subtitle = "Countries in grey have no data due to a mismatch with their names",
    caption = "Source: R package {gapminder}",
    x = "Longitude",
    y = "Latitude",
    fill = "lifeExp"
  ) +
  theme_bw()


#map visualisation showing total population
data_join %>%
  filter(year == 1983) %>%
  full_join(map_world) %>%
  ggplot(aes(x = long, y = lat, group = group, fill = Population))+
  geom_polygon()

options(scipen = 999)

#version 2
data_join %>%
  filter(year == 1983) %>%
  full_join(map_world) %>%
  ggplot(aes(x = long, y = lat, group = group, fill = Population))+
  geom_polygon() +
  scale_fill_gradient(low = "yellow", high = "red", na.value = "grey") +
  labs(
    title = "Total Population in the year 1983",
    subtitle = "Countries in grey have no data due to a mismatch with their names",
    caption = "Source: R package {gapminder}",
    x = "Longitude",
    y = "Latitude",
    fill = "Population"
  ) +
  theme_bw()

options(scipen = 999)

#Time series visualisations
data_join %>%
  ggplot()+
  aes(year, lifeExp, group = region, color = sex) +
  geom_line()

timeseries_plot_1 <-data_join %>%
  ggplot()+
  aes(year, lifeExp, group = region, color = sex) +
  geom_line()

ggplotly(timeseries_plot_1)















