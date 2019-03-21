#Save traffic data and take average per hour

#Run every hour starting 1 minute after the hour

rm(list=ls())

library(XML)
library(xml2)
library(tidyverse)
library(writexl)
library("readxl")

day <- function(date) strtoi(format(as.Date(date), "%y%m%d"))

#read the file in the correct Madrid time zone
trafficRT_5 <- with_tz(read_csv("RT_traffic_5min.csv"),"CET")

# set my_time to the beggining of current hour
my_time <- Sys.time()
minute(my_time) <- 0
second(my_time) <- 0

# filter all rows with time before this hour
new_df <- trafficRT_5 %>% filter(Run_Date < my_time) %>% mutate(day=day(Run_Date), hour=hour(Run_Date))
new_df <- new_df %>% group_by(day, hour) %>% summarise_all(mean) %>% ungroup()
new_df <- new_df %>% select(Run_Date, Total_Veh_Tunnel, Total_Veh_M30, Avg_Speed_Tunnel, Avg_Speed_Surface)
minute(new_df$Run_Date) <- 0
second(new_df$Run_Date) <- 0

write_csv(new_df, "RT_traffic_hourly.csv", append = T)

# filter all rows with time after this hour
old_df <- trafficRT_5 %>% filter(Run_Date >= my_time)
write_csv(old_df, "RT_traffic_5min.csv")