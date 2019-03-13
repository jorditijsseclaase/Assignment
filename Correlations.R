rm(list=ls())


library(tidyverse)
library(XML)
require(XML)
library(writexl)
library("readxl")


Total <- read_excel("Cleaned_Total.xlsx")

#plot of average travel time (2013-2018)
ggplot(data = Total) + 
  geom_point(mapping = aes(x=users_Street30, y=PM10))+
  # geom_smooth(mapping = aes(x= Date, y=AQI))+
       # ylim(0,500)+
  ggtitle("-")


