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

#practise bar chart 1 
ggplot(data = indicator1) +
  aes(x = year, y = no.deprivations, color = sex)
geom_point()

#practise bar chart 2 
indicator1 %>% 
  ggplot(aes(x = year, y = no.deprivations, color = sex)) +
  geom_point()

#practise bar chart 3
indicator1 %>% 
  filter(.by = sex) %>% 
  group_by(sex) %>% 
  ggplot(aes(year, no.deprivations, fill = sex)) +
  geom_col()





