#download pckages 
install.packages("tidyverse")
install.packages("plotly")
library(tidyverse)
library(plotly)


#import data
indicator1 <- read_csv("College/Data Analytics/Quarto Report/unicef_indicator_1 (2).csv")
metadata <- read_csv("College/Data Analytics/Quarto Report/unicef_metadata (2).csv")


#join data
data_join <- full_join(metadata, indicator1)

#install map data
map_world <- map_data("world")
view(map_data)

#join both data together
map_data_join <- full_join(data_join, map_world)

#VISUALISATION:MAP
#basic map visualisation 1
ggplot(map_data_join) +
  aes(x = long, y = lat, group = group, fill = lifeExp) +
  geom_polygon()

#basic map visualisation 2
data_join_1983 <- data_join %>%
  filter(year == 1983)

map_data_join_1983 <- full_join(data_join_1983, map_world)

ggplot(map_data_join_1983) +
  aes(x = long, y = lat, group = group, fill = lifeExp) +
  geom_polygon()

#basic map visualisation 3
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

#basic map visualisation 4
data_join %>%
  filter(year == 1983) %>%
  full_join(map_world) %>%
  ggplot(aes(x = long, y = lat, group = group, fill = Population))+
  geom_polygon()

options(scipen = 999)

#final map visualisation 
data_join %>%
  filter(year == 1983) %>%
  full_join(map_world) %>%
  ggplot(aes(x = long, y = lat, group = group, fill = Population))+
  geom_polygon() +
  scale_fill_gradient(low = "yellow", high = "red", na.value = "grey") +
  labs(
    title = "Total Population in 1983 across the world",
    subtitle = "Countries in grey have no data due to a mismatch with their names",
    caption = "Source: R package {gapminder}",
    x = "",
    y = "",
    fill = "Population"
  ) +
  theme_bw() +
  theme(text = element_text(family = "serif"))


options(scipen = 999)

#VISUALISATION: TIMESERIES
#basic timeseries visualisation 1
data_join %>%
  ggplot()+
  aes(year, lifeExp, group = region, color = continent) +
  geom_line() +
  labs(
    title = "Life Expectancy across the years",
  ) +
  theme_bw()

#basic timeseries visualisation 2
timeseries_plot_1 <-data_join %>%
  ggplot()+
  aes(year, lifeExp, group = region, color = continent) +
  geom_line()

ggplotly(timeseries_plot_1)

#basic time series visualisation 3
data_join %>%
  ggplot()+
  aes(year, lifeExp, group = region, color = continent) +
  geom_line() +
  labs(
    title = "Life Expectancy over the year shown by each sex",
  ) +
  theme_bw()

timeseries_plot_2 <-data_join %>%
  ggplot()+
  aes(year, lifeExp, group = region, color = continent) +
  geom_line()

ggplotly(timeseries_plot_2)

#final time series visualisation
timeseries_plot3 <-data_join %>%
  ggplot()+
  aes(year, GDP, group = region, color = continent) +
  geom_line() +
labs(
  title = "Life Expectancy over the years",
) +
  theme_bw()
ggplotly(timeseries_plot3)

#VISUALISATION:SCATTERPLOT
#final scatterplot visualisation 
ggplot(data_join) +
  aes(GDP, lifeExp, color = continent, size = Population) +
  geom_point(alpha = 0.2) +
  facet_wrap(~sex, nrow = 1) +
  scale_x_continuous(
    limits = c(0, 50000), 
    breaks = c(20000, 40000),
    labels = scales::unit_format(unit = "K", scale = 0001)
  ) +
  labs(
    x = "GDP per Capita in USD",
    y = "Life Expectancy",
    title = "Evolution of relationship between Life Expectancy and GDP in gender"
  ) +
  guides(color = "none", size = "none") +
  theme_classic() +
  theme(text = element_text(family = "serif"))

#VISUALISATION: BARCHART
#basic barchart visualisation 1 
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
    text = element_text(family = "serif")
  ) +
  scale_fill_manual(values = c("pink", "blue", "orange"))

#final barchart visualisation 
indicator1 %>% 
filter(.by = year) %>% 
group_by(year) %>% 
ggplot(aes(continent, deprivations, fill = continent)) +
geom_col() +
  facet_wrap(~year) +
labs(
x = "", 
y = "Total number of Deprivations",
fill = "Continent",
title = "Total number of deprivations suffered through the years shown by gender"
  ) +
  theme_classic() +
  theme(
    text = element_text(family = "seriff"),
    axis.text.x = element_blank()
  )

#practise 
indicator1 %>% 
  filter(.by = year) %>% 
  group_by(year) %>% 
  ggplot(aes(continent, deprivations, fill = continent)) +
  geom_col() +
  facet_wrap(~year) +
labs(
  x = "", 
  y = "Total number of Deprivations",
  fill = "Continent",
  title = "Total number of deprivations suffered from 2011-2018 in each continent"
) +
  theme_classic() +
  theme(
    text = element_text(family = "seriff"),
    axis.text.x.bottom = element_blank()
  ) 
---------------------------------------------------------------------









