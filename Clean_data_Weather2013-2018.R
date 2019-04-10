#Temperatures and wind in 2013-2018

rm(list=ls())

library(tidyverse)
library(chron)
library(writexl)

#load data
library("readxl")
weather <- read_excel("Data/Weather_2013-2018.xlsx")

#Rename Columns
x<-c("Date","T_max","T_min","Streak_max","Streak_hr","Avg_Streak","Rain_ml")
colnames(weather) <- x


#make characters numbers
weather$T_max <- parse_number(weather$T_max)
weather$T_min <- parse_number(weather$T_min)
weather$Streak_max <- parse_number(weather$Streak_max)
weather$Streak_hr <- NULL
weather$Avg_Streak <- parse_number(weather$Avg_Streak)
weather$Rain_ml <- parse_number(weather$Rain_ml)

#Calculate average temperature
weather$Avg_T <- (weather$T_max+weather$T_min)/2



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


weather$Rain <- ifelse(weather$Rain_ml>0, weather$Rain<-"1" ,"0")
weather$Rain <- as.numeric(weather$Rain)
weather$Rain_ml <- as.numeric(weather$Rain_ml)

#Insert 0 if Rain is NA
weather$Rain[is.na(weather$Rain)] <- "0"


#Calculate days since last rain

weather$Rain2 <- ifelse(weather$Rain_ml>0, weather$Rain2<-"0" ,"1")
weather$Rain2 <- as.numeric(weather$Rain2)
#Insert 0 if Rain is NA
weather$Rain2[is.na(weather$Rain2)] <- "0"


 
weather$Days_last_rain <- with(weather, ave(Rain2, cumsum(Rain2==0), FUN = cumsum))      

weather$Rain2 <- NULL


weather <- weather[c(1,2,3,7,4,5,6,11,12,8,9,10)]

#write to excel file
write_xlsx(weather, "Cleaned_Weather2013-2018.xlsx")






