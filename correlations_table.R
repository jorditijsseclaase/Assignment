rm(list=ls())


library(tidyverse)
library(writexl)
library("readxl")



Total <- read_excel("Cleaned_Total.xlsx")



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



library(dplyr)
#Correlations table
cor <- cor(Total, use = "pairwise.complete.obs")


# Add T with delay
Total$T_max_d <- lag(Total$T_max, n=1L)
Total$T_min_d <- lag(Total$T_min, n=1L)
Total$Avg_T_d <- lag(Total$Avg_T, n=1L)

# Add polutans with delay
Total$SO2_d <- lag(Total$SO2, n=1L)
Total$CO_d <- lag(Total$CO, n=1L)
Total$NO2_d <- lag(Total$NO2, n=1L)
Total$NO_d <- lag(Total$NO, n=1L)
Total$PM2.5_d<- lag(Total$PM2.5, n=1L)
Total$PM10_d <- lag(Total$PM10, n=1L)
Total$NOx_d <- lag(Total$NOx, n=1L)
Total$O3_d <- lag(Total$O3, n=1L)
Total$TOL_d <- lag(Total$TOL, n=1L)
Total$BEN_d <- lag(Total$BEN, n=1L)
Total$EBE_d <- lag(Total$EBE, n=1L)
Total$AQI_d <- lag(Total$AQI, n=1L)





#plot month to users m30
ggplot(data = Total) + 
  geom_point(mapping = aes(x=Month, y=users_Street30))+
  ggtitle("Users street 30 to Month")


# Make a model
library(mgcv)

# NO2 with NO per day 65,3 %
mod1 = gam(NO2~NO+s(Total$DayNr,k=20,bs="ps"), data=Total)
summary(mod1)
plot(mod1)

# NO2 with T_max per day 36,2%
mod2 = gam(NO2~T_max+s(Total$DayNr,k=20,bs="ps"), data=Total)
summary(mod2)
plot(mod2)

# NO2 with wind speed
mod3 = gam(NO2~Avg_vel+s(Total$DayNr, k=40, bs="ps"), data=Total)
summary(mod3)
plot(mod3)

# PM10 with T_max 30,8%,, this works for all the polutants between 30 and 40%
mod4 = gam(PM10~T_max+s(Total$DayNr,k=20,bs="ps"), data=Total)
summary(mod4)
plot(mod4)

# PM10 with T_max 66,9% but not significant? This is the same for alle the polutants in combination
# with all the traffic data..
mod5 = gam(O3~users_Street30+s(Total$DayNr,k=20,bs="ps"), data=Total)
summary(mod5)
plot(mod5)

# Predict NO2, 54,1 %, O3=70% 
mod6 = gam(NO2~Total$T_max+Total$T_max_d+Total$T_min+Total$T_min_d+Total$Avg_vel+Total$Streak_max+s(Total$users_Street30,k=20,bs="ps")+
             s(Total$DayNr,k=20,bs="ps"), data=Total)
summary(mod6)
plot(mod6)



























