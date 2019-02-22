# Air quality. Daily data years 2001-2018  (2018)
# Works
#Clean environmemnt
rm(list=ls())

library(xml2)
library(tidyverse)

#loading data
require(XML)
pg <- xmlParse("Data/107_2018.xml")

users <- xmlToList(pg)

users <- do.call(rbind, users)
users <- as.data.frame(users)



