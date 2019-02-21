# Street traffic 30. Historical data of users who have circulated since 2013 
# Works

library(xml2)
library(tidyverse)
library(readr)

pg <- read_xml("Data/280.xml")

f <- function(u)
  map_df(xml_children(u), ~list(variable=xml_name(.x), value=xml_text(.x))) %>% spread("variable","value")
  users <- pg %>% xml_find_all('//Historico') %>% map(f)

#make a dataframe out of list
users <- do.call(rbind, users)

#Put . everywhere instread of ,
users$velocidadMedia <- gsub(",", ".", users$velocidadMedia)

#remove units from text 1st column
users$distanciaMediaRecorrida <- parse_number(users$distanciaMediaRecorrida)

#format date 2nd column
users$Fecha <- parse_date(users$Fecha,format='%d/%m/%Y')

#remove units from text 3th column
# users$tiempoMediodeRecorrido <- parse_date(users$tiempoMediodeRecorrido,format='%M/%S')


#remove units from text 4th column
users$UsuariosCalle30 <- parse_number(users$UsuariosCalle30)

#remove units from text 5th column
users$vehxKmRamales <- parse_number(users$vehxKmRamales)

#remove units from text 6th column
users$vehxKmTotales <- parse_number(users$vehxKmTotales)

#remove units from text 6th column
users$velocidadMedia <- parse_number(users$velocidadMedia)

#Rename Columns
colnames(users)[colnames(users)=="distanciaMediaRecorrida"] <- "Avg. Distance Traveled [m]"
colnames(users)[colnames(users)=="Fecha"] <- "Date"
colnames(users)[colnames(users)=="tiempoMediodeRecorrido"] <- "avg_tr_time"
colnames(users)[colnames(users)=="UsuariosCalle30"] <- "Users Street 30"
colnames(users)[colnames(users)=="vehxKmRamales"] <- "Vehicles*Km Branches"
colnames(users)[colnames(users)=="vehxKmTotales"] <- "Vehicles*Km Total"
colnames(users)[colnames(users)=="velocidadMedia"] <- "Avg. Speed [km/h]"

g <- function(x) as.numeric(gsub("min.*","",x)) * 60 + as.numeric(gsub("seg.*","",gsub(".*min.","",x)))
vg <- Vectorize(g)

users %>% mutate(avg_tr_time = vg(avg_tr_time)) -> users



