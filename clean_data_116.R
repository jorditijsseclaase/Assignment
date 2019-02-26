#Air quality real time data 
# Works the same as 108 (hourly data)

#Clean environmemnt
rm(list=ls())


library(tidyverse)
library(XML)
require(XML)

#loading data

pg <- xmlParse("Data/116.xml")
airqualityRT <- xmlToList(pg)
airqualityRT <- do.call(rbind, airqualityRT)
airqualityRT <- as.data.frame(airqualityRT)

#Tidying data
rownames(airqualityRT) <- NULL

airqualityRT2 <- airqualityRT[FALSE,1:10]
airqualityRT2[1:(24*nrow(airqualityRT)),] <- 0

current_row <- 0

for (i in 1:nrow(airqualityRT)){
  current_col <- 9
  airqualityRT2[(current_row + 1):(current_row + 24),1:8] <- airqualityRT[i,1:8]
  for (j in 1:24){
    airqualityRT2[current_row + j,9:10] <- airqualityRT[i,current_col:(current_col+1)]
    current_col <- current_col + 2
  }
  current_row <- current_row + 24
}

#Add day numbers
airqualityRT2$Hr <- rep(1:24, each=nrow(airqualityRT))


#order columns
airqualityRT2 <- airqualityRT2[c("provincia","municipio","estacion","magnitud","punto_muestreo","ano","mes","dia","Hr","H01","V01")]

#rename columns
colnames(airqualityRT2)[colnames(airqualityRT2)=="provincia"] <- "Province"
colnames(airqualityRT2)[colnames(airqualityRT2)=="municipio"] <- "Municipality"
colnames(airqualityRT2)[colnames(airqualityRT2)=="estacion"] <- "Station"
colnames(airqualityRT2)[colnames(airqualityRT2)=="magnitud"] <- "Magnitude"
colnames(airqualityRT2)[colnames(airqualityRT2)=="provincia"] <- "Province"
colnames(airqualityRT2)[colnames(airqualityRT2)=="punto_muestreo"] <- "Sampling_point"
colnames(airqualityRT2)[colnames(airqualityRT2)=="ano"] <- "Year"
colnames(airqualityRT2)[colnames(airqualityRT2)=="mes"] <- "Month"
colnames(airqualityRT2)[colnames(airqualityRT2)=="dia"] <- "Day"
colnames(airqualityRT2)[colnames(airqualityRT2)=="H01"] <- "Value"
colnames(airqualityRT2)[colnames(airqualityRT2)=="V01"] <- "Valid"


#change characters to numbers
airqualityRT2$Province <- as.numeric(airqualityRT2$Province)
airqualityRT2$Municipality <- as.numeric(airqualityRT2$Municipality)
airqualityRT2$Station <- as.numeric(airqualityRT2$Station)
airqualityRT2$Magnitude <- as.numeric(airqualityRT2$Magnitude)
airqualityRT2$Year <- as.numeric(airqualityRT2$Year)
airqualityRT2$Month <- as.numeric(airqualityRT2$Month)
airqualityRT2$Day <- as.numeric(airqualityRT2$Day)
airqualityRT2$Hr <- as.numeric(airqualityRT2$Hr)
airqualityRT2$Value <- as.numeric(airqualityRT2$Value)

#Delete non valid measurements
airqualityRT2 <- airqualityRT2[!(airqualityRT2$Valid=="N"),]