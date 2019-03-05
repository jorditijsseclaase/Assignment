#Temperatures and wind in 2013-2018

rm(list=ls())

library(tidyverse)
library(chron)

#load data
library("readxl")
weather <- read_excel("Data/Weather_2013-2018.xlsx")

#Rename Columns
x<-c("Date","T_max","T_min","Streak_max","Streak_hr","Avg_vel")
colnames(weather) <- x


#make characters numbers
weather$T_max <- parse_number(weather$T_max)
weather$T_min <- parse_number(weather$T_min)
weather$Streak_max <- parse_number(weather$Streak_max)
weather$Streak_hr <- NULL
weather$Avg_vel <- parse_number(weather$Avg_vel)

#Calculate average temperature
weather$Avg_T <- (weather$T_max+weather$T_min)/2

weather <- weather[c(1,2,3,6,4,5)]


#Week day or weekend day
weather$day <- weekdays.Date(weather$Date, abbr = TRUE)
weather$weekend <- ifelse(weather$day=="za" | weather$day=="zo",weather$weekend<-1,0)



#plot of average Temperature (2013-2018)
ggplot(data = weather) + 
  geom_point(mapping = aes(x = Date, y = Avg_T)) +
  geom_smooth(mapping = aes(x = Date, y = Avg_T))+
  ggtitle("Average temperature (2013-2018)")

#plot of average Wind velocity (2013-2018)
ggplot(data = weather) + 
  geom_point(mapping = aes(x = Date, y = Avg_vel)) +
  geom_smooth(mapping = aes(x = Date, y = Avg_vel))+
  ggtitle("Average Wind velocity (2013-2018)")




