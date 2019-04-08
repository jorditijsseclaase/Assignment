# NO2. Daily data years 2001-2018  (2018)
# Works
#Clean environmemnt
rm(list=ls())


library(tidyverse)
library(XML)
require(XML)
library(writexl)
library("readxl")

NO2_2018 <- read_excel("NO2_2018.xlsx")
NO2_2017 <- read_excel("NO2_2017.xlsx")
NO2_2016 <- read_excel("NO2_2016.xlsx")
NO2_2015 <- read_excel("NO2_2015.xlsx")
NO2_2014 <- read_excel("NO2_2014.xlsx")
NO2_2013 <- read_excel("NO2_2013.xlsx")





#Merge all years together
NO2_2013_2018 <- rbind(NO2_2018,NO2_2017,NO2_2016,NO2_2015,NO2_2014,NO2_2013)


NO2_2013_2018$num_stations_NO2_max_50 <- 0



