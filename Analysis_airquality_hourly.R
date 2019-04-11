# Air quality. Hourly data years 2013-2018
# Works
#Clean environmemnt
rm(list=ls())


library(tidyverse)
library(writexl)
library("readxl")

#Read data
airquality_hourly <- read_excel("Cleaned_Airquality_hourly_2013_2018.xlsx")


#make NO2 dataframe with all station

NO2 <- filter(airquality_hourly, Magnitude==8)


#DEAL WITH NON VALID MEASUREMENTS
# ifelse(NO2$V01=="N",NO2$H01<-NA, NO2$H01 <- NO2$H0)








NO2_test <- NO2[,c("Date","H01","V01",
                          "H02","V02",
                           "H03","V03",
                           "H04","V04",
                           "H05","V05",
                           "H06","V06",
                           "H07","V07",
                           "H08","V08",
                           "H09","V09",
                           "H10","V10",
                           "H11","V11",
                           "H12","V12",
                           "H13","V13",
                           "H14","V14",
                           "H15","V15",
                           "H16","V16",
                           "H17","V17",
                           "H18","V18",
                           "H19","V19",
                           "H20","V20",
                           "H21","V21",
                           "H22","V22",
                           "H23","V23",
                           "H24","V24")]

NO2_test$V01 <- NULL
NO2_test$V02 <- NULL
NO2_test$V03 <- NULL
NO2_test$V04 <- NULL
NO2_test$V05 <- NULL
NO2_test$V06 <- NULL
NO2_test$V07 <- NULL
NO2_test$V08 <- NULL
NO2_test$V09 <- NULL
NO2_test$V10 <- NULL
NO2_test$V11 <- NULL
NO2_test$V12 <- NULL
NO2_test$V13 <- NULL
NO2_test$V14 <- NULL
NO2_test$V15 <- NULL
NO2_test$V16 <- NULL
NO2_test$V17 <- NULL
NO2_test$V18 <- NULL
NO2_test$V19 <- NULL
NO2_test$V20 <- NULL
NO2_test$V21 <- NULL
NO2_test$V22 <- NULL
NO2_test$V23 <- NULL
NO2_test$V24 <- NULL



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
     breaks=400)

hist(NO2_test$Max_NO2_hour,
     breaks=20)

NO2$Max_day <- NO2_test$Max_day

NO2_new <- NO2[,c("Date","Station","Max_day")]

NO2_new2 <- NO2_new %>% 
  group_by_at(vars(-Max_day)) %>%  # group by everything other than the value column. 
  mutate(row_id=1:n()) %>% ungroup() %>%  # build group index
  spread(Station, Max_day) %>%    # spread
  select(-row_id)  # drop the index


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
NO2_new2$num_stations_NO2_100_180 <- apply(NO2_new2[,c(2:25)], 1 ,function(x)sum(x>180&x<200,na.rm=T))

#Number of stations between 200 and 400
NO2_new2$num_stations_NO2_200_400 <- apply(NO2_new2[,c(2:25)], 1 ,function(x)sum(x>200&x<400,na.rm=T))

#Number of stations between 100 and 180
NO2_new2$num_stations_NO2_min_400 <- apply(NO2_new2[,c(2:25)], 1 ,function(x)sum(x>400,na.rm=T))












