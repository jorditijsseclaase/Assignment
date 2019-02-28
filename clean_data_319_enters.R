#Enters M30


#Clean environmemnt
rm(list=ls())


library(tidyverse)
library(XML)
require(XML)

#loading data

pg <- xmlParse("Data/319_Enters.xml")
entersM30 <- xmlToList(pg)
entersM30 <- do.call(rbind, entersM30)
entersM30 <- as.data.frame(entersM30)