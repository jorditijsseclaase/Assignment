#Estimation enters and exits M30


#Clean environmemnt
rm(list=ls())


library(tidyverse)
library(XML)
require(XML)

#loading data

pg <- xmlParse("Data/319_Estimation.xml")
EstimationM30 <- xmlToList(pg)
EstimationM30 <- do.call(rbind, EstimationM30)
EstimationM30 <- as.data.frame(EstimationM30)