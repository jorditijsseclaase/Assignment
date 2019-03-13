#Read weather data

rm(list=ls())

library(tidyverse)
library(chron)
library(writexl)

#load data
library("readxl")

weather <- read_excel("Cleaned_Weather2013-2018.xlsx")


#PLOTS
#plot of average Temperature (2013-2018)
ggplot(data = weather) +
  geom_point(mapping = aes(x = Date, y = Avg_T, color=Season)) +
  ggtitle("Average temperature (2013-2018)")


#plot of average Wind velocity (2013-2018)
ggplot(data = weather) +
  geom_point(mapping = aes(x = Date, y = Avg_vel)) +
  ggtitle("Average Wind velocity (2013-2018)")

