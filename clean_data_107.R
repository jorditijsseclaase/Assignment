# Air quality. Daily data years 2001-2018  (2018)
# Works
#Clean environmemnt
rm(list=ls())


library(tidyverse)
library(XML)
require(XML)

#loading data
pg <- xmlParse("Data/107_2018.xml")
airquality <- xmlToList(pg)
airquality <- do.call(rbind, airquality)
airquality <- as.data.frame(airquality)

#Tidying data
rownames(airquality) <- NULL

airquality2 <- airquality[FALSE,1:9]
airquality2[1:(31*nrow(airquality)),] <- 0

current_row <- 0

for (i in 1:nrow(airquality)){
  current_col <- 8
  airquality2[(current_row + 1):(current_row + 31),1:7] <- airquality[i,1:7]
  for (j in 1:31){
    airquality2[current_row + j,8:9] <- airquality[i,current_col:(current_col+1)]
    current_col <- current_col + 2
  }
  current_row <- current_row + 31
}

#Add day numbers
airquality2$Day <- rep(1:31, times=1806, each=1)

#order columns
airquality2 <- airquality2[c("provincia","municipio","estacion","magnitud","punto_muestreo","ano","mes","Day","D01","V01")]

#rename columns
colnames(airquality2)[colnames(airquality2)=="provincia"] <- "Province"
colnames(airquality2)[colnames(airquality2)=="municipio"] <- "Municipality"
colnames(airquality2)[colnames(airquality2)=="estacion"] <- "Station"
colnames(airquality2)[colnames(airquality2)=="magnitud"] <- "Magnitude"
colnames(airquality2)[colnames(airquality2)=="provincia"] <- "Province"
colnames(airquality2)[colnames(airquality2)=="punto_muestreo"] <- "Sampling_point"
colnames(airquality2)[colnames(airquality2)=="ano"] <- "Year"
colnames(airquality2)[colnames(airquality2)=="mes"] <- "Month"
colnames(airquality2)[colnames(airquality2)=="D01"] <- "Value"
colnames(airquality2)[colnames(airquality2)=="V01"] <- "Valid"


#change characters to numbers
airquality2$Province <- as.numeric(airquality2$Province)
airquality2$Municipality <- as.numeric(airquality2$Municipality)
airquality2$Station <- as.numeric(airquality2$Station)
airquality2$Magnitude <- as.numeric(airquality2$Magnitude)
airquality2$Year <- as.numeric(airquality2$Year)
airquality2$Month <- as.numeric(airquality2$Month)
airquality2$Day <- as.numeric(airquality2$Day)
airquality2$Value <- as.numeric(airquality2$Value)

#Delete non valid measurements
airquality2 <- airquality2[!(airquality2$Valid=="N"),]

#Unite to 1 date
airquality2 <- airquality2 %>% unite(Date, Year, Month, Day, sep = "/") 
airquality2$Date <- as.Date(airquality2$Date)


#Filter the data to Magnitudes (and choose station 4(here below))
# airqualityST4 <- filter(airquality2, Station==4)

#SO2 (Sulfur Dioxide)
SO2 <- filter(airquality2, Magnitude==1)
#CO (Carbon Monoxide)
CO <- filter(airquality2, Magnitude==6)
#NO (Nitrogen Monoxide)
NO <- filter(airquality2, Magnitude==7)
#NO2 (Nitrogen dioxide)
NO2 <- filter(airquality2, Magnitude==8)
#Particles <2.5 nanometer
PM2.5 <- filter(airquality2, Magnitude==9)
#Particles <10 nanometer
PM10 <- filter(airquality2, Magnitude==10)
#NOx (Nitrogen oxide)
NOx <- filter(airquality2, Magnitude==12)
#O3 (Ozone)
O3 <- filter(airquality2, Magnitude==14)
#TOL (Tolueno)
TOL <- filter(airquality2, Magnitude==20)
#BEN (Benzene)
BEN <- filter(airquality2, Magnitude==30)
#EBE (Ethylbenzene)
EBE <- filter(airquality2, Magnitude==35)
#MXY (Metaxylene)
MXY <- filter(airquality2, Magnitude==37)
#PXY (Paraxylene)
PXY <- filter(airquality2, Magnitude==38)
#OXY (Ortoxylene)
OXY <- filter(airquality2, Magnitude==39)
#TCH (Total hydrocarbons (hexane))
TCH <- filter(airquality2, Magnitude==42)
#CH4 (Methane)
CH4 <- filter(airquality2, Magnitude==43)
#NMHC (Hydrocarbons non-methane (hexane))
NMHC <- filter(airquality2, Magnitude==44)

##PLOTS

#plot of SO2
ggplot(data = SO2) + 
  geom_point(mapping = aes(x = Date, y = Value)) +
  geom_smooth(mapping = aes(x = Date, y = Value))+
  ggtitle("SO2")

#plot of CO
ggplot(data = CO) + 
  geom_point(mapping = aes(x = Date, y = Value)) +
  geom_smooth(mapping = aes(x = Date, y = Value))+
  ggtitle("CO")

#plot of NO
ggplot(data = NO) + 
  geom_point(mapping = aes(x = Date, y = Value)) +
  geom_smooth(mapping = aes(x = Date, y = Value))+
  ggtitle("NO")

#plot of NO2
ggplot(data = NO2) + 
  geom_point(mapping = aes(x = Date, y = Value)) +
  geom_smooth(mapping = aes(x = Date, y = Value))+
  ggtitle("NO2") 

#plot of PM2.5
ggplot(data = PM2.5) + 
  geom_point(mapping = aes(x = Date, y = Value)) +
  geom_smooth(mapping = aes(x = Date, y = Value))+
  ggtitle("PM2.5") 

#plot of PM10
ggplot(data = PM10) + 
  geom_point(mapping = aes(x = Date, y = Value)) +
  geom_smooth(mapping = aes(x = Date, y = Value))+
  ggtitle("PM10") 

#plot of NOx
ggplot(data = NOx) + 
  geom_point(mapping = aes(x = Date, y = Value)) +
  geom_smooth(mapping = aes(x = Date, y = Value))+
  ggtitle("NOx") 

#plot of O3
ggplot(data = O3) + 
  geom_point(mapping = aes(x = Date, y = Value)) +
  geom_smooth(mapping = aes(x = Date, y = Value))+
  ggtitle("O3") 

#plot of TOL
ggplot(data = TOL) + 
  geom_point(mapping = aes(x = Date, y = Value)) +
  geom_smooth(mapping = aes(x = Date, y = Value))+
  ggtitle("TOL") 

#plot of BEN
ggplot(data = BEN) + 
  geom_point(mapping = aes(x = Date, y = Value)) +
  geom_smooth(mapping = aes(x = Date, y = Value))+
  ggtitle("BEN") 

#plot of EBE
ggplot(data = EBE) + 
  geom_point(mapping = aes(x = Date, y = Value)) +
  geom_smooth(mapping = aes(x = Date, y = Value))+
  ggtitle("EBE") +
  ylim(0,5)

#plot of MXY
ggplot(data = MXY) + 
  geom_point(mapping = aes(x = Date, y = Value)) +
  geom_smooth(mapping = aes(x = Date, y = Value))+
  ggtitle("MXY") 

#plot of PXY
ggplot(data = PXY) + 
  geom_point(mapping = aes(x = Date, y = Value)) +
  geom_smooth(mapping = aes(x = Date, y = Value))+
  ggtitle("PXY") 

#plot of OXY
ggplot(data = OXY) + 
  geom_point(mapping = aes(x = Date, y = Value)) +
  geom_smooth(mapping = aes(x = Date, y = Value))+
  ggtitle("OXY") 

#plot of TCH
ggplot(data = TCH) + 
  geom_point(mapping = aes(x = Date, y = Value)) +
  geom_smooth(mapping = aes(x = Date, y = Value))+
  ggtitle("TCH") 

#plot of CH4
ggplot(data = CH4) + 
  geom_point(mapping = aes(x = Date, y = Value)) +
  geom_smooth(mapping = aes(x = Date, y = Value))+
  ggtitle("CH4") 

#plot of NMHC
ggplot(data = NMHC) + 
  geom_point(mapping = aes(x = Date, y = Value)) +
  geom_smooth(mapping = aes(x = Date, y = Value))+
  ggtitle("NMHC") 


#These plots give information about all the stations, we may filter for stations.





#AQI Calculation

target <- c(1,6,8,9,10,14)
airqualityAQI <- filter(airquality2, Magnitude %in% target)


airqualityAQI$Value_recal <- NA


airqualityAQI$Value_recal <- ifelse(airqualityAQI$Magnitude==1,airqualityAQI$Value_recal <-airqualityAQI$Value/2.62,
                              ifelse(airqualityAQI$Magnitude ==6,airqualityAQI$Value_recal <-airqualityAQI$Value/1.145,
                              ifelse(airqualityAQI$Magnitude ==8,airqualityAQI$Value_recal <-airqualityAQI$Value/1.88,
                              ifelse(airqualityAQI$Magnitude ==9,airqualityAQI$Value_recal <-airqualityAQI$Value,
                              ifelse(airqualityAQI$Magnitude ==10,airqualityAQI$Value_recal <-airqualityAQI$Value,
                              ifelse(airqualityAQI$Magnitude ==14,airqualityAQI$Value_recal <-airqualityAQI$Value/2.00,NA
                              ))))))
#Standard levels
airqualityAQI$Standard <- NA

airqualityAQI$Standard <- ifelse(airqualityAQI$Magnitude==1,airqualityAQI$Standard <- 200,
                              ifelse(airqualityAQI$Magnitude ==6,airqualityAQI$Standard <-9,
                              ifelse(airqualityAQI$Magnitude ==8,airqualityAQI$Standard <-120,
                              ifelse(airqualityAQI$Magnitude ==9,airqualityAQI$Standard <-25,
                              ifelse(airqualityAQI$Magnitude ==10,airqualityAQI$Standard <-50,
                              ifelse(airqualityAQI$Magnitude ==14,airqualityAQI$Standard <-100,NA
                                                                ))))))
#Calculate AQI
airqualityAQI$AQI <- airqualityAQI$Value_recal/airqualityAQI$Standard*100




#plot of AQI
ggplot(data = airqualityAQI) + 
  geom_point(mapping = aes(x = Date, y = AQI)) +
  geom_smooth(mapping = aes(x = Date, y = AQI))+
  ggtitle("AQI") 

#Now i want to check per day what the highest AQI is, because this is the actual AQI, but i don't know how.








