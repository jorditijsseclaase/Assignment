rm(list=ls())


library(tidyverse)
library(XML)
require(XML)
library(writexl)
library("readxl")
library(dplyr)
library(lubridate)



airquality2013_2018 <- read_excel("Cleaned_Airquality2013_2018.xlsx")

AQI2013_2018 <- read_excel("Cleaned_AQI2013_2018.xlsx")

weather <- read_excel("Cleaned_Weather2013-2018.xlsx")

traffic <- read_excel("Cleaned_Traffic2013-2018.xlsx")

# Add traffic to weather
# Total <- merge(weather,traffic, by="Date")
# Did not work because 1 row was deleted.. so did it manually:
Total <- weather
Total$avg_tr_dist <- traffic$avg_tr_dist
Total$avg_tr_time <- traffic$avg_tr_time
Total$users_Street30 <- traffic$users_Street_30
Total$Vehicles_Km_Branches <- traffic$Vehicles_Km_Branches
Total$Vehicles_Km_Total <- traffic$Vehicles_Km_Total
Total$avg_Speed <- traffic$avg_Speed

# Add polutants
Total$SO2 <- airquality2013_2018$Value[airquality2013_2018$Magnitude==1]
Total$CO <- airquality2013_2018$Value[airquality2013_2018$Magnitude==6]
Total$NO <- airquality2013_2018$Value[airquality2013_2018$Magnitude==7]
Total$NO2 <- airquality2013_2018$Value[airquality2013_2018$Magnitude==8]
Total$PM2.5 <- airquality2013_2018$Value[airquality2013_2018$Magnitude==9]
Total$PM10 <- airquality2013_2018$Value[airquality2013_2018$Magnitude==10]
Total$NOx <- airquality2013_2018$Value[airquality2013_2018$Magnitude==12]
Total$O3 <- airquality2013_2018$Value[airquality2013_2018$Magnitude==14]
Total$TOL <- airquality2013_2018$Value[airquality2013_2018$Magnitude==20]
Total$BEN <- airquality2013_2018$Value[airquality2013_2018$Magnitude==30]
Total$EBE <- airquality2013_2018$Value[airquality2013_2018$Magnitude==35]

#Add AQI
Total$AQI <- AQI2013_2018$AQI




#Reorder data frame
Total <- Total[c("Date", "day", "DayNr","Month","Daytype","Season","Holiday",
                 "T_max","T_min","Avg_T","Streak_max","Rain_ml","Rain","Days_last_rain","Avg_Streak","avg_tr_dist","avg_tr_time",
                 "users_Street30","Vehicles_Km_Branches","Vehicles_Km_Total","avg_Speed",
                 "SO2","CO","NO","NO2","PM2.5","PM10","NOx","O3","TOL","BEN","EBE","AQI"
)]


#Write total to excel file
write_xlsx(Total, "Cleaned_Total.xlsx")




#plot of NO2
ggplot(data = Total) +
  geom_point(mapping = aes(x = Date, y = NO2)) +
  ggtitle("NO2")


#plot of users M30
ggplot(data = Total) +
  geom_point(mapping = aes(x = Date, y =users_Street30, color=Season)) +
  # ylim(0,1.5*10^7)+
  ggtitle("Total users per day M30")

#plot of users M30
ggplot(data = Total) +
  geom_point(mapping = aes(x = Date, y =users_Street30, color=Daytype)) +
  # ylim(0,1.5*10^7)+
  ggtitle("Total users per day M30")




#plot of Vehicles per km M30
ggplot(data = Total) +
  geom_point(mapping = aes(x = Date, y = Vehicles_Km_Total, color=Daytype)) +
  ylim(0,1.5*10^7)+
  ggtitle("Vehicles per km M30")



#plot of avg Speed M30
ggplot(data = Total) +
  geom_point(mapping = aes(x = Date, y = avg_Speed, color=Rain)) +
  # ylim(0,1.5*10^7)+
  ggtitle("Average speed M30")

#Histogram of traffic street 30 2018
hist(Total$users_Street30,
     xlab="Users Street 30",
     main="Histogram Users M30",
     breaks = 30
)





