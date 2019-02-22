# Air quality. Data per hour years 2001-2018  (2018)
# Works
#Clean environmemnt
rm(list=ls())

library(xml2)
library(tidyverse)

#loading data
require(XML)
pg <- xmlParse("Data/108/abr_mo18.xml")

users <- xmlToList(pg)

users <- do.call(rbind, users)
users <- as.data.frame(users)


