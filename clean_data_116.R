#Air quality real time data 
# Works the same as 108 (hourly data)

#Clean environmemnt
rm(list=ls())


library(tidyverse)
library(XML)
require(XML)

#loading data

pg <- xmlParse("Data/116.xml")
airqualityRT <- xmlToList(pg)
airqualityRT <- do.call(rbind, airqualityRT)
airqualityRT <- as.data.frame(airqualityRT)

#Tidying data
rownames(airqualityRT) <- NULL

airqualityRT2 <- airqualityRT[FALSE,1:10]
airqualityRT2[1:(24*nrow(airqualityRT)),] <- 0

current_row <- 0

for (i in 1:nrow(airqualityRT)){
  current_col <- 9
  airqualityRT2[(current_row + 1):(current_row + 24),1:8] <- airqualityRT[i,1:8]
  for (j in 1:24){
    airqualityRT2[current_row + j,9:10] <- airqualityRT[i,current_col:(current_col+1)]
    current_col <- current_col + 2
  }
  current_row <- current_row + 24
}

#Add day numbers
airqualityRT2$Hr <- rep(1:24, each=nrow(airqualityRT))


#order columns
airqualityRT2 <- airqualityRT2[c("provincia","municipio","estacion","magnitud","punto_muestreo","ano","mes","dia","Hr","H01","V01")]

#rename columns
colnames(airqualityRT2)[colnames(airqualityRT2)=="provincia"] <- "Province"
colnames(airqualityRT2)[colnames(airqualityRT2)=="municipio"] <- "Municipality"
colnames(airqualityRT2)[colnames(airqualityRT2)=="estacion"] <- "Station"
colnames(airqualityRT2)[colnames(airqualityRT2)=="magnitud"] <- "Magnitude"
colnames(airqualityRT2)[colnames(airqualityRT2)=="provincia"] <- "Province"
colnames(airqualityRT2)[colnames(airqualityRT2)=="punto_muestreo"] <- "Sampling_point"
colnames(airqualityRT2)[colnames(airqualityRT2)=="ano"] <- "Year"
colnames(airqualityRT2)[colnames(airqualityRT2)=="mes"] <- "Month"
colnames(airqualityRT2)[colnames(airqualityRT2)=="dia"] <- "Day"
colnames(airqualityRT2)[colnames(airqualityRT2)=="H01"] <- "Value"
colnames(airqualityRT2)[colnames(airqualityRT2)=="V01"] <- "Valid"


#change characters to numbers
airqualityRT2$Province <- as.numeric(airqualityRT2$Province)
airqualityRT2$Municipality <- as.numeric(airqualityRT2$Municipality)
airqualityRT2$Station <- as.numeric(airqualityRT2$Station)
airqualityRT2$Magnitude <- as.numeric(airqualityRT2$Magnitude)
airqualityRT2$Year <- as.numeric(airqualityRT2$Year)
airqualityRT2$Month <- as.numeric(airqualityRT2$Month)
airqualityRT2$Day <- as.numeric(airqualityRT2$Day)
airqualityRT2$Hr <- as.numeric(airqualityRT2$Hr)
airqualityRT2$Value <- as.numeric(airqualityRT2$Value)

#Delete non valid measurements
airqualityRT2 <- airqualityRT2[!(airqualityRT2$Valid=="N"),]

#Unite to 1 date
airqualityRT2 <- airqualityRT2 %>% unite(Date, Year, Month, Day, sep = "/") 
airqualityRT2$Date <- as.Date(airqualityRT2$Date)

#Filter the data to Magnitudes (and choose station 4(here below))
# airqualityST4 <- filter(airqualityRT2, Station==4)

#SO2 (Sulfur Dioxide)
SO2 <- filter(airqualityRT2, Magnitude==1)
#CO (Carbon Monoxide)
CO <- filter(airqualityRT2, Magnitude==6)
#NO (Nitrogen Monoxide)
NO <- filter(airqualityRT2, Magnitude==7)
#NO2 (Nitrogen dioxide)
NO2 <- filter(airqualityRT2, Magnitude==8)
#Particles <2.5 nanometer
PM2.5 <- filter(airqualityRT2, Magnitude==9)
#Particles <10 nanometer
PM10 <- filter(airqualityRT2, Magnitude==10)
#NOx (Nitrogen oxide)
NOx <- filter(airqualityRT2, Magnitude==12)
#O3 (Ozone)
O3 <- filter(airqualityRT2, Magnitude==14)
#TOL (Tolueno)
TOL <- filter(airqualityRT2, Magnitude==20)
#BEN (Benzene)
BEN <- filter(airqualityRT2, Magnitude==30)
#EBE (Ethylbenzene)
EBE <- filter(airqualityRT2, Magnitude==35)
#MXY (Metaxylene)
MXY <- filter(airqualityRT2, Magnitude==37)
#PXY (Paraxylene)
PXY <- filter(airqualityRT2, Magnitude==38)
#OXY (Ortoxylene)
OXY <- filter(airqualityRT2, Magnitude==39)
#TCH (Total hydrocarbons (hexane))
TCH <- filter(airqualityRT2, Magnitude==42)
#CH4 (Methane)
CH4 <- filter(airqualityRT2, Magnitude==43)
#NMHC (Hydrocarbons non-methane (hexane))
NMHC <- filter(airqualityRT2, Magnitude==44)

##PLOTS

#plot of SO2
ggplot(data = SO2) + 
  geom_point(mapping = aes(x = Hr, y = Value)) +
  geom_smooth(mapping = aes(x = Hr, y = Value))+
  ggtitle("SO2")

#plot of CO
ggplot(data = CO) + 
  geom_point(mapping = aes(x = Hr, y = Value)) +
  geom_smooth(mapping = aes(x = Hr, y = Value))+
  ggtitle("CO")

#plot of NO
ggplot(data = NO) + 
  geom_point(mapping = aes(x = Hr, y = Value)) +
  geom_smooth(mapping = aes(x = Hr, y = Value))+
  ggtitle("NO")

#plot of NO2
ggplot(data = NO2) + 
  geom_point(mapping = aes(x = Hr, y = Value)) +
  geom_smooth(mapping = aes(x = Hr, y = Value))+
  ggtitle("NO2") 

#plot of PM2.5
ggplot(data = PM2.5) + 
  geom_point(mapping = aes(x = Hr, y = Value)) +
  geom_smooth(mapping = aes(x = Hr, y = Value))+
  ggtitle("PM2.5") 

#plot of PM10
ggplot(data = PM10) + 
  geom_point(mapping = aes(x = Hr, y = Value)) +
  geom_smooth(mapping = aes(x = Hr, y = Value))+
  ggtitle("PM10") 

#plot of NOx
ggplot(data = NOx) + 
  geom_point(mapping = aes(x = Hr, y = Value)) +
  geom_smooth(mapping = aes(x = Hr, y = Value))+
  ggtitle("NOx") 

#plot of O3
ggplot(data = O3) + 
  geom_point(mapping = aes(x = Hr, y = Value)) +
  geom_smooth(mapping = aes(x = Hr, y = Value))+
  ggtitle("O3") 

#plot of TOL
ggplot(data = TOL) + 
  geom_point(mapping = aes(x = Hr, y = Value)) +
  geom_smooth(mapping = aes(x = Hr, y = Value))+
  ggtitle("TOL") 

#plot of BEN
ggplot(data = BEN) + 
  geom_point(mapping = aes(x = Hr, y = Value)) +
  geom_smooth(mapping = aes(x = Hr, y = Value))+
  ggtitle("BEN") 

#plot of EBE
ggplot(data = EBE) + 
  geom_point(mapping = aes(x = Hr, y = Value)) +
  geom_smooth(mapping = aes(x = Hr, y = Value))+
  ggtitle("EBE") 

#plot of MXY
ggplot(data = MXY) + 
  geom_point(mapping = aes(x = Hr, y = Value)) +
  geom_smooth(mapping = aes(x = Hr, y = Value))+
  ggtitle("MXY") 

#plot of PXY
ggplot(data = PXY) + 
  geom_point(mapping = aes(x = Hr, y = Value)) +
  geom_smooth(mapping = aes(x = Hr, y = Value))+
  ggtitle("PXY") 

#plot of OXY
ggplot(data = OXY) + 
  geom_point(mapping = aes(x = Hr, y = Value)) +
  geom_smooth(mapping = aes(x = Hr, y = Value))+
  ggtitle("OXY") 

#plot of TCH
ggplot(data = TCH) + 
  geom_point(mapping = aes(x = Hr, y = Value)) +
  geom_smooth(mapping = aes(x = Hr, y = Value))+
  ggtitle("TCH") 

#plot of CH4
ggplot(data = CH4) + 
  geom_point(mapping = aes(x = Hr, y = Value)) +
  geom_smooth(mapping = aes(x = Hr, y = Value))+
  ggtitle("CH4") 

#plot of NMHC
ggplot(data = NMHC) + 
  geom_point(mapping = aes(x = Hr, y = Value)) +
  geom_smooth(mapping = aes(x = Hr, y = Value))+
  ggtitle("NMHC") 


#These plots give information about all the stations, we may filter for stations.






