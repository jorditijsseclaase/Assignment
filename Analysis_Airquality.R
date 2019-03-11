# Air quality. Daily data years 2001-2018  (2018)
# Works
#Clean environmemnt
rm(list=ls())


library(tidyverse)
library(XML)
require(XML)
library(writexl)
library("readxl")

airquality2018 <- read_excel("Cleaned_Airquality2018.xlsx")
AQI2018 <- read_excel("Cleaned_AQI2018.xlsx")




#plot of Maximum AQI
ggplot(data = AQI2018) +
  geom_point(mapping = aes(x = Date, y = AQI)) +
  geom_smooth(mapping = aes(x = Date, y = AQI))+
  ggtitle("Maximum AQI")