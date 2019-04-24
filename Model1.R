#Clean environment
rm(list=ls())


library(tidyverse)
library(XML)
require(XML)
library(writexl)
library("readxl")
library(dplyr)
library(lubridate)

library(mgcv)

Total <- read_excel("NN.xlsx")

Total$Avg_Max_NO2 <- as.numeric(Total$Avg_Max_NO2)

#MODEL

# NO2 with wind speed
mod1 = gam(Avg_Max_NO2~Avg_Streak+s(Total$DayNr, k=40, bs="ps"), data=Total)
summary(mod1)
plot(mod1)