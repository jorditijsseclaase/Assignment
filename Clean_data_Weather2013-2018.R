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


#Add Holidays

getHoliday <- function(DATES) {
  S_HOL1_2013 <- as.Date("2013-01-01", format = "%Y-%m-%d")
  E_HOL1_2013 <- as.Date("2013-01-06", format  = "%Y-%m-%d")
  
  S_HOL2_2013 <- as.Date("2013-03-22", format = "%Y-%m-%d")
  E_HOL2_2013 <- as.Date("2013-04-01", format  = "%Y-%m-%d")
  
  S_HOL3_2013 <- as.Date("2013-06-14", format = "%Y-%m-%d")
  E_HOL3_2013 <- as.Date("2013-09-09", format  = "%Y-%m-%d")
  
  S_HOL4_2013 <- as.Date("2013-12-21", format = "%Y-%m-%d")
  E_HOL4_2013 <- as.Date("2013-12-31", format  = "%Y-%m-%d")
  
  
  
  S_HOL1_2014 <- as.Date("2014-01-01", format = "%Y-%m-%d")
  E_HOL1_2014 <- as.Date("2014-01-07", format  = "%Y-%m-%d")
  
  S_HOL2_2014 <- as.Date("2014-04-11", format = "%Y-%m-%d")
  E_HOL2_2014 <- as.Date("2014-04-21", format  = "%Y-%m-%d")
  
  S_HOL3_2014 <- as.Date("2014-06-13", format = "%Y-%m-%d")
  E_HOL3_2014 <- as.Date("2014-09-09", format  = "%Y-%m-%d")
  
  S_HOL4_2014 <- as.Date("2014-12-20", format = "%Y-%m-%d")
  E_HOL4_2014 <- as.Date("2014-12-31", format  = "%Y-%m-%d")
  
  
  
  S_HOL1_2015 <- as.Date("2015-01-01", format = "%Y-%m-%d")
  E_HOL1_2015 <- as.Date("2015-01-07", format  = "%Y-%m-%d")
  
  S_HOL2_2015 <- as.Date("2015-03-27", format = "%Y-%m-%d")
  E_HOL2_2015 <- as.Date("2015-04-06", format  = "%Y-%m-%d")
  
  S_HOL3_2015 <- as.Date("2015-06-12", format = "%Y-%m-%d")
  E_HOL3_2015 <- as.Date("2015-09-08", format  = "%Y-%m-%d")
  
  S_HOL4_2015 <- as.Date("2015-12-23", format = "%Y-%m-%d")
  E_HOL4_2015 <- as.Date("2015-12-31", format  = "%Y-%m-%d")
  
  
  
  S_HOL1_2016 <- as.Date("2016-01-01", format = "%Y-%m-%d")
  E_HOL1_2016 <- as.Date("2016-01-07", format  = "%Y-%m-%d")
  
  S_HOL2_2016 <- as.Date("2016-03-18", format = "%Y-%m-%d")
  E_HOL2_2016 <- as.Date("2016-03-29", format  = "%Y-%m-%d")
  
  S_HOL3_2016 <- as.Date("2016-06-10", format = "%Y-%m-%d")
  E_HOL3_2016 <- as.Date("2016-09-08", format  = "%Y-%m-%d")
  
  S_HOL4_2016 <- as.Date("2016-12-23", format = "%Y-%m-%d")
  E_HOL4_2016 <- as.Date("2016-12-31", format  = "%Y-%m-%d")
  
  
  
  S_HOL1_2017 <- as.Date("2017-01-01", format = "%Y-%m-%d")
  E_HOL1_2017 <- as.Date("2017-01-08", format  = "%Y-%m-%d")
  
  S_HOL2_2017 <- as.Date("2017-04-07", format = "%Y-%m-%d")
  E_HOL2_2017 <- as.Date("2017-04-17", format  = "%Y-%m-%d")
  
  S_HOL3_2017 <- as.Date("2017-06-09", format = "%Y-%m-%d")
  E_HOL3_2017 <- as.Date("2017-09-11", format  = "%Y-%m-%d")
  
  S_HOL4_2017 <- as.Date("2017-12-23", format = "%Y-%m-%d")
  E_HOL4_2017 <- as.Date("2017-12-31", format  = "%Y-%m-%d")
  
  
  
  S_HOL1_2018 <- as.Date("2018-01-01", format = "%Y-%m-%d")
  E_HOL1_2018 <- as.Date("2018-01-07", format  = "%Y-%m-%d")
  
  S_HOL2_2018 <- as.Date("2018-03-23", format = "%Y-%m-%d")
  E_HOL2_2018 <- as.Date("2018-04-02", format  = "%Y-%m-%d")
  
  S_HOL3_2018 <- as.Date("2018-06-08", format = "%Y-%m-%d")
  E_HOL3_2018 <- as.Date("2018-09-09", format  = "%Y-%m-%d")
  
  S_HOL4_2018 <- as.Date("2018-12-22", format = "%Y-%m-%d")
  E_HOL4_2018 <- as.Date("2018-12-31", format  = "%Y-%m-%d")
  
  
  
  
  ifelse (weather$Date >= S_HOL1_2013 & weather$Date <= E_HOL1_2013, 1,
          ifelse (weather$Date >= S_HOL2_2013 & weather$Date <= E_HOL2_2013, 1,        
          ifelse (weather$Date >= S_HOL3_2013 & weather$Date <= E_HOL3_2013, 1,
          ifelse (weather$Date >= S_HOL4_2013 & weather$Date <= E_HOL4_2013, 1,

          ifelse (weather$Date >= S_HOL1_2014 & weather$Date <= E_HOL1_2014, 1,       
          ifelse (weather$Date >= S_HOL2_2014 & weather$Date <= E_HOL2_2014, 1,        
          ifelse (weather$Date >= S_HOL3_2014 & weather$Date <= E_HOL3_2014, 1,
          ifelse (weather$Date >= S_HOL4_2014 & weather$Date <= E_HOL4_2014, 1,
                                                                  
          ifelse (weather$Date >= S_HOL1_2015 & weather$Date <= E_HOL1_2015, 1,       
          ifelse (weather$Date >= S_HOL2_2015 & weather$Date <= E_HOL2_2015, 1,        
          ifelse (weather$Date >= S_HOL3_2015 & weather$Date <= E_HOL3_2015, 1,
          ifelse (weather$Date >= S_HOL4_2015 & weather$Date <= E_HOL4_2015, 1,       
          
          ifelse (weather$Date >= S_HOL1_2016 & weather$Date <= E_HOL1_2016, 1,       
          ifelse (weather$Date >= S_HOL2_2016 & weather$Date <= E_HOL2_2016, 1,        
          ifelse (weather$Date >= S_HOL3_2016 & weather$Date <= E_HOL3_2016, 1,
          ifelse (weather$Date >= S_HOL4_2016 & weather$Date <= E_HOL4_2016, 1,          
          
          ifelse (weather$Date >= S_HOL1_2017 & weather$Date <= E_HOL1_2017, 1,       
          ifelse (weather$Date >= S_HOL2_2017 & weather$Date <= E_HOL2_2017, 1,        
          ifelse (weather$Date >= S_HOL3_2017 & weather$Date <= E_HOL3_2017, 1,
          ifelse (weather$Date >= S_HOL4_2017 & weather$Date <= E_HOL4_2017, 1,  
          
          ifelse (weather$Date >= S_HOL1_2018 & weather$Date <= E_HOL1_2018, 1,       
          ifelse (weather$Date >= S_HOL2_2018 & weather$Date <= E_HOL2_2018, 1,        
          ifelse (weather$Date >= S_HOL3_2018 & weather$Date <= E_HOL3_2018, 1,
          ifelse (weather$Date >= S_HOL4_2018 & weather$Date <= E_HOL4_2018, 1,         
          0))))))))))))))))))))))))
  
}

weather$Holiday <- getHoliday(weather$Date)


#Add day of the year
weather$DayNr <- yday(weather$Date)


#Add month seperately
weather$Month <- month(weather$Date)



#write to excel file
write_xlsx(weather, "Cleaned_Weather2013-2018.xlsx")






