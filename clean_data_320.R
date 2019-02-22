# Street traffic 30. Traffic data and real-time traffic status 
# Works
#Clean environmemnt
rm(list=ls())

library(xml2)
library(tidyverse)

#loading data
  pg<- read_xml("Data/320.xml")

f <- function(u)
  map_df(xml_children(u), ~list(variable=xml_name(.x), value=xml_text(.x))) %>% spread("variable","value")
  users <- pg %>% xml_find_all('//DatoGlobal') %>% map(f)

  users[7] <- NULL
  users <- do.call(rbind, users)
  
#Rename Columns
colnames(users)[colnames(users)=="FECHA"] <- "Date"
colnames(users)[colnames(users)=="Nombre"] <- "Name"
colnames(users)[colnames(users)=="VALOR"] <- "Value"
  
#format date 2nd column
# users$FECHA(1) <- as.POSIXct(users$FECHA,format='%Y-%m-%d %H:%M:%S')