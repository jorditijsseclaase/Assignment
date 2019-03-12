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

airquality2017 <- read_excel("Cleaned_Airquality2017.xlsx")
AQI2017 <- read_excel("Cleaned_AQI2017.xlsx")

airquality2016 <- read_excel("Cleaned_Airquality2016.xlsx")
AQI2016 <- read_excel("Cleaned_AQI2016.xlsx")

airquality2015 <- read_excel("Cleaned_Airquality2015.xlsx")
AQI2015 <- read_excel("Cleaned_AQI2015.xlsx")

airquality2014 <- read_excel("Cleaned_Airquality2014.xlsx")
AQI2014 <- read_excel("Cleaned_AQI2014.xlsx")

airquality2013 <- read_excel("Cleaned_Airquality2013.xlsx")
AQI2013 <- read_excel("Cleaned_AQI2013.xlsx")


#Merge all years together
airquality2013_2018 <- rbind(airquality2013,airquality2014,airquality2015,airquality2016,
                             airquality2017,airquality2018)

AQI2013_2018 <- rbind(AQI2013,AQI2014,AQI2015,AQI2016,AQI2017,AQI2018)


#Assign names to magnitudes
# library(plyr)
# airquality2$Magnitude <-  c("1"="SO2","6"="CO","7"="NO","8"="NO2","9"="PM2.5","10"="PM10","12"="NOx",
#                                    "14"="O3","20"="TOL","30"="BEN","35"="EBE","37"="MXY","38"="PXY","39"="OXY",
#                                    "42"="TCH","43"="CH4","44"="NMHC")


#Filter for station 8 (Escuelas Aquirre)
airquality2013_2018 <- filter(airquality2013_2018, Station==8)

airquality2013_2018_spread1 <- airquality2013_2018 %>% spread(key=Magnitude, value=Value)

#Make nice dataframe (remove NA)






