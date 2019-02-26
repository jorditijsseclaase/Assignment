#Air quality real time data 
# Works the same as 108 (hourly data)

#Clean environmemnt
rm(list=ls())


library(tidyverse)
library(XML)
require(XML)

#loading data

pg <- xmlParse("Data/116.xml")
airquality <- xmlToList(pg)
airquality <- do.call(rbind, airquality)
airquality <- as.data.frame(airquality)

#Tidying data
rownames(airquality) <- NULL

airquality2 <- airquality[FALSE,1:10]
airquality2[1:(24*nrow(airquality)),] <- 0

current_row <- 0

for (i in 1:nrow(airquality)){
  current_col <- 9
  airquality2[(current_row + 1):(current_row + 24),1:8] <- airquality[i,1:8]
  for (j in 1:24){
    airquality2[current_row + j,9:10] <- airquality[i,current_col:(current_col+1)]
    current_col <- current_col + 2
  }
  current_row <- current_row + 24
}

#Add day numbers
airquality2$Hr <- rep(1:24, each=nrow(airquality))


#order columns
airquality2 <- airquality2[c("provincia","municipio","estacion","magnitud","punto_muestreo","ano","mes","dia","Hr","H01","V01")]

#rename columns
colnames(airquality2)[colnames(airquality2)=="provincia"] <- "Province"
colnames(airquality2)[colnames(airquality2)=="municipio"] <- "Municipality"
colnames(airquality2)[colnames(airquality2)=="estacion"] <- "Station"
colnames(airquality2)[colnames(airquality2)=="magnitud"] <- "Magnitude"
colnames(airquality2)[colnames(airquality2)=="provincia"] <- "Province"
colnames(airquality2)[colnames(airquality2)=="punto_muestreo"] <- "Sampling_point"
colnames(airquality2)[colnames(airquality2)=="ano"] <- "Year"
colnames(airquality2)[colnames(airquality2)=="mes"] <- "Month"
colnames(airquality2)[colnames(airquality2)=="dia"] <- "Day"
colnames(airquality2)[colnames(airquality2)=="H01"] <- "Value"
colnames(airquality2)[colnames(airquality2)=="V01"] <- "Valid"


#change characters to numbers
airquality2$Province <- as.numeric(airquality2$Province)
airquality2$Municipality <- as.numeric(airquality2$Municipality)
airquality2$Station <- as.numeric(airquality2$Station)
airquality2$Magnitude <- as.numeric(airquality2$Magnitude)
airquality2$Year <- as.numeric(airquality2$Year)
airquality2$Month <- as.numeric(airquality2$Month)
airquality2$Day <- as.numeric(airquality2$Day)
airquality2$Hr <- as.numeric(airquality2$Hr)
airquality2$Value <- as.numeric(airquality2$Value)

#Delete non valid measurements
airquality2 <- airquality2[!(airquality2$Valid=="N"),]