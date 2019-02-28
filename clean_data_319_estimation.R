#Estimation enters and exits M30


#Clean environmemnt
rm(list=ls())


library(tidyverse)
library(XML)
require(XML)

#loading data

pg <- xmlParse("Data/319_Estimation.xml")
EstimationM30 <- xmlToList(pg)
EstimationM30 <- do.call(rbind, EstimationM30)
EstimationM30 <- as.data.frame(EstimationM30)


#Rename columns
colnames(EstimationM30)[1] <- "Entry"
colnames(EstimationM30)[2] <- "Exit"
colnames(EstimationM30)[3] <- "Trav_Dist"
colnames(EstimationM30)[4] <- "Est_act_traffic"
colnames(EstimationM30)[5] <- "Est_hist_data"
colnames(EstimationM30)[6] <- "Est_future_15"
colnames(EstimationM30)[7] <- "Est_future_30"
colnames(EstimationM30)[8] <- "Est_future_45"
colnames(EstimationM30)[9] <- "Est_future_60"




#format date 2nd row
# Update_time <- as.POSIXct(EstimationM30[1],format='%d/%m/%Y %H:%M:%S')
# EstimationM30 <- add_column(EstimationM30,Update_time,.before=entry) 
# traffic$Fecha <- parse_date(traffic$Fecha,format='%d/%m/%Y')

#Remove first to rows
EstimationM30 <- EstimationM30[-c(1,2),]

#remove units from text 3rd column
EstimationM30$Trav_Dist <- parse_number(EstimationM30$Trav_Dist)






