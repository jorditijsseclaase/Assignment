# Air quality. Hourly data year 2019
# Works
#Clean environmemnt
rm(list=ls())


library(lubridate)
library(tidyverse)
library(writexl)
library("readxl")

#First run hourly_airquality.R

#Read data
airquality_hourly <- read_excel("Cleaned_Airquality_hourly_2019.xlsx")


#make NO2 dataframe with all station

NO2 <- airquality_hourly %>% filter(Magnitude==8)


#DEAL WITH NON VALID MEASUREMENTS
NO2$H01 <- NO2$H01 * ifelse(NO2$V01=="V",1,NA)
NO2$H02 <- NO2$H02 * ifelse(NO2$V02=="V",1,NA)
NO2$H03 <- NO2$H03 * ifelse(NO2$V03=="V",1,NA)
NO2$H04 <- NO2$H04 * ifelse(NO2$V04=="V",1,NA)
NO2$H05 <- NO2$H05 * ifelse(NO2$V05=="V",1,NA)
NO2$H06 <- NO2$H06 * ifelse(NO2$V06=="V",1,NA)
NO2$H07 <- NO2$H07 * ifelse(NO2$V07=="V",1,NA)
NO2$H08 <- NO2$H08 * ifelse(NO2$V08=="V",1,NA)
NO2$H09 <- NO2$H09 * ifelse(NO2$V09=="V",1,NA)
NO2$H10 <- NO2$H10 * ifelse(NO2$V10=="V",1,NA)
NO2$H11 <- NO2$H11 * ifelse(NO2$V11=="V",1,NA)
NO2$H12 <- NO2$H12 * ifelse(NO2$V12=="V",1,NA)
NO2$H13 <- NO2$H13 * ifelse(NO2$V13=="V",1,NA)
NO2$H14 <- NO2$H14 * ifelse(NO2$V14=="V",1,NA)
NO2$H15 <- NO2$H15 * ifelse(NO2$V15=="V",1,NA)
NO2$H16 <- NO2$H16 * ifelse(NO2$V16=="V",1,NA)
NO2$H17 <- NO2$H17 * ifelse(NO2$V17=="V",1,NA)
NO2$H18 <- NO2$H18 * ifelse(NO2$V18=="V",1,NA)
NO2$H19 <- NO2$H19 * ifelse(NO2$V19=="V",1,NA)
NO2$H20 <- NO2$H20 * ifelse(NO2$V20=="V",1,NA)
NO2$H21 <- NO2$H21 * ifelse(NO2$V21=="V",1,NA)
NO2$H22 <- NO2$H22 * ifelse(NO2$V22=="V",1,NA)
NO2$H23 <- NO2$H23 * ifelse(NO2$V23=="V",1,NA)
NO2$H24 <- NO2$H24 * ifelse(NO2$V24=="V",1,NA)

NO2_hour <- NO2 %>% 
  select('Station', 'Date', starts_with('H')) %>% 
  mutate(Date = as.Date(Date)) %>%
  gather(Hour, Value, starts_with('H'))  

# %>%
#   mutate(Hour = strtoi(substring(Hour, 2))) %>%
#   drop_na()

NO2_hour$Hour[NO2_hour$Hour=="H01"] <- 1
NO2_hour$Hour[NO2_hour$Hour=="H02"] <- 2
NO2_hour$Hour[NO2_hour$Hour=="H03"] <- 3
NO2_hour$Hour[NO2_hour$Hour=="H04"] <- 4
NO2_hour$Hour[NO2_hour$Hour=="H05"] <- 5
NO2_hour$Hour[NO2_hour$Hour=="H06"] <- 6
NO2_hour$Hour[NO2_hour$Hour=="H07"] <- 7
NO2_hour$Hour[NO2_hour$Hour=="H08"] <- 8
NO2_hour$Hour[NO2_hour$Hour=="H09"] <- 9
NO2_hour$Hour[NO2_hour$Hour=="H10"] <- 10
NO2_hour$Hour[NO2_hour$Hour=="H11"] <- 11
NO2_hour$Hour[NO2_hour$Hour=="H12"] <- 12
NO2_hour$Hour[NO2_hour$Hour=="H13"] <- 13
NO2_hour$Hour[NO2_hour$Hour=="H14"] <- 14
NO2_hour$Hour[NO2_hour$Hour=="H15"] <- 15
NO2_hour$Hour[NO2_hour$Hour=="H16"] <- 16
NO2_hour$Hour[NO2_hour$Hour=="H17"] <- 17
NO2_hour$Hour[NO2_hour$Hour=="H18"] <- 18
NO2_hour$Hour[NO2_hour$Hour=="H19"] <- 19
NO2_hour$Hour[NO2_hour$Hour=="H20"] <- 20
NO2_hour$Hour[NO2_hour$Hour=="H21"] <- 21
NO2_hour$Hour[NO2_hour$Hour=="H22"] <- 22
NO2_hour$Hour[NO2_hour$Hour=="H23"] <- 23
NO2_hour$Hour[NO2_hour$Hour=="H24"] <- 24

NO2_hour$Hour <- as.numeric(NO2_hour$Hour)



NO2_hour <- NO2_hour%>% 
  # drop_na() %>%
  mutate(Date = as.Date(Date)) %>% 
  group_by(Date, Hour) %>% 
  summarise(mean = mean(Value,na.rm=TRUE)) %>% 
  ungroup()




#Week day or weekend day
NO2_hour$day <- weekdays.Date(NO2_hour$Date, abbr = TRUE)
NO2_hour$Daytype <- ifelse(NO2_hour$day=="za" | NO2_hour$day=="zo",
                           NO2_hour$Daytype<- "Weekend","Weekday")


ggplot(data =NO2_hour,aes(x = Hour, y = mean)) +
  geom_point()+
  stat_smooth()+
  ylab("NO2 concentration")

ggplot(data =NO2_hour,aes(x = Hour, y = mean,color=Daytype)) +
  geom_point()+
  stat_smooth()+
  ylab("NO2 concentration")



#Write to csv
write_xlsx(NO2_hour, "Cleaned_NO2_hourly_2019.xlsx")













NO2_test <- NO2[,c("Date","H01",
                   "H02",
                   "H03",
                   "H04",
                   "H05",
                   "H06",
                   "H07",
                   "H08",
                   "H09",
                   "H10",
                   "H11",
                   "H12",
                   "H13",
                   "H14",
                   "H15",
                   "H16",
                   "H17",
                   "H18",
                   "H19",
                   "H20",
                   "H21",
                   "H22",
                   "H23",
                   "H24")]





#Max NO2 of all hours
NO2_test$Max_day <- apply(NO2_test[,-1],1,max,na.rm=TRUE) 



#Hour with max NO2
NO2_test$Max_NO2_hour <- colnames(NO2_test)[apply(NO2_test,1,which.max)]

NO2_test$Max_NO2_hour[NO2_test$Max_NO2_hour=="H01"] <- 1
NO2_test$Max_NO2_hour[NO2_test$Max_NO2_hour=="H02"] <- 2
NO2_test$Max_NO2_hour[NO2_test$Max_NO2_hour=="H03"] <- 3
NO2_test$Max_NO2_hour[NO2_test$Max_NO2_hour=="H04"] <- 4
NO2_test$Max_NO2_hour[NO2_test$Max_NO2_hour=="H05"] <- 5
NO2_test$Max_NO2_hour[NO2_test$Max_NO2_hour=="H06"] <- 6
NO2_test$Max_NO2_hour[NO2_test$Max_NO2_hour=="H07"] <- 7
NO2_test$Max_NO2_hour[NO2_test$Max_NO2_hour=="H08"] <- 8
NO2_test$Max_NO2_hour[NO2_test$Max_NO2_hour=="H09"] <- 9
NO2_test$Max_NO2_hour[NO2_test$Max_NO2_hour=="H10"] <- 10
NO2_test$Max_NO2_hour[NO2_test$Max_NO2_hour=="H11"] <- 11
NO2_test$Max_NO2_hour[NO2_test$Max_NO2_hour=="H12"] <- 12
NO2_test$Max_NO2_hour[NO2_test$Max_NO2_hour=="H13"] <- 13
NO2_test$Max_NO2_hour[NO2_test$Max_NO2_hour=="H14"] <- 14
NO2_test$Max_NO2_hour[NO2_test$Max_NO2_hour=="H15"] <- 15
NO2_test$Max_NO2_hour[NO2_test$Max_NO2_hour=="H16"] <- 16
NO2_test$Max_NO2_hour[NO2_test$Max_NO2_hour=="H17"] <- 17
NO2_test$Max_NO2_hour[NO2_test$Max_NO2_hour=="H18"] <- 18
NO2_test$Max_NO2_hour[NO2_test$Max_NO2_hour=="H19"] <- 19
NO2_test$Max_NO2_hour[NO2_test$Max_NO2_hour=="H20"] <- 20
NO2_test$Max_NO2_hour[NO2_test$Max_NO2_hour=="H21"] <- 21
NO2_test$Max_NO2_hour[NO2_test$Max_NO2_hour=="H22"] <- 22
NO2_test$Max_NO2_hour[NO2_test$Max_NO2_hour=="H23"] <- 23
NO2_test$Max_NO2_hour[NO2_test$Max_NO2_hour=="H24"] <- 24

NO2_test$Max_NO2_hour <- as.numeric(NO2_test$Max_NO2_hour)



#Histograms
hist(NO2_test$Max_day,
     xlim=c(0,500),
     breaks=100,
     main="Histogram of max NO2 concentration per day")

hist(NO2_test$Max_NO2_hour,
     breaks=20,
     main="Histogram of hours with max NO2 concentration")

NO2$Max_day <- NO2_test$Max_day

NO2_new <- NO2[,c("Date","Station","Max_day")]

NO2_new2 <- NO2_new %>% 
  group_by_at(vars(-Max_day)) %>%  # group by everything other than the value column. 
  mutate(row_id=1:n()) %>% ungroup() %>%  # build group index
  spread(Station, Max_day) %>%    # spread
  select(-row_id)  # drop the index


#remove -inf values
is.na(NO2_new2) <- sapply(NO2_new2, is.infinite)


#Average NO2 of all stations
NO2_new2$avg_NO2 <- rowMeans(NO2_new2[,c(2:25)],na.rm=TRUE)

#Max NO2 of all stations
NO2_new2$max_NO2 <- apply(NO2_new2[,-1],1,max,na.rm=TRUE) 

#Station with max NO2
NO2_new2$max_NO2_station <- colnames(NO2_new2)[apply(NO2_new2,1,which.max)]




#Number of stations less then 50
NO2_new2$num_stations_NO2_max_50 <- apply(NO2_new2[,c(2:25)], 1 ,function(x)sum(x<50,na.rm=T))
#Number of stations between 50 and 100
NO2_new2$num_stations_NO2_50_100 <- apply(NO2_new2[,c(2:25)], 1 ,function(x)sum(x>50&x<100,na.rm=T))

#Number of stations between 100 and 180
NO2_new2$num_stations_NO2_100_180 <- apply(NO2_new2[,c(2:25)], 1 ,function(x)sum(x>100&x<180,na.rm=T))

#Number of stations between 180 and 200
NO2_new2$num_stations_NO2_180_200 <- apply(NO2_new2[,c(2:25)], 1 ,function(x)sum(x>180&x<200,na.rm=T))

#Number of stations between 200 and 400
NO2_new2$num_stations_NO2_200_400 <- apply(NO2_new2[,c(2:25)], 1 ,function(x)sum(x>200&x<400,na.rm=T))

#Number of stations between 100 and 180
NO2_new2$num_stations_NO2_min_400 <- apply(NO2_new2[,c(2:25)], 1 ,function(x)sum(x>400,na.rm=T))






