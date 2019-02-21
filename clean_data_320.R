# Street traffic 30. Traffic data and real-time traffic status 
# Works

library(xml2)
library(tidyverse)

  pg<- read_xml("~/Documents/TUe/Jaar 6/Internship/Assignment/Data/320.xml")




f <- function(u)
  map_df(xml_children(u), ~list(variable=xml_name(.x), value=xml_text(.x))) %>% spread("variable","value")
  users <- pg %>% xml_find_all('//DatoGlobal') %>% map(f)

  users[7] <- NULL
  users <- do.call(rbind, users)
  
  #format date 2nd column
  # users$FECHA(1) <- as.POSIXct(users$FECHA,format='%Y-%m-%d %H:%M:%S')