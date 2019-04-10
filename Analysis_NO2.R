# NO2. Daily data years 2001-2018  (2018)
# Works
#Clean environmemnt
rm(list=ls())


library(tidyverse)
library(XML)
require(XML)
library(writexl)
library("readxl")

NO2_2018 <- read_excel("NO2_2018.xlsx")
NO2_2017 <- read_excel("NO2_2017.xlsx")
NO2_2016 <- read_excel("NO2_2016.xlsx")
NO2_2015 <- read_excel("NO2_2015.xlsx")
NO2_2014 <- read_excel("NO2_2014.xlsx")
NO2_2013 <- read_excel("NO2_2013.xlsx")





#Merge all years together
NO2_2013_2018 <- rbind(NO2_2018,NO2_2017,NO2_2016,NO2_2015,NO2_2014,NO2_2013)


#DEAL WITH NA VALUES!



#adding extra parameters

#Average NO2 of all stations
NO2_2013_2018$avg_NO2 <- rowMeans(NO2_2013_2018[,c(2:25)],na.rm=TRUE)

#Max NO2 of all stations
NO2_2013_2018$max_NO2 <- apply(NO2_2013_2018[,-1],1,max,na.rm=TRUE) 

#Station with max NO2
NO2_2013_2018$max_NO2_station <- colnames(NO2_2013_2018)[apply(NO2_2013_2018,1,which.max)]
  



#Number of stations less then 50
NO2_2013_2018$num_stations_NO2_max_50 <- apply(NO2_2013_2018[,c(2:25)], 1 ,function(x)sum(x<50,na.rm=T))
#Number of stations between 50 and 100
NO2_2013_2018$num_stations_NO2_50_100 <- apply(NO2_2013_2018[,c(2:25)], 1 ,function(x)sum(x>50&x<100,na.rm=T))

#Number of stations between 100 and 180
NO2_2013_2018$num_stations_NO2_100_180 <- apply(NO2_2013_2018[,c(2:25)], 1 ,function(x)sum(x>100&x<180,na.rm=T))

#Number of stations between 180 and 200
NO2_2013_2018$num_stations_NO2_100_180 <- apply(NO2_2013_2018[,c(2:25)], 1 ,function(x)sum(x>180&x<200,na.rm=T))

#Number of stations between 200 and 400
NO2_2013_2018$num_stations_NO2_200_400 <- apply(NO2_2013_2018[,c(2:25)], 1 ,function(x)sum(x>200&x<400,na.rm=T))

#Number of stations between 100 and 180
NO2_2013_2018$num_stations_NO2_min_400 <- apply(NO2_2013_2018[,c(2:25)], 1 ,function(x)sum(x>400,na.rm=T))










