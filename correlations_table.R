rm(list=ls())


library(tidyverse)
library(XML)
require(XML)
library(writexl)
library("readxl")



Total <- read_excel("Cleaned_Total.xlsx")



#Make everything a number
# library(plyr)

Total$Daytype <- revalue(Total$Daytype,
                c("Weekday" = "0", "Weekend" = "1"))
Total$Daytype <- as.numeric(Total$Daytype)


Total$Season <- revalue(Total$Season,
               c("Winter" = "1", "Spring" = "2", "Summer"="3","Fall" = "4"))
Total$Season <- as.numeric(Total$Season)


Total$day <- NULL
Total$Date <- NULL


cor <- cor(Total, use = "pairwise.complete.obs")


#plot month to users m30
ggplot(data = Total) + 
  geom_point(mapping = aes(x=Month, y=users_Street30))+
  ggtitle("Users street 30 to Month")





