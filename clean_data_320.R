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
  
#format date 1st column
users$Date[1] <- parse_date(users$Date[1],format='%Y-%m-%d %H:%M:%S')

users$Date[2] <- parse_date(users$Date[2],format='%d/%m/%Y %H:%M:%S')
users$Date[3] <- parse_date(users$Date[3],format='%d/%m/%Y %H:%M:%S')
users$Date[4] <- parse_date(users$Date[4],format='%d/%m/%Y %H:%M:%S')

users$Date[5] <- parse_date(users$Date[5],format='%Y-%m-%d %H:%M:%S')
users$Date[6] <- parse_date(users$Date[6],format='%Y-%m-%d %H:%M:%S')
# 
# 
# #format 3rd column
users$Value[1] <- parse_number(users$Value[1])
users$Value[2] <- parse_number(users$Value[2])
users$Value[3] <- parse_number(users$Value[3])
users$Value[4] <- parse_number(users$Value[4])
users$Value[5] <- parse_date(users$Value[5],format='%d/%m/%Y %H:%M:%S')
users$Value[6] <- parse_date(users$Value[6],format='%d/%m/%Y %H:%M:%S')






