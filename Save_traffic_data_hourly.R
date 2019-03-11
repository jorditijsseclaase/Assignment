#Save traffic data and take average per hour

rm(list=ls())

library(XML)
library(xml2)
library(tidyverse)
library(writexl)
library("readxl")


trafficRT_5 <- read_excel("RT_traffic_5min.xlsx")


trafficRT_60 <- data.frame(matrix(ncol = 5))
x<-c("Run_Time","Avg_Total_Veh_Tunnel","Avg_Total_Veh_M30","Avg_Speed_Tunnel","Avg_Speed_Surface")
colnames(trafficRT_60) <- x

trafficRT_60$Run_Time <- Sys.time()
trafficRT_60$Avg_Total_Veh_Tunnel <- mean(trafficRT_5$Total_Veh_Tunnel)
trafficRT_60$Avg_Total_Veh_M30 <- mean(trafficRT_5$Total_Veh_M30)
trafficRT_60$Avg_Speed_Tunnel <- mean(trafficRT_5$Avg_Speed_Tunnel)
trafficRT_60$Avg_Speed_Surface <- mean(trafficRT_5$Avg_Speed_Surface)


#Write to excel file
# write_xlsx(trafficRT_60, "RT_traffic_hourly.xlsx")

trafficRT_60_1 <- read_excel("RT_traffic_hourly.xlsx")
trafficRT_60_1[nrow(trafficRT_60_1) + 1,] = trafficRT_60

write_xlsx(trafficRT_60_1, "RT_traffic_hourly.xlsx")





