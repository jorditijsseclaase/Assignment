# Air quality. Daily data years 2001-2018  (2018)
# Works
#Clean environmemnt
rm(list=ls())


library(tidyverse)
library(XML)
require(XML)
library(writexl)
library("readxl")

airquality2018 <- read_excel("Cleaned_Airquality2018_2.xlsx")
AQI2018 <- read_excel("Cleaned_AQI2018_2.xlsx")

airquality2017 <- read_excel("Cleaned_Airquality2017_2.xlsx")
AQI2017 <- read_excel("Cleaned_AQI2017_2.xlsx")

airquality2016 <- read_excel("Cleaned_Airquality2016_2.xlsx")
AQI2016 <- read_excel("Cleaned_AQI2016_2.xlsx")

airquality2015 <- read_excel("Cleaned_Airquality2015_2.xlsx")
AQI2015 <- read_excel("Cleaned_AQI2015_2.xlsx")

airquality2014 <- read_excel("Cleaned_Airquality2014_2.xlsx")
AQI2014 <- read_excel("Cleaned_AQI2014_2.xlsx")

airquality2013 <- read_excel("Cleaned_Airquality2013_2.xlsx")
AQI2013 <- read_excel("Cleaned_AQI2013_2.xlsx")


#Merge all years together
airquality2013_2018 <- rbind(airquality2013,airquality2014,airquality2015,airquality2016,
                             airquality2017,airquality2018)

AQI2013_2018 <- rbind(AQI2013,AQI2014,AQI2015,AQI2016,AQI2017,AQI2018)



#Filter for station 8 (Escuelas Aquirre)
airquality2013_2018 <- filter(airquality2013_2018, Station==8)


#Assign NA if not valid
airquality2013_2018$Value[airquality2013_2018$Valid=="N"]=NA


#Remove dates which are NA
completeFun <- function(data, desiredCols) {
  completeVec <- complete.cases(data[, desiredCols])
  return(data[completeVec, ])
}
airquality2013_2018 <- completeFun(airquality2013_2018, "Date")
AQI2013_2018 <- completeFun(AQI2013_2018, "Date")


#Write airquality to excel file
write_xlsx(airquality2013_2018, "Cleaned_Airquality2013_2018.xlsx")

write_xlsx(AQI2013_2018,"Cleaned_AQI2013_2018.xlsx")







