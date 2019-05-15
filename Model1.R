#Clean environment
rm(list=ls())


library(tidyverse)
library(XML)
require(XML)
library(writexl)
library("readxl")
# library(dplyr)
library(plyr)
library(lubridate)

library(mgcv)

#Load total data
Total <- read_excel("NN_2.xlsx")


#Load hourly data
Total_hourly <- read_excel("NN_hourly.xlsx")
NO2_Max <- read_excel("NN_max_NO2.xlsx")


#### MODEL to predict NO2 on daily data


#extra variables

#day number from start to end
Total$b = 1:nrow(Total)

#total number of vehicles scaled
Total$tvk <- Total$Vehicles_Km_Total/max(Total$Vehicles_Km_Total)


## DELAY information with one day

#Average_Max_NO2 concentration previous day

#NO2
Total$NO2_prev <- lag(Total$Avg_Max_NO2, n=1L)

#Rain ml
Total$Rain_ml_prev <- lag(Total$Rain_ml, n=1L)

#Rain y/n
Total$Rain_prev <- lag(Total$Rain, n=1L)

#Streak min
Total$Streak_min_prev <- lag(Total$Streak_min, n=1L)

#Streak max
Total$Streak_max_prev <- lag(Total$Streak_max, n=1L)

#Streak avg
Total$Avg_Streak_prev <- lag(Total$Avg_Streak, n=1L)

#Streak dir
Total$Dir_Streak_prev <- lag(Total$Dir_Streak, n=1L)

#T max
Total$T_max_prev <- lag(Total$T_max, n=1L)

#T min
Total$T_min_prev <- lag(Total$T_min, n=1L)

#T avg
Total$Avg_T_prev <- lag(Total$Avg_T, n=1L)






Everything with normal data, 69,8%
mod1 = gam(Avg_Max_NO2 ~ s(Avg_Streak, k = 20, bs = "ps") +
             # s(Streak_max, k = 20, bs = "ps") + #NOT SIGN
             s(Streak_min, k = 20, bs = "ps") +
             s(Dir_Streak, k = 20, bs = "ps") +
             s(T_max, k = 20, bs = "ps") +
             s(T_min, k = 20, bs = "ps") +
             # s(Avg_T, k = 20, bs = "ps") + #NOT SIGN
             s(Rain_ml, k = 20, bs = "ps") +
             # factor(Rain) + #NOT SIGN
             # Days_last_rain + #NOT SIGN
             # Season + #NOT SIGN
             factor(Daytype) + factor(Holiday) +
             s(DayNr, k = 40, bs = "ps") +
             # s(b, k = 20, bs = "ps") + #NOT SIGN
             s(NO2_prev, k = 20, bs = "ps")
             # tvk #NOT SIGN
            , data=Total)

summary(mod1)
# plot(mod1)


Everything with data of previous day, 55,4%
mod2 = gam(Avg_Max_NO2 ~ s(Avg_Streak_prev, k = 20, bs = "ps") +
             s(Streak_max_prev, k = 20, bs = "ps") +
             # s(Streak_min_prev, k = 20, bs = "ps") +#NOT SIGN
             s(Dir_Streak_prev, k = 20, bs = "ps") +
             s(T_max_prev, k = 20, bs = "ps") +
             # s(T_min_prev, k = 20, bs = "ps") +#NOT SIGN
             s(Avg_T_prev, k = 20, bs = "ps") +
             # s(Rain_ml_prev, k = 20, bs = "ps") +#NOT SIGN
             # factor(Rain_prev) + #NOT SIGN
             Days_last_rain +
             # Season + #NOT SIGN
             factor(Daytype) + factor(Holiday) +
             s(DayNr, k = 40, bs = "ps") +
             s(b, k = 20, bs = "ps") +
             s(NO2_prev, k = 20, bs = "ps")
            # tvk #NOT SIGN
           , data=Total)

summary(mod2)
# plot(mod2)



#Both models together 71,2%
mod3 = gam(Avg_Max_NO2 ~ s(Avg_Streak, k = 20, bs = "ps") +
              s(Streak_max, k = 20, bs = "ps") + 
              s(Streak_min, k = 20, bs = "ps") +
              s(Dir_Streak, k = 20, bs = "ps") +
              s(T_max, k = 20, bs = "ps") +
              s(T_min, k = 20, bs = "ps") +
              s(Avg_T, k = 20, bs = "ps") + 
              s(Rain_ml, k = 20, bs = "ps") +
              # factor(Rain) + 
              Days_last_rain + 
              # Season + #NOT SIGN
              factor(Daytype) + factor(Holiday) +
              s(DayNr, k = 40, bs = "ps") +
              # s(b, k = 20, bs = "ps") + #NOT SIGN
              s(NO2_prev, k = 20, bs = "ps") +
              # tvk + #NOT SIGN  
             
              # s(Avg_Streak_prev, k = 20, bs = "ps") + #NOT SIGN
              # s(Streak_max_prev, k = 20, bs = "ps") + #NOT SIGN
              s(Streak_min_prev, k = 20, bs = "ps") + 
              # s(Dir_Streak_prev, k = 20, bs = "ps") + #NOT SIGN
              s(T_max_prev, k = 20, bs = "ps") + 
              # s(T_min_prev, k = 20, bs = "ps") + #NOT SIGN
              s(Avg_T_prev, k = 20, bs = "ps") 
              # s(Rain_ml_prev, k = 20, bs = "ps") + #NOT SIGN
              # factor(Rain_prev) #NOT SIGN
              ,data=Total)
             

summary(mod3)
# plot(mod3)


#### Model to predit NO2 on hourly data

#make variables numeric

Total_hourly$Daytype <- revalue(Total_hourly$Daytype,
                      c("Weekday" = "0", "Weekend" = "1"))
Total_hourly$Daytype <- as.numeric(Total_hourly$Daytype)

#add day number of the year
Total_hourly$DayNr <- yday(Total_hourly$RunDate)




#### MODEL

        
mod5 = gam(NO2 ~ te(Avg_Total_Veh_M30, Avg_Speed_Surface, by=factor(Daytype), k = 10, bs = "ps")+
             #s(Avg_Speed_Surface, by=factor(Daytype), k = 20, bs = "ps")+
             # factor(Daytype)+
             s(Hour, k = 20, bs = "ps")+
             #s(DayNr, k = 5, bs = "ps")+
             s(T, k = 20, bs = "ps")+
             # s(Rain_ml, k = 20, bs = "ps")+
             # factor(Rain)+
             s(Wind, k = 20, bs = "ps")+
             s(Wind_dir, k = 20, bs = "ps")
           ,data=Total_hourly)
summary(mod5)



vis.gam(mod5,view=c("Avg_Total_Veh_M30","Avg_Speed_Surface"),theta=45)

plot(mod5)










