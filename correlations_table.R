rm(list=ls())


library(tidyverse)
library(XML)
require(XML)
library(writexl)
library("readxl")



Total <- read_excel("Cleaned_Total.xlsx")




#Reorder data frame
Total <- Total[c("Date", "day", "DayNr","Month","Daytype","Season",
                 "T_max","T_min","Avg_T","Streak_max","Avg_vel","avg_tr_dist","avg_tr_time",
                 "users_Street30","Vehicles_Km_Branches","Vehicles_Km_Total","avg_Speed",
                 "SO2","CO","NO","NO2","PM2.5","PM10","NOx","O3","TOL","BEN","EBE","AQI"
                 )]

#Make everything a number
library(plyr)

Total$Daytype <- revalue(Total$Daytype,
                c("Weekday" = "0", "Weekend" = "1"))
Total$Daytype <- as.numeric(Total$Daytype)


Total$Season <- revalue(Total$Season,
               c("Winter" = "1", "Spring" = "2", "Summer"="3","Fall" = "4"))
Total$Season <- as.numeric(Total$Season)


Total$day <- NULL
Total$Date <- NULL


cor <- cor(Total, use = "pairwise.complete.obs")


#plot month to users m30
ggplot(data = Total) + 
  geom_point(mapping = aes(x=Month, y=users_Street30))+
  ggtitle("Users street 30 to Month")





