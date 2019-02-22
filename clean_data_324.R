# Traffic. Information in informative panels of variable information in surface
# Works
#Clean environmemnt
rm(list=ls())

library(xml2)
library(tidyverse)

#loading data
pg<- read_xml("Data/324.xml")

#DEVICES
f <- function(u)
  map_df(xml_children(u), ~list(variable=xml_name(.x), value=xml_text(.x))) %>% spread("variable","value")
users <- pg %>% xml_find_all('//DEVICES') %>% map(f)

users <- do.call(rbind, users)


#TOPOLOGIES
f2 <- function(u)
  map_df(xml_children(u), ~list(variable=xml_name(.x), value=xml_text(.x))) %>% spread("variable","value")
users2 <- pg %>% xml_find_all('//TOPOLOGIES') %>% map(f2)

users2 <- do.call(rbind, users2)


#PHASES
f3 <- function(u)
  map_df(xml_children(u), ~list(variable=xml_name(.x), value=xml_text(.x))) %>% spread("variable","value")
users3 <- pg %>% xml_find_all('//PHASES') %>% map(f3)

users3 <- do.call(rbind, users3)

#SYMBOLS
f4 <- function(u)
  map_df(xml_children(u), ~list(variable=xml_name(.x), value=xml_text(.x))) %>% spread("variable","value")
users4 <- pg %>% xml_find_all('//SYMBOLS') %>% map(f4)

users4 <- do.call(rbind, users4)

#LINES
f5 <- function(u)
  map_df(xml_children(u), ~list(variable=xml_name(.x), value=xml_text(.x))) %>% spread("variable","value")
users5 <- pg %>% xml_find_all('//LINES') %>% map(f5)

users5 <- do.call(rbind, users5)














