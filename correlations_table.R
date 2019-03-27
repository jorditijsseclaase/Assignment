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






























