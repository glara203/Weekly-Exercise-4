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
