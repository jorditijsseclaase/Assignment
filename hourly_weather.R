#Weather data hourly from 15 april to 29 april

#Clean environment
rm(list=ls())

library(readxl)
library(writexl)

#load data
weather_hourly <- read_excel("Data/Weather/hourly_weather_27-03-2019.xlsx")

#unite date
weather_hourly <- weather_hourly %>% unite(Date, Year, Month, Day, sep = "/") 
weather_hourly$Date <- as.Date(weather_hourly$Date)


#make data numeric
weather_hourly$`Temperature  [2 m above gnd]` <- as.numeric(weather_hourly$`Temperature  [2 m above gnd]`)
weather_hourly$`Total Precipitation (high resolution)  [sfc]` <- as.numeric(weather_hourly$`Total Precipitation (high resolution)  [sfc]`)
weather_hourly$`Wind Speed  [10 m above gnd]` <- as.numeric(weather_hourly$`Wind Speed  [10 m above gnd]`)
weather_hourly$`Wind Direction  [10 m above gnd]` <- as.numeric(weather_hourly$`Wind Direction  [10 m above gnd]`)

weather_hourly$Minute <- NULL



#write to excel file
write_xlsx(weather_hourly, "Cleaned_Weather_hourly.xlsx")
