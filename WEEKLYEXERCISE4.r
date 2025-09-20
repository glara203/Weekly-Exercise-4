## default branch
## [1] "main"

#install and load libraries that I will need 
install.packages("readr")
library(tidyverse)
library(ggplot2)  
library(readr)

#read in data set
oly = read_csv("Olympics.csv")


#6a. Calculate a new variable, called ‘total.medals’, which is the sum of gold, silver, and bronze, and add it to the Olympic dataset. 

total.medals <- oly$gold + oly$silver + oly$bronze #created new variable
oly <- data.frame(oly, total.medals) #added variable to olympics data set
view(oly) #double checked my work

#6b. For each country, how many gold medals has it won? 
tot.gold = oly %>% 
  group_by(country)  %>% 
  summarise(num.gold = sum(gold))
view(tot.gold)

#6c. For each year, how many total medals were given out?
medals.per.year = oly  %>% 
  group_by(year)   %>% 
 summarise(tot.med = sum(total.medals, na.rm = TRUE))
view(medals.per.year) #double checked my work


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

