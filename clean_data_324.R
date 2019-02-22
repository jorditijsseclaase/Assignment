# Traffic. Information in informative panels of variable information in surface
# Works
#Clean environmemnt
rm(list=ls())

library(xml2)
library(tidyverse)

#loading data
pg<- read_xml("Data/324.xml")

f <- function(u)
  map_df(xml_children(u), ~list(variable=xml_name(.x), value=xml_text(.x))) %>% spread("variable","value")
users <- pg %>% xml_find_all('//DEVICES') %>% map(f)

users <- do.call(rbind, users)


#There is more than devices!