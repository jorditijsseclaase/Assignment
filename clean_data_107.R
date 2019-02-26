# Air quality. Daily data years 2001-2018  (2018)
# Works
#Clean environmemnt
rm(list=ls())


library(tidyverse)
library(XML)
require(XML)

#loading data
pg <- xmlParse("Data/107_2018.xml")
users <- xmlToList(pg)
users <- do.call(rbind, users)
users <- as.data.frame(users)

#Tidying data
rownames(users) <- NULL

users2 <- users[FALSE,1:9]
users2[1:(31*nrow(users)),] <- 0

current_row <- 0

for (i in 1:nrow(users)){
  current_col <- 8
  users2[(current_row + 1):(current_row + 31),1:7] <- users[i,1:7]
  for (j in 1:31){
    users2[current_row + j,8:9] <- users[i,current_col:(current_col+1)]
    current_col <- current_col + 2
  }
  current_row <- current_row + 31
}

#Add day numbers
users2$Day <- rep(1:31, times=1806, each=1)

#order columns
users2 <- users2[c("provincia","municipio","estacion","magnitud","punto_muestreo","ano","mes","Day","D01","V01")]

#rename columns
colnames(users2)[colnames(users2)=="provincia"] <- "Province"
colnames(users2)[colnames(users2)=="municipio"] <- "Municipality"
colnames(users2)[colnames(users2)=="estacion"] <- "Station"
colnames(users2)[colnames(users2)=="magnitud"] <- "Magnitude"
colnames(users2)[colnames(users2)=="provincia"] <- "Province"
colnames(users2)[colnames(users2)=="punto_muestreo"] <- "Sampling_point"
colnames(users2)[colnames(users2)=="ano"] <- "Year"
colnames(users2)[colnames(users2)=="mes"] <- "Month"
colnames(users2)[colnames(users2)=="D01"] <- "Value"
colnames(users2)[colnames(users2)=="V01"] <- "Valid"


#change characters to numbers
users2$Province <- as.numeric(users2$Province)
users2$Municipality <- as.numeric(users2$Municipality)
users2$Station <- as.numeric(users2$Station)
users2$Magnitude <- as.numeric(users2$Magnitude)
users2$Year <- as.numeric(users2$Year)
users2$Month <- as.numeric(users2$Month)
users2$Day <- as.numeric(users2$Day)
users2$Value <- as.numeric(users2$Value)

#Delete non valid measurements
users2 <- users2[!(users2$Valid=="N"),]
  


