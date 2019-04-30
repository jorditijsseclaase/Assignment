#hourly air pollution data collection
#Clean environmemnt
rm(list=ls())

library(readr)
library(tidyverse)
library(writexl)
library("readxl")
#2019

mar_mo19 <- read_delim("Data/108_2/Anio2019/mar_mo19.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

#load april here when available and run hourly_NO2.R afterwards



#Merge all months together
airquality_hourly <- rbind(mar_mo19)


airquality_hourly$PERIODO_ANALISIS <- NULL


#rename columns
colnames(airquality_hourly)[colnames(airquality_hourly)=="PROVINCIA"] <- "Province"
colnames(airquality_hourly)[colnames(airquality_hourly)=="MUNICIPIO"] <- "Municipality"
colnames(airquality_hourly)[colnames(airquality_hourly)=="ESTACION"] <- "Station"
colnames(airquality_hourly)[colnames(airquality_hourly)=="MAGNITUD"] <- "Magnitude"
colnames(airquality_hourly)[colnames(airquality_hourly)=="PUNTO_MUESTREO"] <- "Sampling_point"
colnames(airquality_hourly)[colnames(airquality_hourly)=="ANO"] <- "Year"
colnames(airquality_hourly)[colnames(airquality_hourly)=="MES"] <- "Month"
colnames(airquality_hourly)[colnames(airquality_hourly)=="DIA"] <- "Day"


airquality_hourly$Sampling_point <- NULL


#change characters to numbers
airquality_hourly$Province <- as.numeric(airquality_hourly$Province)
airquality_hourly$Municipality <- as.numeric(airquality_hourly$Municipality)
airquality_hourly$Station <- as.numeric(airquality_hourly$Station)
airquality_hourly$Magnitude <- as.numeric(airquality_hourly$Magnitude)
# airquality_hourly$Sampling_point <- as.numeric(airquality_hourly$Sampling_point)
airquality_hourly$Year <- as.numeric(airquality_hourly$Year)
airquality_hourly$Month <- as.numeric(airquality_hourly$Month)
airquality_hourly$Day <- as.numeric(airquality_hourly$Day)
airquality_hourly$H01 <- as.numeric(airquality_hourly$H01)
airquality_hourly$H02 <- as.numeric(airquality_hourly$H02)
airquality_hourly$H03 <- as.numeric(airquality_hourly$H03)
airquality_hourly$H04 <- as.numeric(airquality_hourly$H04)
airquality_hourly$H05 <- as.numeric(airquality_hourly$H05)
airquality_hourly$H06 <- as.numeric(airquality_hourly$H06)
airquality_hourly$H07 <- as.numeric(airquality_hourly$H07)
airquality_hourly$H08 <- as.numeric(airquality_hourly$H08)
airquality_hourly$H09 <- as.numeric(airquality_hourly$H09)
airquality_hourly$H10 <- as.numeric(airquality_hourly$H10)
airquality_hourly$H11 <- as.numeric(airquality_hourly$H11)
airquality_hourly$H12 <- as.numeric(airquality_hourly$H12)
airquality_hourly$H13 <- as.numeric(airquality_hourly$H13)
airquality_hourly$H14 <- as.numeric(airquality_hourly$H14)
airquality_hourly$H15 <- as.numeric(airquality_hourly$H15)
airquality_hourly$H16 <- as.numeric(airquality_hourly$H16)
airquality_hourly$H17 <- as.numeric(airquality_hourly$H17)
airquality_hourly$H18 <- as.numeric(airquality_hourly$H18)
airquality_hourly$H19 <- as.numeric(airquality_hourly$H19)
airquality_hourly$H20 <- as.numeric(airquality_hourly$H20)
airquality_hourly$H21 <- as.numeric(airquality_hourly$H21)
airquality_hourly$H22 <- as.numeric(airquality_hourly$H22)
airquality_hourly$H23 <- as.numeric(airquality_hourly$H23)
airquality_hourly$H24 <- as.numeric(airquality_hourly$H24)


#Unite to 1 date
airquality_hourly$Year[airquality_hourly$Year==13] <- 2013
airquality_hourly$Year[airquality_hourly$Year==14] <- 2014
airquality_hourly$Year[airquality_hourly$Year==15] <- 2015
airquality_hourly$Year[airquality_hourly$Year==16] <- 2016
airquality_hourly$Year[airquality_hourly$Year==17] <- 2017

airquality_hourly <- airquality_hourly %>% unite(Date, Year, Month, Day, sep = "/") 
airquality_hourly$Date <- as.Date(airquality_hourly$Date)


#Write airquality to excel file
write_xlsx(airquality_hourly, "Cleaned_Airquality_hourly_2019.xlsx")
