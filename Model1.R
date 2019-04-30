#Clean environment
rm(list=ls())


library(tidyverse)
library(XML)
require(XML)
library(writexl)
library("readxl")
library(dplyr)
library(lubridate)

library(mgcv)

Total <- read_excel("NN_2.xlsx")



# #MODEL to predict NO2


#extra variables

#day number from start to end
Total$b = 1:nrow(Total)

#total number of vehicles scaled
Total$tvk <- Total$Vehicles_Km_Total/max(Total$Vehicles_Km_Total)

#Average_Max_NO2 concentration previous day
# NO2_yest <- Total$Avg_Max_NO2[-nrow(Total)]
Total$NO2_yest <- lag(Total$Avg_Max_NO2, n=1L)





mod1 = gam(Avg_Max_NO2 ~ s(Avg_Streak, k = 20, bs = "ps") + s(DayNr, k = 40, bs = "ps") + s(b, k = 20, bs = "ps") + s(T_max, k = 20, bs = "ps") + 
             factor(Rain) + factor(Daytype) + factor(Holiday) + tvk + s(NO2_yest, k = 20, bs = "ps"), data=Total)
summary(mod1)
plot(mod1)



mod2 = gam(Avg_Max_NO2 ~ s(Avg_Streak, k = 20, bs = "ps") + 
             # s(Streak_max, k = 20, bs = "ps") + #NOT SIGN
             s(Streak_min, k = 20, bs = "ps") + 
             s(Avg_Streak, k = 20, bs = "ps") + 
             s(Dir_Streak, k = 20, bs = "ps") + 
             s(T_max, k = 20, bs = "ps") + 
             s(T_min, k = 20, bs = "ps") +
             # s(Avg_T, k = 20, bs = "ps") + #NOT SIGN
             s(Rain_ml, k = 20, bs = "ps") +
             factor(Rain) + #NOT SIGN
             # Days_last_rain + #NOT SIGN
             # Season + #NOT SIGN
             factor(Daytype) + factor(Holiday) +
             s(DayNr, k = 40, bs = "ps") + 
             # s(b, k = 20, bs = "ps") + #NOT SIGN
             s(NO2_yest, k = 20, bs = "ps") +
             # tvk #NOT SIGN
            , data=Total)

summary(mod2)
plot(mod2)




#if max temperature rises, NO2 concentration rises, but if min temperature rises, NO2 concentration decreases!
# if we add avg_T instead of min and max, we see a rising NO2 concentration with a rising temperature. but adding T-min and T_max gives a better result.





