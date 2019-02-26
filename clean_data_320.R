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
  trafficRT <- pg %>% xml_find_all('//DatoGlobal') %>% map(f)

  trafficRT[7] <- NULL
  trafficRT <- do.call(rbind, trafficRT)
  
#Rename Columns
colnames(trafficRT)[colnames(trafficRT)=="FECHA"] <- "Date"
colnames(trafficRT)[colnames(trafficRT)=="Nombre"] <- "Name"
colnames(trafficRT)[colnames(trafficRT)=="VALOR"] <- "Chr"



# Date format first column
a <- as.POSIXct(trafficRT$Date,format="%Y-%m-%d %H:%M:%S") # Produces NA when format is not "%Y-%m-%d %H:%M:%S"
b <- as.POSIXct(trafficRT$Date,format="%d/%m/%Y %H:%M:%S") # Produces NA when format is not "%d/%m/%Y %H:%M:%S"
a[is.na(a)] <- b[!is.na(b)] # Combine both while keeping their ranks
trafficRT$Date <- a # Put it back in your dataframe



# Convert Chr to Date and Number in 3rd column
act.Date <- as.POSIXct(trafficRT$Chr,format="%d/%m/%Y %H:%M:%S") #produces NA when format is not a date
Value <- as.numeric(trafficRT$Chr) #produces NA when format is a date
trafficRT <- add_column(trafficRT,act.Date,Value) 
trafficRT <- select(trafficRT, -starts_with('Chr'))







