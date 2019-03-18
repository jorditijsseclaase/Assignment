rm(list=ls())


library(tidyverse)
library(XML)
require(XML)
library(writexl)
library("readxl")


Total <- read_excel("Cleaned_Total.xlsx")

#plot of AQI to users street 30
ggplot(data = Total) + 
  geom_point(mapping = aes(x=users_Street30, y=AQI))+
  # geom_smooth(mapping = aes(x= Date, y=AQI))+
        ylim(0,500)+
  ggtitle("Users street 30 to AQI")


#plot of PM10 to users street 30
ggplot(data = Total) + 
  geom_point(mapping = aes(x=users_Street30, y=PM10))+
  # geom_smooth(mapping = aes(x= Date, y=AQI))+
  # ylim(0,500)+
  ggtitle("Users street 30 to PM10")


#plot of PM2.5 to users street 30
ggplot(data = Total) + 
  geom_point(mapping = aes(x=users_Street30, y=PM2.5))+
  # geom_smooth(mapping = aes(x= Date, y=AQI))+
  # ylim(0,500)+
  ggtitle("Users street 30 to PM2.5")

#plot of AQI to users street 30
ggplot(data = Total) + 
  geom_point(mapping = aes(x=avg_Speed, y=AQI))+
  # geom_smooth(mapping = aes(x= Date, y=AQI))+
  ylim(0,500)+
  ggtitle("Average speed to AQI")

#plot of NO2 to users street 30
ggplot(data = Total) + 
  geom_point(mapping = aes(x=users_Street30, y=NO2))+
  # geom_smooth(mapping = aes(x= Date, y=AQI))+
  # ylim(0,500)+
  ggtitle("Users street 30 to NO2")


#plot of AQI to average T
ggplot(data = Total) + 
  geom_point(mapping = aes(x=Avg_T, y=AQI))+
  # geom_smooth(mapping = aes(x= Date, y=AQI))+
  ylim(0,500)+
  ggtitle("Avg T to AQI")


#plot of NO2 to average T
ggplot(data = Total) + 
  geom_point(mapping = aes(x=Avg_T, y=NO2))+
  # geom_smooth(mapping = aes(x= Date, y=AQI))+
  # ylim(0,500)+
  ggtitle("Avg T to NO2")
















