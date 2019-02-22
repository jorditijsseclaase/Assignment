#Air quality real time data 

#Clean environmemnt
rm(list=ls())

library(xml2)
library(tidyverse)

#loading data
require(XML)
pg <- xmlParse("Data/116.xml")

users <- xmlToList(pg)

users <- do.call(rbind, users)
users <- as.data.frame(users)
