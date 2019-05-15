#Clean environment
rm(list=ls())


library(tidyverse)
library(XML)
require(XML)
library(writexl)
library("readxl")
library(dplyr)
library(lubridate)


Total <- read_excel("Cleaned_Total_2.xlsx")

Total <- Total %>% select(1:24)

NO2_max_per_day <- read_excel("Cleaned_NO2_max_hourly.xlsx")


Total_NO2 <- Total

Total_NO2$Avg_Max_NO2 <- NO2_max_per_day$avg_NO2
Total_NO2$Max_NO2 <- NO2_max_per_day$max_NO2
Total_NO2$Max_NO2_station <-NO2_max_per_day$max_NO2_station
Total_NO2$num_stations_NO2_max_50 <-NO2_max_per_day$num_stations_NO2_max_50
Total_NO2$num_stations_NO2_50_100 <-NO2_max_per_day$num_stations_NO2_50_100
Total_NO2$num_stations_NO2_100_180 <-NO2_max_per_day$num_stations_NO2_100_180
Total_NO2$num_stations_NO2_180_200 <-NO2_max_per_day$num_stations_NO2_180_200
Total_NO2$num_stations_NO2_200_400 <-NO2_max_per_day$num_stations_NO2_200_400
Total_NO2$num_stations_NO2_min_400 <-NO2_max_per_day$num_stations_NO2_min_400


# Make right structure

Total_NO2$Days_last_rain <- as.numeric(Total_NO2$Days_last_rain)
Total_NO2$Max_NO2_station <- as.numeric(Total_NO2$Max_NO2_station)




#Write to csv
write_xlsx(Total_NO2, "Cleaned_Total_NO2_max_hourly_2.xlsx")




## Make every variable numeric
NN <- Total_NO2


#Make everything a number
library(plyr)

NN$Daytype <- revalue(NN$Daytype,
                         c("Weekday" = "0", "Weekend" = "1"))
NN$Daytype <- as.numeric(NN$Daytype)


NN$Season <- revalue(NN$Season,
                        c("Winter" = "1", "Spring" = "2", "Summer"="3","Fall" = "4"))
NN$Season <- as.numeric(NN$Season)

NN1 <- NN
NN$day <- NULL
NN1$day <- NULL
NN1$Date <- NULL


#Correlations table
cor <- cor(NN1, use = "pairwise.complete.obs")


#Write to csv
write_xlsx(NN, "NN_2.xlsx")



plot(Total_NO2$Date,Total_NO2$users_Street_30)


#plot of users M30
ggplot(data = head(Total_NO2,2191)) +
  geom_point(mapping = aes(x = Date, y = Max_NO2, color=Season)) 
 





#Function multiplot

library(ggplot2)

multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  require(grid)
  
  # Make a list from the ... arguments and plotlist
  plots <- c(list(...), plotlist)
  
  numPlots = length(plots)
  
  # If layout is NULL, then use 'cols' to determine layout
  if (is.null(layout)) {
    # Make the panel
    # ncol: Number of columns of plots
    # nrow: Number of rows needed, calculated from # of cols
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                     ncol = cols, nrow = ceiling(numPlots/cols))
  }
  
  if (numPlots==1) {
    print(plots[[1]])
    
  } else {
    # Set up the page
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))
    
    # Make each plot, in the correct location
    for (i in 1:numPlots) {
      # Get the i,j matrix positions of the regions that contain this subplot
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
      
      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}



#Plots NO2, T_max, Wind
p1 <- ggplot(data =head(Total_NO2,2191),aes(x = Date, y = Avg_Max_NO2)) +
  ylab("Max_NO2")+
  # geom_line()+
  stat_smooth(method="gam",formula=y~s(x,k=100),se=FALSE)

p2 <- ggplot(data =head(Total_NO2,2191),aes(x = Date, y = Avg_T)) +
  # geom_line()+
  stat_smooth(method="gam",formula=y~s(x,k=100),se=FALSE)

p3 <- ggplot(Total_NO2, aes(x=Date, y=Avg_Streak))+
  # geom_line()+
  stat_smooth(method="gam",formula=y~s(x,k=100),se=FALSE)

p4 <- ggplot(Total_NO2, aes(x=Date, y=users_Street_30))+
  #   geom_point()+
  stat_smooth(method="gam",formula=y~s(x,k=1000),se=FALSE)
  


multiplot(p1,p2,p3,p4,cols=1)


#Correlation




#Correlation plots

#T
ggplot(data =head(Total_NO2,2191),aes(x = Avg_T , y = Avg_Max_NO2)) +
  ylab("Max_NO2")+
  geom_point()+
  stat_smooth(method="gam",formula=y~s(x,k=200),se=FALSE)

#Wind
ggplot(data =head(Total_NO2,2191),aes(x = Avg_Streak, y = Avg_Max_NO2 )) +
  ylab("Max_NO2")+
  geom_point()+
  stat_smooth(method="gam",formula=y~s(x,k=200),se=FALSE)

#Users Street 30
ggplot(data =head(Total_NO2,2191),aes(x = users_Street_30 , y =Avg_Max_NO2 )) +
  ylab("Max_NO2")+
  geom_point()+
  stat_smooth(method="gam",formula=y~s(x,k=200),se=FALSE)



#Rain
q1 <- ggplot(data =head(Total_NO2,2191),aes(x = Avg_Max_NO2, y = Rain)) +
  xlab("Max_NO2")+
  geom_point()
  # stat_smooth(method="gam",formula=y~s(x,k=200),se=FALSE)

q2 <- ggplot(data =head(Total_NO2,2191),aes(x = Avg_Max_NO2, y = Rain_ml)) +
  xlab("Max_NO2")+
  geom_point()+
  stat_smooth(method="gam",formula=y~s(x,k=200),se=FALSE)

multiplot(q1,q2,cols=2)


#Random plots
# ggplot(Total_NO2, aes(x=Date, y=users_Street30))+
#   geom_point()+
#   stat_smooth(method="gam",formula=y~s(x,k=1000),se=FALSE)


# ggplot(Total_NO2, aes(x=Date, y=Rain_ml))+
#   geom_line()+
#   stat_smooth(method="gam",formula=y~s(x,k=400),se=FALSE)




