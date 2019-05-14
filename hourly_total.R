#hourly total analysis

#Clean environment
rm(list=ls())

library(readxl)
library(writexl)
library(ggplot2)
library(dplyr)

weather_hourly <- read_excel("Cleaned_Weather_hourly.xlsx") 
traffic_hourly <- read_excel("Cleaned_traffic_hourly.xlsx")
NO2_hourly <- read_excel("Cleaned_NO2_hourly_2019.xlsx")

# NO2_hourly=as.data.frame(NO2_hourly)

NO2_hourly$day <- NULL
NO2_hourly$Daytype <- NULL

colnames(NO2_hourly)[colnames(NO2_hourly)=="mean"] <- "NO2"


NO2_hourly$Hour[NO2_hourly$Hour==24] <- 0

#Convert NO2 dataframe to right time (24 to 0)
library(lubridate)

NO2_hourly$Date[NO2_hourly$Hour==0] <- NO2_hourly$Date[NO2_hourly$Hour==0] + days(1)



#subset to get same dates
traffic_hourly2 <- subset(traffic_hourly, RunDate> "2019-03-28" & RunDate<"2019-05-01")
weather_hourly2 <- subset(weather_hourly,Date>"2019-03-28" & Date<"2019-05-01")
NO2_hourly2 <- subset(NO2_hourly, Date> "2019-03-28" & Date<"2019-05-01")

weather_hourly2$Date <- NULL
weather_hourly2$Hour <- NULL
NO2_hourly2$Date <- NULL
NO2_hourly2$Hour <- NULL



#bind together
Total <- cbind(traffic_hourly2,weather_hourly2,NO2_hourly2)

#rename columns traffic
colnames(Total)[colnames(Total)=="Temperature  [2 m above gnd]"] <- "T"
colnames(Total)[colnames(Total)=="Total Precipitation (high resolution)  [sfc]"] <- "Rain_ml"
colnames(Total)[colnames(Total)== "Wind Speed  [10 m above gnd]"] <- "Wind"
colnames(Total)[colnames(Total)=="Wind Direction  [10 m above gnd]"] <- "Wind_dir"



#Rain (y/n)
Total$Rain <- ifelse(Total$Rain_ml>0, Total$Rain<-"1" ,"0")
Total$Rain <- as.numeric(Total$Rain)



#Calculate max NO2 per day
Max_NO2 <- Total %>%
  group_by(RunDate) %>%
  summarise(Max_NO2_day = max(NO2,na.rm=TRUE)) %>%
  ungroup()


# ifelse(Total$RunDate==Max_NO2$RunDate,Total$Max_NO2_day <- Max_NO2$Max_NO2_day,0)
# 
# 
# Total$Max_NO2_day <- Max_NO2$Max_NO2_day[Total$RunDate==Max_NO2$RunDate]
# 
# NO2_hourly$Date[NO2_hourly$Hour==0] <- NO2_hourly$Date[NO2_hourly$Hour==0] 







#write to excel
write_xlsx(Total, "NN_hourly.xlsx")

write_xlsx(Max_NO2, "NN_max_NO2.xlsx")



#multiplot function
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




#plots

ggplot(data =Total,aes(x = Hour, y = NO2)) +
  geom_point()+
  stat_smooth(method="gam",formula=y~s(x,k=20),se=FALSE)+
  ylab("NO2 concentration")

q1 <- ggplot(data =Total,aes(x = Hour, y = NO2,color=Daytype)) +
  geom_point()+
  stat_smooth(method="gam",formula=y~s(x,k=20),se=FALSE)+
  ylab("NO2 concentration")


q2 <- ggplot(data =Total,aes(x = Hour, y = Avg_Total_Veh_M30,color=Daytype)) +
  geom_point()+
  stat_smooth(method="gam",formula=y~s(x,k=20),se=FALSE)+
  ylab("Total vehicles M30")

multiplot(q1,q2,cols=1)

ggplot(data =Total,aes(x = Hour, y = T)) +
  geom_point()+
  stat_smooth(method="gam",formula=y~s(x,k=20),se=FALSE)


## Correlation plots

ggplot(data =Total,aes(x = NO2, y = T)) +
  geom_point()+
  stat_smooth(method="gam",formula=y~s(x,k=20),se=FALSE)
  # ylab("T")



ggplot(data =Total,aes(x = NO2, y = Wind)) +
  geom_point()+
  stat_smooth(method="gam",formula=y~s(x,k=20),se=FALSE)+
  ylab("Wind speed")



ggplot(data =Total,aes(x = NO2, y = Avg_Total_Veh_M30)) +
  geom_point()+
  stat_smooth(method="gam",formula=y~s(x,k=100),se=FALSE)+
  ylab("Vehicles on M30")




p1 <- ggplot(data =Total,aes(x = NO2, y = Rain)) +
  geom_point()+
  ylab("Rain")

p2 <- ggplot(data =Total,aes(x = NO2, y = Rain_ml)) +
  geom_point()+
  stat_smooth(method="gam",formula=y~s(x,k=100),se=FALSE)+
  ylab("Rain_ml")

multiplot(p1,p2,cols=2)






