# Traffic. Daily data years 2001-2018  (2018)

#Clean environmemnt
rm(list=ls())

#load packages
library(tidyverse)
library(XML)
require(XML)
library(writexl)
library("readxl")

#read file
traffic <- read_excel("Cleaned_Traffic2013-2018.xlsx")

