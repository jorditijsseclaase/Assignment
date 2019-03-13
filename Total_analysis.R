rm(list=ls())


library(tidyverse)
library(XML)
require(XML)
library(writexl)
library("readxl")


airquality2013_2018 <- read_excel("Cleaned_Airquality2013_2018.xlsx")

AQI2013_2018 <- read_excel("Cleaned_AQI2013_2018.xlsx")

weather <- read_excel("Cleaned_Weather2013-2018.xlsx")

traffic <- read_excel("Cleaned_Traffic2013-2018.xlsx")

# Add traffic to weather
# Total <- merge(weather,traffic, by="Date")
# Did not work because 1 row was deleted.. so did it manually:
Total <- weather
Total$avg_tr_dist <- traffic$avg_tr_dist
Total$avg_tr_time <- traffic$avg_tr_time
Total$users_Street30 <- traffic$users_Street_30
Total$Vehicles_Km_Branches <- traffic$Vehicles_Km_Branches
Total$Vehicles_Km_Total <- traffic$Vehicles_Km_Total
Total$avg_Speed <- traffic$avg_Speed

# Add polutants
Total$SO2 <- airquality2013_2018$Value[airquality2013_2018$Magnitude==1]
Total$CO <- airquality2013_2018$Value[airquality2013_2018$Magnitude==6]
Total$NO <- airquality2013_2018$Value[airquality2013_2018$Magnitude==7]
Total$NO2 <- airquality2013_2018$Value[airquality2013_2018$Magnitude==8]
Total$PM2.5 <- airquality2013_2018$Value[airquality2013_2018$Magnitude==9]
Total$PM10 <- airquality2013_2018$Value[airquality2013_2018$Magnitude==10]
Total$NOx <- airquality2013_2018$Value[airquality2013_2018$Magnitude==12]
Total$O3 <- airquality2013_2018$Value[airquality2013_2018$Magnitude==14]
Total$TOL <- airquality2013_2018$Value[airquality2013_2018$Magnitude==20]
Total$BEN <- airquality2013_2018$Value[airquality2013_2018$Magnitude==30]
Total$EBE <- airquality2013_2018$Value[airquality2013_2018$Magnitude==35]

#Add AQI
Total$AQI <- AQI2013_2018$AQI

#Write total to excel file
write_xlsx(Total, "Cleaned_Total.xlsx")














