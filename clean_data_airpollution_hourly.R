#hourly air pollution data collection
#Clean environmemnt
rm(list=ls())

library(readr)
library(tidyverse)
library(writexl)
library("readxl")
#2013

ene_mo13 <- read_delim("Data/108_2/Anio2013/ene_mo13.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

feb_mo13 <- read_delim("Data/108_2/Anio2013/feb_mo13.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

mar_mo13 <- read_delim("Data/108_2/Anio2013/mar_mo13.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

abr_mo13 <- read_delim("Data/108_2/Anio2013/abr_mo13.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

may_mo13 <- read_delim("Data/108_2/Anio2013/may_mo13.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

jun_mo13 <- read_delim("Data/108_2/Anio2013/jun_mo13.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

jul_mo13 <- read_delim("Data/108_2/Anio2013/jul_mo13.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

ago_mo13 <- read_delim("Data/108_2/Anio2013/ago_mo13.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

sep_mo13 <- read_delim("Data/108_2/Anio2013/sep_mo13.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

oct_mo13 <- read_delim("Data/108_2/Anio2013/oct_mo13.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

nov_mo13 <- read_delim("Data/108_2/Anio2013/nov_mo13.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

dic_mo13 <- read_delim("Data/108_2/Anio2013/dic_mo13.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

#2014

ene_mo14 <- read_delim("Data/108_2/Anio2014/ene_mo14.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

feb_mo14 <- read_delim("Data/108_2/Anio2014/feb_mo14.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

mar_mo14 <- read_delim("Data/108_2/Anio2014/mar_mo14.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

abr_mo14 <- read_delim("Data/108_2/Anio2014/abr_mo14.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

may_mo14 <- read_delim("Data/108_2/Anio2014/may_mo14.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

jun_mo14 <- read_delim("Data/108_2/Anio2014/jun_mo14.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

jul_mo14 <- read_delim("Data/108_2/Anio2014/jul_mo14.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

ago_mo14 <- read_delim("Data/108_2/Anio2014/ago_mo14.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

sep_mo14 <- read_delim("Data/108_2/Anio2014/sep_mo14.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

oct_mo14 <- read_delim("Data/108_2/Anio2014/oct_mo14.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

nov_mo14 <- read_delim("Data/108_2/Anio2014/nov_mo14.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

dic_mo14 <- read_delim("Data/108_2/Anio2014/dic_mo14.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

#2015

ene_mo15 <- read_delim("Data/108_2/Anio2015/ene_mo15.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

feb_mo15 <- read_delim("Data/108_2/Anio2015/feb_mo15.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

mar_mo15 <- read_delim("Data/108_2/Anio2015/mar_mo15.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

abr_mo15 <- read_delim("Data/108_2/Anio2015/abr_mo15.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

may_mo15 <- read_delim("Data/108_2/Anio2015/may_mo15.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

jun_mo15 <- read_delim("Data/108_2/Anio2015/jun_mo15.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

jul_mo15 <- read_delim("Data/108_2/Anio2015/jul_mo15.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

ago_mo15 <- read_delim("Data/108_2/Anio2015/ago_mo15.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

sep_mo15 <- read_delim("Data/108_2/Anio2015/sep_mo15.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

oct_mo15 <- read_delim("Data/108_2/Anio2015/oct_mo15.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

nov_mo15 <- read_delim("Data/108_2/Anio2015/nov_mo15.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

dic_mo15 <- read_delim("Data/108_2/Anio2015/dic_mo15.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)


#2016

ene_mo16 <- read_delim("Data/108_2/Anio2016/ene_mo16.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

feb_mo16 <- read_delim("Data/108_2/Anio2016/feb_mo16.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

mar_mo16 <- read_delim("Data/108_2/Anio2016/mar_mo16.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

abr_mo16 <- read_delim("Data/108_2/Anio2016/abr_mo16.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

may_mo16 <- read_delim("Data/108_2/Anio2016/may_mo16.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

jun_mo16 <- read_delim("Data/108_2/Anio2016/jun_mo16.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

jul_mo16 <- read_delim("Data/108_2/Anio2016/jul_mo16.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

ago_mo16 <- read_delim("Data/108_2/Anio2016/ago_mo16.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

sep_mo16 <- read_delim("Data/108_2/Anio2016/sep_mo16.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

oct_mo16 <- read_delim("Data/108_2/Anio2016/oct_mo16.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

nov_mo16 <- read_delim("Data/108_2/Anio2016/nov_mo16.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

dic_mo16 <- read_delim("Data/108_2/Anio2016/dic_mo16.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

#2017

ene_mo17 <- read_delim("Data/108_2/Anio2017/ene17.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

feb_mo17 <- read_delim("Data/108_2/Anio2017/feb17.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

mar_mo17 <- read_delim("Data/108_2/Anio2017/mar17.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

abr_mo17 <- read_delim("Data/108_2/Anio2017/abr17.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

may_mo17 <- read_delim("Data/108_2/Anio2017/may17.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

jun_mo17 <- read_delim("Data/108_2/Anio2017/jun17.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

jul_mo17 <- read_delim("Data/108_2/Anio2017/jul17.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

ago_mo17 <- read_delim("Data/108_2/Anio2017/ago17.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

sep_mo17 <- read_delim("Data/108_2/Anio2017/sep17.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

oct_mo17 <-  read_excel("Data/108_2/Anio2017/oct17.xlsx")

nov_mo17 <-  read_excel("Data/108_2/Anio2017/nov17.xlsx")

dic_mo17 <-  read_excel("Data/108_2/Anio2017/dic17.xlsx")

#2018

ene_mo18 <- read_delim("Data/108_2/Anio2018/ene_mo18.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

feb_mo18 <- read_delim("Data/108_2/Anio2018/feb_mo18.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

mar_mo18 <- read_delim("Data/108_2/Anio2018/mar_mo18.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

abr_mo18 <- read_delim("Data/108_2/Anio2018/abr_mo18.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

may_mo18 <- read_delim("Data/108_2/Anio2018/may_mo18.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

jun_mo18 <- read_delim("Data/108_2/Anio2018/jun_mo18.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

jul_mo18 <- read_delim("Data/108_2/Anio2018/jul_mo18.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

ago_mo18 <- read_delim("Data/108_2/Anio2018/ago_mo18.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

sep_mo18 <- read_delim("Data/108_2/Anio2018/sep_mo18.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

oct_mo18 <- read_delim("Data/108_2/Anio2018/oct_mo18.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

nov_mo18 <- read_delim("Data/108_2/Anio2018/nov_mo18.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)

dic_mo18 <- read_delim("Data/108_2/Anio2018/dic_mo18.csv", 
                       ";", escape_double = FALSE, trim_ws = TRUE)


#Merge all years and months together
airquality2013_2017_hourly <- rbind(ene_mo13,feb_mo13,mar_mo13,abr_mo13,may_mo13,jun_mo13,jul_mo13,ago_mo13,sep_mo13,oct_mo13,nov_mo13,dic_mo13,
                                    ene_mo14,feb_mo14,mar_mo14,abr_mo14,may_mo14,jun_mo14,jul_mo14,ago_mo14,sep_mo14,oct_mo14,nov_mo14,dic_mo14,
                                    ene_mo15,feb_mo15,mar_mo15,abr_mo15,may_mo15,jun_mo15,jul_mo15,ago_mo15,sep_mo15,oct_mo15,nov_mo15,dic_mo15,
                                    ene_mo16,feb_mo16,mar_mo16,abr_mo16,may_mo16,jun_mo16,jul_mo16,ago_mo16,sep_mo16,oct_mo16,nov_mo16,dic_mo16,
                                    ene_mo17,feb_mo17,mar_mo17,abr_mo17,may_mo17,jun_mo17,jul_mo17,ago_mo17,sep_mo17,oct_mo17,nov_mo17,dic_mo17)

airquality2013_2017_hourly$PERIODO_ANALISIS <- NULL

airquality_hourly <- rbind(airquality2013_2017_hourly,
                                    ene_mo18,feb_mo18,mar_mo18,abr_mo18,may_mo18,jun_mo18,jul_mo18,ago_mo18,sep_mo18,oct_mo18,nov_mo18,dic_mo18)

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
write_xlsx(airquality_hourly, "Cleaned_Airquality_hourly_2013_2018.xlsx")






