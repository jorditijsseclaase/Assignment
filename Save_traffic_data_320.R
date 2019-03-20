#320 Real time traffic data to save hourly data

#Run every 5 minutes starting at 5 min after the hour.

rm(list=ls())

library(XML)
library(xml2)
library(tidyverse)
library(writexl)
library("readxl")

library(lubridate)

#Change time zone to central european time
Sys.setenv(TZ='CET')

#loading data
pg<- read_xml("https://datos.madrid.es/egob/catalogo/212117-7899005-trafico-calle30-general.xml")

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


## rebuilt dataframe

trafficRT2 = data.frame(matrix(ncol = 7))
x<-c("Run_Date","Date_Tunnel","Date_Surface","Total_Veh_Tunnel","Total_Veh_M30","Avg_Speed_Tunnel","Avg_Speed_Surface")
colnames(trafficRT2) <- x

trafficRT2$Run_Date <- Sys.time()
trafficRT2$Date_Tunnel <- trafficRT$act.Date[5]
trafficRT2$Date_Surface <- trafficRT$act.Date[6]
trafficRT2$Total_Veh_Tunnel <- trafficRT$Value[1]
trafficRT2$Total_Veh_M30 <- trafficRT$Value[2]
trafficRT2$Avg_Speed_Tunnel <- trafficRT$Value[3]
trafficRT2$Avg_Speed_Surface <- trafficRT$Value[4]



#Write to excel file
# write_csv(trafficRT2, "RT_traffic_5min.csv")


trafficRT3 <- read_csv("RT_traffic_5min.csv")
trafficRT3[nrow(trafficRT3) + 1,] = trafficRT2

#Clear data frame if 1 hour is completed.
if (nrow(trafficRT3)>12){trafficRT3 <- trafficRT3[0,]

} 
#Change time zone of trafficRT3 to Madrid time
trafficRT3 <- with_tz(trafficRT3,"CET")

# write_csv(trafficRT3, "RT_traffic_5min.csv")


trafficRT3











