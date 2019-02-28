#Exits M30


#Clean environmemnt
rm(list=ls())


library(tidyverse)
library(XML)
require(XML)

#loading data

pg <- xmlParse("Data/319_Exits.xml")
exitsM30 <- xmlToList(pg)
exitsM30 <- do.call(rbind, exitsM30)
exitsM30 <- as.data.frame(exitsM30)