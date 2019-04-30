#hourly total analysis

#Clean environment
rm(list=ls())

library(readxl)
library(writexl)
library(ggplot2)

weather_hourly <- read_excel("Cleaned_Weather_hourly.xlsx") #only from 15-4-2019
traffic_hourly <- read_excel("Cleaned_traffic_hourly.xlsx")
NO2_hourly <- read_excel("Cleaned_NO2_hourly_2019.xlsx")

# NO2_hourly=as.data.frame(NO2_hourly)

NO2_hourly$day <- NULL
NO2_hourly$Daytype <- NULL

colnames(NO2_hourly)[colnames(NO2_hourly)=="mean"] <- "NO2"


NO2_hourly$Hour[NO2_hourly$Hour==24] <- 0

#Convert NO2 dataframe to right time (24 to 0)
library(lubridate)

NO2_hourly$Date[NO2_hourly$Hour==0] <- NO2_hourly$Date[NO2_hourly$Hour==0] + days(1)



#subset to get same dates
traffic_hourly2 <- subset(traffic_hourly, RunDate> "2019-03-28" & RunDate<"2019-04-01")
weather_hourly2 <- subset(weather_hourly,Date>"2019-03-28" & Date<"2019-04-01")
NO2_hourly2 <- subset(NO2_hourly, Date> "2019-03-28" & Date<"2019-04-01")

weather_hourly2$Date <- NULL
weather_hourly2$Hour <- NULL
NO2_hourly2$Date <- NULL
NO2_hourly2$Hour <- NULL



#bind together
Total <- cbind(traffic_hourly2,weather_hourly2,NO2_hourly2)

#rename columns traffic
colnames(Total)[colnames(Total)=="Temperature  [2 m above gnd]"] <- "T"
colnames(Total)[colnames(Total)=="Total Precipitation (high resolution)  [sfc]"] <- "Rain(ml)"
colnames(Total)[colnames(Total)== "Wind Speed  [10 m above gnd]"] <- "Wind"
colnames(Total)[colnames(Total)=="Wind Direction  [10 m above gnd]"] <- "Wind_dir"


#plots

ggplot(data =Total,aes(x = Hour, y = NO2)) +
  geom_point()+
  stat_smooth()+
  ylab("NO2 concentration")

ggplot(data =Total,aes(x = Hour, y = NO2,color=Daytype)) +
  geom_point()+
  stat_smooth()+
  ylab("NO2 concentration")


#Correlation plots
ggplot(data =Total,aes(x = NO2, y = T)) +
  geom_point()+
  stat_smooth()
  # ylab("")





