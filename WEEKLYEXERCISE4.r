## default branch
## [1] "main"

#install and load libraries that I will need 
install.packages("readr")
library(tidyverse)
library(ggplot2)  
library(readr)

#read in data set
oly = read_csv("Olympics.csv")

#7a. Which countries had the largest delegation of athletes in 1992? Create a tibble that
# contains only the variables country and athletes.
most.athletes = oly %>% 
  filter(year == 1992) %>% 
  select(country, athletes) %>% 
  arrange(desc(athletes))
most.athletes

#7b. For the following five countries, plot the number of gold medals earned over time:
# United States, France, Germany, Russia, and China.

oly %>% dplyr::filter(country %in% c("United States", "France", "Germany", "Russia", "China")) %>%
ggplot(aes(year, gold, colour = country)) +
  geom_line() + geom_point()
