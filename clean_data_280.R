# Street traffic 30. Historical data of users who have circulated since 2013 
# Works
#Clean environmemnt
rm(list=ls())

library(xml2)
library(tidyverse)
library(readr)




#loading data
  pg<- read_xml("Data/280.xml")
f <- function(u)
  map_df(xml_children(u), ~list(variable=xml_name(.x), value=xml_text(.x))) %>% spread("variable","value")
  traffic <- pg %>% xml_find_all('//Historico') %>% map(f)


#make a dataframe out of list
traffic <- do.call(rbind, traffic)

#Put . everywhere instread of ,
traffic$velocidadMedia <- gsub(",", ".", traffic$velocidadMedia)

#remove units from text 1st column
traffic$distanciaMediaRecorrida <- parse_number(traffic$distanciaMediaRecorrida)

#format date 2nd column
traffic$Fecha <- parse_date(traffic$Fecha,format='%d/%m/%Y')

#remove units from text 4th column
traffic$UsuariosCalle30 <- parse_number(traffic$UsuariosCalle30)

#remove units from text 5th column
traffic$vehxKmRamales <- parse_number(traffic$vehxKmRamales)

#remove units from text 6th column
traffic$vehxKmTotales <- parse_number(traffic$vehxKmTotales)

#remove units from text 6th column
traffic$velocidadMedia <- parse_number(traffic$velocidadMedia)

#Rename Columns
colnames(traffic)[colnames(traffic)=="distanciaMediaRecorrida"] <- "avg_tr_dist"
colnames(traffic)[colnames(traffic)=="Fecha"] <- "Date"
colnames(traffic)[colnames(traffic)=="tiempoMediodeRecorrido"] <- "avg_tr_time"
colnames(traffic)[colnames(traffic)=="UsuariosCalle30"] <- "users_Street_30"
colnames(traffic)[colnames(traffic)=="vehxKmRamales"] <- "Vehicles_Km_Branches"
colnames(traffic)[colnames(traffic)=="vehxKmTotales"] <- "Vehicles_Km_Total"
colnames(traffic)[colnames(traffic)=="velocidadMedia"] <- "avg_Speed"

#Make travel time in seconds 3th column
g <- function(x) as.numeric(gsub("min.*","",x)) * 60 + as.numeric(gsub("seg.*","",gsub(".*min.","",x)))
vg <- Vectorize(g)

traffic %>% mutate(avg_tr_time = vg(avg_tr_time)) -> traffic


#filter for year 2018
traffic <- traffic %>% separate(Date, into = c("Year", "Month", "Day")) 
traffic$Year <- as.numeric(traffic$Year)
traffic$Month <- as.numeric(traffic$Month)
traffic$Day <- as.numeric(traffic$Day)

traffic2018 <- filter(traffic, Year==2018)

#Unite to 1 date
traffic2018 <- traffic2018 %>% unite(Date, Year, Month, Day, sep = "/") 
traffic2018$Date <- as.Date(traffic2018$Date)

#Unite the main file back to 1 date
traffic <- traffic %>% unite(Date, Year, Month, Day, sep = "/") 
traffic$Date <- as.Date(traffic$Date)

##PLOTS


#plot of average travel time (2018)
ggplot(data = traffic2018) + 
  geom_point(mapping = aes(x = Date, y = avg_tr_time)) +
  geom_smooth(mapping = aes(x = Date, y = avg_tr_time))+
  ggtitle("Average travel time (2018)")

#plot of average travel time (2013-2018)
ggplot(data = traffic) + 
  geom_point(mapping = aes(x = Date, y = avg_tr_time)) +
  geom_smooth(mapping = aes(x = Date, y = avg_tr_time))+
  ggtitle("Average travel time (2013-2018)")

#plot of users street 30 (2018)
ggplot(data = traffic2018) + 
  geom_point(mapping = aes(x = Date, y = users_Street_30)) +
  geom_smooth(mapping = aes(x = Date, y = users_Street_30))+
  ggtitle("Users Street 30 (2018)")

#plot of users street 30 (2013-2018)
ggplot(data = traffic) + 
  geom_point(mapping = aes(x = Date, y = users_Street_30)) +
  geom_smooth(mapping = aes(x = Date, y = users_Street_30))+
  ggtitle("Users Street 30 (2013-2018)")

#plot of vehicles*km_branches (2018)
ggplot(data = traffic2018) + 
  geom_point(mapping = aes(x = Date, y = Vehicles_Km_Branches)) +
  geom_smooth(mapping = aes(x = Date, y = Vehicles_Km_Branches))+
  ggtitle("Vehicles*Km Branches (2018)")

#plot of vehicles*km_branches (2013-2018)
ggplot(data = traffic) + 
  geom_point(mapping = aes(x = Date, y = Vehicles_Km_Branches)) +
  geom_smooth(mapping = aes(x = Date, y = Vehicles_Km_Branches))+
  ggtitle("Vehicles*Km Branches (2013-2018)")

#plot of vehicles*km_total (2018)
ggplot(data = traffic2018) + 
  geom_point(mapping = aes(x = Date, y = Vehicles_Km_Total)) +
  geom_smooth(mapping = aes(x = Date, y = Vehicles_Km_Total))+
  ggtitle("Vehicles*Km Total (2018)")

#plot of vehicles*km_total (2013-2018)
ggplot(data = traffic) + 
  geom_point(mapping = aes(x = Date, y = Vehicles_Km_Total)) +
  geom_smooth(mapping = aes(x = Date, y = Vehicles_Km_Total))+
  ggtitle("Vehicles*Km Total (2013-2018)")

#plot of Average speed (2018)
ggplot(data = traffic2018) + 
  geom_point(mapping = aes(x = Date, y = avg_Speed)) +
  geom_smooth(mapping = aes(x = Date, y = avg_Speed))+
  ggtitle("Average speed (2018)")

#plot of vehicles*km_total (2013-2018)
ggplot(data = traffic) + 
  geom_point(mapping = aes(x = Date, y = avg_Speed)) +
  geom_smooth(mapping = aes(x = Date, y = avg_Speed))+
  ggtitle("Average speed (2013-2018)")


#Histogram of traffic street 30 2018
hist(traffic2018$users_Street_30,
     xlab="Users Street 30",
     main="Histogram Users 2018",
     breaks = 30
     )


#Histogram of average travel time 2018
hist(traffic2018$avg_tr_time,
     xlab="Average travel time",
     main="Histogram average travel time 2018",
     breaks = 20
     )







