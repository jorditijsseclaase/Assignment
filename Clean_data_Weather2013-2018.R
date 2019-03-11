#Temperatures and wind in 2013-2018

rm(list=ls())

library(tidyverse)
library(chron)
library(writexl)

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
weather$Daytype <- ifelse(weather$day=="za" | weather$day=="zo",weather$Daytype<- "Weekend","Weekday")


#Season
getSeason <- function(DATES) {
  WS <- as.Date("2012-12-21", format = "%Y-%m-%d") # Winter 
  SE <- as.Date("2012-3-21",  format = "%Y-%m-%d") # Spring 
  SS <- as.Date("2012-6-21",  format = "%Y-%m-%d") # Summer 
  FE <- as.Date("2012-9-21",  format = "%Y-%m-%d") # Fall 

  d <- as.Date(strftime(DATES, format="2012-%m-%d"))

ifelse (d >= WS | d < SE, "Winter",
        ifelse (d >= SE & d < SS, "Spring",
                ifelse (d >= SS & d < FE, "Summer", "Fall")))
}
weather$Season <- getSeason(weather$Date)


#write to excel file
write_xlsx(weather, "Cleaned_Weather2013-2018.xlsx")






