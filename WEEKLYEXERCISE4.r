## default branch
## [1] "main"

#install and load libraries that I will need 
install.packages("readr")
library(tidyverse)
library(ggplot2)  
library(readr)
# set wd

#read in data set
oly = read_csv("Olympics.csv")

#a. Calculate a new variable, called ‘total.medals’, which is the sum of gold, silver, and bronze, and add it to the Olympic dataset. 

total.medals <- oly$gold + oly$silver + oly$bronze #created new variable
oly <- data.frame(oly, total.medals) #added variable to olympics data set
view(oly) #double checked my work

#b. For each country, how many gold medals has it won? 
tot.gold = oly %>% 
  group_by(country)  %>% 
  summarise(num.gold = sum(gold))
view(tot.gold)

#c. For each year, how many total medals were given out?
medals.per.year = oly  %>% 
  group_by(year)   %>% 
 summarise(tot.med = sum(total.medals, na.rm = TRUE))
view(medals.per.year) #double checked my work

