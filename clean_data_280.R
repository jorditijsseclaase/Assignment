# Street traffic 30. Historical data of users who have circulated since 2013 
# Works
#Clean environmemnt
rm(list=ls())

library(xml2)
library(tidyverse)
library(readr)




#loading data
  pg<- read_xml("Data/280.xml")
f <- function(u)
  map_df(xml_children(u), ~list(variable=xml_name(.x), value=xml_text(.x))) %>% spread("variable","value")
  traffic <- pg %>% xml_find_all('//Historico') %>% map(f)


#make a dataframe out of list
traffic <- do.call(rbind, traffic)

#Put . everywhere instread of ,
traffic$velocidadMedia <- gsub(",", ".", traffic$velocidadMedia)

#remove units from text 1st column
traffic$distanciaMediaRecorrida <- parse_number(traffic$distanciaMediaRecorrida)

#format date 2nd column
traffic$Fecha <- parse_date(traffic$Fecha,format='%d/%m/%Y')

#remove units from text 4th column
traffic$UsuariosCalle30 <- parse_number(traffic$UsuariosCalle30)

#remove units from text 5th column
traffic$vehxKmRamales <- parse_number(traffic$vehxKmRamales)

#remove units from text 6th column
traffic$vehxKmTotales <- parse_number(traffic$vehxKmTotales)

#remove units from text 6th column
traffic$velocidadMedia <- parse_number(traffic$velocidadMedia)

#Rename Columns
colnames(traffic)[colnames(traffic)=="distanciaMediaRecorrida"] <- "avg_tr_dist"
colnames(traffic)[colnames(traffic)=="Fecha"] <- "Date"
colnames(traffic)[colnames(traffic)=="tiempoMediodeRecorrido"] <- "avg_tr_time"
colnames(traffic)[colnames(traffic)=="UsuariosCalle30"] <- "traffic_Street_30"
colnames(traffic)[colnames(traffic)=="vehxKmRamales"] <- "Vehicles_Km_Branches"
colnames(traffic)[colnames(traffic)=="vehxKmTotales"] <- "Vehicles_Km_Total"
colnames(traffic)[colnames(traffic)=="velocidadMedia"] <- "avg_Speed"

#Make travel time in seconds 3th column
g <- function(x) as.numeric(gsub("min.*","",x)) * 60 + as.numeric(gsub("seg.*","",gsub(".*min.","",x)))
vg <- Vectorize(g)

traffic %>% mutate(avg_tr_time = vg(avg_tr_time)) -> traffic



