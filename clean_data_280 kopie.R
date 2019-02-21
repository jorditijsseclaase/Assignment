library(xml2)
library(tidyverse)

pg <- read_xml("~/Desktop/280.xml")

f <- function(u) map_df(xml_children(u), ~list(variable=xml_name(.x), value=xml_text(.x))) %>% spread("variable","value")

users <- pg %>% xml_find_all('//Historico') %>% map(f)
