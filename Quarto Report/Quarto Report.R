#install packages
install.packages("tidyverse")
install.packages("plotly")
library(tidyverse)
library(plotly)

#import data
indicator1 <- read_csv("College/Data Analytics/Quarto Report/unicef_indicator_1 (2).csv")
metadata <- read_csv("College/Data Analytics/Quarto Report/unicef_metadata (2).csv")

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
  geom_line() +
  labs(
    title = "Life Expectancy over the year shown by each sex",
  ) +
  theme_bw()
  
#time series with plotly format
timeseries_plot_1 <-data_join %>%
  ggplot()+
  aes(year, lifeExp, group = region) +
  geom_line()

ggplotly(timeseries_plot_1)

#time series 2
data_join %>%
  ggplot()+
  aes(year, GDP, group = region, color = lifeExp) +
  geom_line() +
  labs(
    title = "Life Expectancy over the year shown by each sex",
  ) +
  theme_bw()

#time series no.2 with plotly
timeseries_plot_2 <-data_join %>%
  ggplot()+
  aes(year, GDP, group = region) +
  geom_line()

ggplotly(timeseries_plot_2)

#time series no.3 
timeseries_plot3 <-data_join %>%
  ggplot()+
  aes(year, GDP, group = region, color = region) +
  geom_line() +
  guides(color ="none") 
  labs(
    title = "GDP per country over the years",
  ) +
  theme_bw()

ggplotly(timeseries_plot3)


#Scatterplots
ggplot(data_join) +
aes(GDP, lifeExp, color = region, size =  Population) +
geom_point(alpha = 0.2) +
  facet_wrap(~ sex) +
  scale_x_continuous(
    limits = c(0, 50000),
    breaks = c(20000, 40000), 
    labels = scales::unit_format(unit = "K", scale = 0.001)
    ) +
  labs(
    x = "GDP per Capita in USD", 
    y = "Life Expectancy",
    title = "Relationship between GDP per Capita and Life Expectancy in genders"
    ) +
  guides(color ="none", size ="none")+
  theme_classic() +
  theme(text = element_text(family = "arial"))

#Barchart practise
#practise bar chart 1 
ggplot(data = indicator1) +
  aes(x = year, y = deprivations, color = sex)
geom_point()

#practise bar chart 2 
indicator1 %>% 
  ggplot(aes(x = year, y = deprivations, color = sex)) +
  geom_point()

#practise bar chart 3
indicator1 %>% 
  filter(.by = sex) %>% 
  group_by(sex) %>% 
  ggplot(aes(year, deprivations, fill = sex)) +
  geom_col() +
  labs(
    x = "Year", 
    y = "Total number of Deprivations",
    title = "Total number of deprivations suffered through the years shown by gender"
  ) +
  guides(color ="none", size ="none")+
  theme_classic() +
  theme(
    text = element_text(family = "arial")
    ) +
  scale_fill_manual(values = c("pink", "blue", "yellow"))






