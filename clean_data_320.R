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



# Date format first column
a <- as.POSIXct(users$Date,format="%Y-%m-%d %H:%M:%S") # Produces NA when format is not "%Y-%m-%d %H:%M:%S"
b <- as.POSIXct(users$Date,format="%d/%m/%Y %H:%M:%S") # Produces NA when format is not "%d/%m/%Y %H:%M:%S"
a[is.na(a)] <- b[!is.na(b)] # Combine both while keeping their ranks
users$Date <- a # Put it back in your dataframe


# users$Value <- as.POSIXct(users$Value,format="%d/%m/%Y %H:%M:%S")
# users$Value <- as.numeric(users$Value)


# Convert Chr to Date and Number in 3rd column
c <- as.POSIXct(users$Value,format="%d/%m/%Y %H:%M:%S") #produces NA when format is not a date
d <- as.numeric(users$Value) #produces NA when format is a date
c[is.na(c)] <- d[!is.na(d)] # Combine both while keeping their ranks
users$Value <- c # Put it back in your dataframe








