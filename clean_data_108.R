# Air quality. Data per hour years 2001-2018  (2018)
# Doesn't work

library(xml2)
library(tidyverse)

pg <- read_xml("~/Documents/TUe/Jaar 6/Internship/Assignment/Data/108/abr_mo18.xml")

f <- function(u)
  map_df(xml_children(u), ~list(variable=xml_name(.x), value=xml_text(.x))) %>% spread("variable","value")
users <- pg %>% xml_find_all('//Dato_Horario') %>% map(f)

users <- do.call(rbind, users)