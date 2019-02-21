# Traffic. Information in informative panels of variable information in surface
# Works

library(xml2)
library(tidyverse)

pg<- read_xml("~/Documents/TUe/Jaar 6/Internship/Assignment/Data/324.xml")




f <- function(u)
  map_df(xml_children(u), ~list(variable=xml_name(.x), value=xml_text(.x))) %>% spread("variable","value")
users <- pg %>% xml_find_all('//DEVICES') %>% map(f)

users <- do.call(rbind, users)

#There is more than devices!