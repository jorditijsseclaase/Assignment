#Traffic data M30 hourly

#Clean environment
rm(list=ls())

library(readxl)
library(writexl)
library(ggplot2)

#load data
traffic_hourly <- read.csv("RT_traffic_hourly 2.csv")
weather_hourly <- read_excel("Cleaned_Weather_hourly.xlsx") #only from 15-4-2019


library(dplyr)
library(tidyr)


traffic_hourly2 <- traffic_hourly %>%
  separate(Run_Date, c("RunDate","Hour"), "T")


traffic_hourly2$Hour <- substr(traffic_hourly2$Hour, start = 1, stop = 2)

traffic_hourly2$RunDate <- as.Date(traffic_hourly2$RunDate)
traffic_hourly2$Hour <- as.numeric(traffic_hourly2$Hour)

# traffic_hourly2 <- subset(traffic_hourly2, RunDate> "2019-03-27")



#Week day or weekend day
traffic_hourly2$day <- weekdays.Date(traffic_hourly2$RunDate, abbr = TRUE)
traffic_hourly2$Daytype <- ifelse(traffic_hourly2$day=="za" | traffic_hourly2$day=="zo",
                                  traffic_hourly2$Daytype<- "Weekend","Weekday")


#write to excel file
write_xlsx(traffic_hourly2, "Cleaned_traffic_hourly.xlsx")

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






#Analysis 
ggplot(data=traffic_hourly2, aes(x=Hour, y=Avg_Total_Veh_M30))+
  geom_point()+
  stat_smooth(method="gam",formula=y~s(x,k=20),se=FALSE)+
  ylab("Total vehicles M30")


ggplot(data=traffic_hourly2, aes(x=Hour, y=Avg_Total_Veh_M30, color=Daytype))+
  geom_point()+
  stat_smooth(method="gam",formula=y~s(x,k=20),se=FALSE)+
  ylab("Total vehicles M30")












