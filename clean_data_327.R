# Traffic. Real-time traffic data 
# Works
#Clean environmemnt
rm(list=ls())

library(xml2)
library(tidyverse)

#loading data
pg<- read_xml("Data/327.xml")

f <- function(u)
  map_df(xml_children(u), ~list(variable=xml_name(.x), value=xml_text(.x))) %>% spread("variable","value")
users <- pg %>% xml_find_all('//pm') %>% map(f)

users[3698:4114] <- NULL
users <- do.call(rbind, users)

